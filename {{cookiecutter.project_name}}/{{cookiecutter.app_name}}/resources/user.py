from flask import jsonify, request
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
            return jsonify(self.schema.dump(user))
        except NoResultFound:
            return jsonify({"message": "User not found"}), 404

    def post(self):
        data, errors = self.schema.load(reuest.get_json())
        if errors:
            return jsonify(errors), 422

        user = User(**data)
        db.session.add(user)
        db.session.commit()

        return jsonify(self.schema.dump(user)), 201


class UserList(Resource):

    schema = UserSchema(many=True)

    def get(self):
        users = db.session.query(User).all()
        results = self.schema.dump(users)

        return jsonify(results)
