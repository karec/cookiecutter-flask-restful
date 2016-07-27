from flask import Blueprint, jsonify
from flask_restful import Api

from {{cookiecutter.app_name}}.common.exceptions import SchemaValidationError
from {{cookiecutter.app_name}}.resources import UserDetail, UserList

api_bp = Blueprint('api', __name__, url_prefix='/v1')
api = Api(api_bp)

api.add_resource(UserDetail, '/users/<int:user_id>')
api.add_resource(UserList, '/users')


@api_bp.errorhandler(SchemaValidationError)
def handle_invalide_schema(error):
    response = jsonify(error.to_dict())
    response.status_code = error.status_code
    return response
