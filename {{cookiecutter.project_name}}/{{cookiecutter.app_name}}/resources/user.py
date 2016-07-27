from flask import request
from marshmallow import fields
from flask_restful import Resource
from sqlalchemy.exc import SQLAlchemyError

from {{cookiecutter.app_name}}.common.schema_utils import BaseAPISchema
from {{cookiecutter.app_name}}.extensions import db
from {{cookiecutter.app_name}}.models import User


class UserSchema(BaseAPISchema):

    email = fields.Email(required=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email')


class UserDetail(Resource):

    schema = UserSchema()

    def get(self, user_id):
        user = User.query.get_or_404(user_id)
        data = self.schema.dump(user)
        return data

    def put(self, user_id):
        user = User.query.get_or_404(user_id)
        updated = self.schema.load(request.get_json(), instance=user, partial=True)
        db.session.commit()
        return self.schema.dump(updated)

    def delete(self, user_id):
        user = User.query.get_or_404(user_id)
        db.session.delete(user)
        db.session.commit()
        return {"message": "OK"}, 202


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
            return schema.dump(user), 201
        except SQLAlchemyError as e:
            db.session.rollback()
            return str(e), 500
