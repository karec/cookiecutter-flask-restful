from {{cookiecutter.app_name}}.models import User
from {{cookiecutter.app_name}}.extensions import ma, db


class UserSchema(ma.ModelSchema):

    id = ma.Int(dump_only=True)
    password = ma.String(load_only=True, required=True)

    class Meta:
        model = User
        sqla_session = db.session
