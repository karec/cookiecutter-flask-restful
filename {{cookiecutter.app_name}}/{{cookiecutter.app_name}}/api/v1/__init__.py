from flask import Blueprint
from flask_restful import Api

from {{cookiecutter.app_name}}.api.v1.user import UserResource, UserList

API_VERSION = 1

blueprint = Blueprint(f'v{API_VERSION}', __name__)
api = Api(blueprint, prefix=f"/api/v{API_VERSION}")

api.add_resource(UserResource, '/users/<int:user_id>')
api.add_resource(UserList, '/users')
