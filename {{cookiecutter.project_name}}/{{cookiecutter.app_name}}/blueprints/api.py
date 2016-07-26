from flask import Blueprint
from flask_restful import Api

from {{cookiecutter.app_name}}.resources import UserDetail, UserList

api_bp = Blueprint('api', __name__, url_prefix='/v1')
api = Api(api_bp)

api.add_resource(UserDetail, '/users/<int:id>')
api.add_resource(UserList, '/users')
