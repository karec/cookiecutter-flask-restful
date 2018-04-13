from flask_restful import Api
from flask import Blueprint, jsonify
from marshmallow.exceptions import ValidationError

from {{cookiecutter.app_name}}.api.resources import UserResource, UserList


blueprint = Blueprint('api', __name__, url_prefix='/api/v1')
api = Api(blueprint)


api.add_resource(UserResource, '/users/<int:user_id>')
api.add_resource(UserList, '/users')


@blueprint.errorhandler(ValidationError)
def handle_validation_error(error):
    return jsonify(error.messages), 422
