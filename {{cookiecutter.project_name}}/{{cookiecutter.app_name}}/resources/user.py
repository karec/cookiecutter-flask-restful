from flask import request
from marshmallow import fields
from flask_restful import Resource
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

from {{cookiecutter.app_name}}.common.schema_utils import BaseAPISchema
from {{cookiecutter.app_name}}.extensions import db
from {{cookiecutter.app_name}}.models import User


class UserSchema(BaseAPISchema):

    email = fields.Email()

    class Meta:
        model = User
        fields = ('username', 'email')


class UserDetail(Resource):

    schema = UserSchema()

    def get(self, user_id):
        try:
            user = User.query.get_or_404(user_id)
            data = self.schema.dump(user)
            return data
        except NoResultFound:
            return {"message": "User not found"}, 404


class UserList(Resource):

    def get(self):
        schema = UserSchema(many=True)
        users = User.query.all()
        results = schema.dump(users)
        return results

    def post(self):
        schema = UserSchema()

        try:
            user = schema.load(request.get_json())
            db.session.add(user)
            db.session.commit()
            return schema.dump(user).data, 201
        except SQLAlchemyError as e:
            db.session.rollback()
            return str(e), 500
