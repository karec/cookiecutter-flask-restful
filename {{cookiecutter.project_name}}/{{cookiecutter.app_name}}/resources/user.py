from flask import request
from flask_restful import Resource
from sqlalchemy.orm.exc import NoResultFound

from {{cookiecutter.app_name}}.extensions import marshmallow, db
from {{cookiecutter.app_name}}.models import User


class UserSchema(marshmallow.ModelSchema):

    class Meta:
        model = User
        fields = ('username', 'email')


class UserDetail(Resource):

    schema = UserSchema()

    def get(self, user_id):
        try:
            user = db.session.query(User).filter_by(id=user_id).one()
            data, errors = self.schema.dump(user)

            if errors:
                return errors, 422

            return data
        except NoResultFound:
            return {"message": "User not found"}, 404


class UserList(Resource):

    def get(self):
        schema = UserSchema(many=True)
        users = db.session.query(User).all()
        results, errors = schema.dump(users)

        if errors:
            return errors, 422

        return results

    def post(self):
        schema = UserSchema()

        try:
            user, errors = schema.load(request.get_json())
            if errors:
                return errors, 422

            db.session.add(user)
            db.session.commit()
            return schema.dump(user).data, 201
        except Exception as e:
            db.session.rollback()
            return str(e), 500
