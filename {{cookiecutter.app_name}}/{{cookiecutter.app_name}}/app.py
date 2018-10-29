import json
import os
import logging
from logging.config import dictConfig

from flask import Flask, jsonify
from healthcheck import HealthCheck
from marshmallow import ValidationError

from {{cookiecutter.app_name}} import auth, api
from {{cookiecutter.app_name}}.config import LOGGING
from {{cookiecutter.app_name}}.exceptions import APIError, HTTP_UNPROCESSABLE_ENTITY, convert_error_dict_to_list
from {{cookiecutter.app_name}}.extensions import db, jwt, ma, migrate


def create_app(config='config.json', testing=False, cli=False):
    """Application factory, used to create application
    """
    app = Flask('{{cookiecutter.app_name}}')

    configure_app(app, testing, config)
    configure_extensions(app, cli)
    register_errorhandlers(app)
    register_blueprints(app)
    register_healthcheck(app)
    register_teardown_signal(app)
    return app


def load_json_config(app, config_filename):
    """ Adds support for eventador's config.json format """
    filename = os.path.join(app.config.root_path, config_filename)
    with open(filename) as json_file:
        obj = json.load(json_file)
        keys = list(obj.keys())
        for key in keys:
            obj[key.upper()] = obj[key]
        app.config.from_object(obj)
        # save off the config as well
        app.config['EV_CONFIG'] = obj

    def setup_db_configs(app, config):
        host = os.getenv('DB_HOST', config.get('host', None))
        port = os.getenv('DB_PORT', config.get('port', None))
        database = os.getenv('DB_DATABASE', config.get('database', None))
        user = os.getenv('DB_USER', config.get('user', None))
        passwd = os.getenv('DB_PASSWORD', config.get('password', None))
        app.config['SQLALCHEMY_DATABASE_URI'] = f"postgresql://{user}:{passwd}@{host}:{port}/{database}"
        app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    setup_db_configs(app, obj.get('db_config', {}))
    return obj


def configure_app(app, testing=False, config=None):
    """set configuration for application
    """
    # Trick: call app.logger before config app.logger by dictConfig.
    app.logger.info("Init flask app ...")
    dictConfig(LOGGING)
    logger = logging.getLogger("api.request")

    # load our config.json
    load_json_config(app, config)

    # default configuration
    app.config.from_object('{{cookiecutter.app_name}}.config')

    if testing is True:
        # override with testing config
        app.config.from_object('{{cookiecutter.app_name}}.configtest')
    else:
        # override with env variable, fail silently if not set
        app.config.from_envvar("{{cookiecutter.app_name|upper}}_CONFIG", silent=True)

def register_errorhandlers(app):
    """Register error handlers."""

    # Custom exceptions
    @app.errorhandler(APIError)
    def handle_invalid_usage(error):
        msg = f"APIError: {error}"
        app.logger.error(msg)
        response = jsonify(error.to_dict())
        response.status_code = error.status_code
        return response

    @app.errorhandler(ValidationError)
    def handle_validation_error(error):
        msg = convert_error_dict_to_list(error.args[0])
        app.logger.error(f"Validation error: {msg}")
        response = jsonify(dict(errors=msg))
        response.status_code = HTTP_UNPROCESSABLE_ENTITY
        return response


def configure_extensions(app, cli):
    """configure flask extensions
    """
    db.init_app(app)
    jwt.init_app(app)
    ma.init_app(app)

    if cli is True:
        migrate.init_app(app, db)


def register_teardown_signal(app):
    from {{cookiecutter.app_name}}.extensions import db

    @app.teardown_appcontext
    def remove_session(response):  # pylint: disable=W0612
        db.session.remove()
        return response


def register_blueprints(app):
    """register all blueprints for application
    """
    from {{cookiecutter.app_name}}.api import register_api
    register_api(app)
    app.register_blueprint(auth.views.blueprint)


def register_healthcheck(app):
    HealthCheck(app, '/health')


if __name__ == '__main__':
    app = create_app()
