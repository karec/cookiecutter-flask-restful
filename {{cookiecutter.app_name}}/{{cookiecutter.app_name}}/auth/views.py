from flask import request, jsonify, Blueprint, current_app as app
from flask_jwt_extended import (
    create_access_token,
    create_refresh_token,
    jwt_required,
    jwt_refresh_token_required,
    get_jwt_identity,
    get_raw_jwt
)

from {{cookiecutter.app_name}}.models import User
from {{cookiecutter.app_name}}.extensions import pwd_context, jwt
from {{cookiecutter.app_name}}.auth.helpers import (
    revoke_token,
    is_token_revoked,
    add_token_to_database
)


blueprint = Blueprint('auth', __name__, url_prefix='/auth')


@blueprint.route('/login', methods=['POST'])
def login():
    """Authenticate user and return token
    """
    if not request.is_json:
        return jsonify({"msg": "Missing JSON in request"}), 400

    username = request.json.get('username', None)
    password = request.json.get('password', None)
    if not username or not password:
        return jsonify({"msg": "Missing username or password"}), 400

    user = User.query.filter_by(username=username).first()
    if user is None or not pwd_context.verify(password, user.password):
        return jsonify({"msg": "Bad credentials"}), 400

    access_token = create_access_token(identity=user.id)
    refresh_token = create_refresh_token(identity=user.id)
    add_token_to_database(access_token, app.config['JWT_IDENTITY_CLAIM'])
    add_token_to_database(refresh_token, app.config['JWT_IDENTITY_CLAIM'])

    ret = {
        'access_token': access_token,
        'refresh_token': refresh_token
    }
    return jsonify(ret), 200


@blueprint.route('/refresh', methods=['POST'])
@jwt_refresh_token_required
def refresh():
    current_user = get_jwt_identity()
    access_token = create_access_token(identity=current_user)
    ret = {
        'access_token': access_token
    }
    add_token_to_database(access_token, app.config['JWT_IDENTITY_CLAIM'])
    return jsonify(ret), 200


@blueprint.route('/revoke_access', methods=['DELETE'])
@jwt_required
def revoke_access_token():
    jti = get_raw_jwt()['jti']
    user_identity = get_jwt_identity()
    revoke_token(jti, user_identity)
    return jsonify({"message": "token revoked"}), 200


@blueprint.route('/revoke_refresh', methods=['DELETE'])
@jwt_refresh_token_required
def revoke_refresh_token():
    jti = get_raw_jwt()['jti']
    user_identity = get_jwt_identity()
    revoke_token(jti, user_identity)
    return jsonify({"message": "token revoked"}), 200


@jwt.user_loader_callback_loader
def user_loader_callback(identity):
    return User.query.get(identity)


@jwt.token_in_blacklist_loader
def check_if_token_revoked(decoded_token):
    return is_token_revoked(decoded_token)
