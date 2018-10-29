from flask_jwt_extended import jwt_required

from {{cookiecutter.app_name}}.commons.resource import BaseResource
from {{cookiecutter.app_name}}.models import User
from {{cookiecutter.app_name}}.extensions import ma, db
from {{cookiecutter.app_name}}.commons.pagination import paginate


# Note, when developing v2, v3, etc., we would use the same model, just extend the schema and resource for the
# output we desire.  If we do want to change the model, then all available versions must be changes to accomidate
# the new model so that we don't break clients.

class UserSchema(ma.ModelSchema):
    password = ma.String(load_only=True, required=True)

    class Meta:
        model = User
        sqla_session = db.session


class UserResource(BaseResource):
    """Single object resource
    """
    method_decorators = [jwt_required]
    schema = UserSchema

    def get(self, user_id):
        user = User.query.get_or_404(user_id)
        return self.serialize(user)

    def put(self, user_id):
        data = self.deserialize(partial=True)
        user = User.query.get_or_404(user_id)
        return self.serialize(data, instance=user)

    def delete(self, user_id):
        user = User.query.get_or_404(user_id)
        user.delete()
        return {'results': "success"}


class UserList(BaseResource):
    """Creation and get_all
    """
    method_decorators = [jwt_required]
    schema = UserSchema

    def get(self):
        query = User.query
        return paginate(query, self.schema)

    def post(self):
        user = self.deserialize()
        user.save()
        return self.serialize(user), 201
