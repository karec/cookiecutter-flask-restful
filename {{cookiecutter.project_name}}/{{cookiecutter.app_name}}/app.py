import logging.config


from flask import Flask

from {{cookiecutter.app_name}} import views
from {{cookiecutter.app_name}}.extensions import db, marshmallow

DEFAULT_BLUEPRINTS = (
    views.api
)


__all__ = ['create_app']


def create_app(blueprints=None, testing=False):
    """Create flask app and return it"""
    if blueprints is None:
        blueprints = DEFAULT_BLUEPRINTS

    app = Flask(
        '{{cookiecutter.app_name}}',
        instance_path='{{cookiecutter.app_instance_path}}',
        instance_relative_config=True
    )

    configure_app(app, testing=testing)
    configure_db(app)
    configure_blueprints(app, blueprints)
    configure_marshmallow(app)
    configure_logging(app)

    return app


def configure_app(app, testing):
    """Initialize configuration"""
    app.config.from_object('{{cookiecutter.app_name}}.config')

    if testing is True:
        app.config.from_object('{{cookiecutter.app_name}}.test_config')
    else:
        app.config.from_pyfile('config.cfg', silent=True)


def configure_db(app):
    """Initialize database"""
    db.init_app(app)


def configure_blueprints(app, blueprints):
    """Configure blueprints in views"""
    for blueprint in blueprints:
        if isinstance(blueprint, str):
            blueprint = getattr(views, blueprint)
        app.register_blueprint(blueprint)


def configure_marshmallow(app):
    """Initialize marshmallow"""
    marshmallow.init_app(app)


def configure_logging(app):
    """Configure logging"""
    logging.config.dictConfig(app.config['LOGGING_CONFIG'])
