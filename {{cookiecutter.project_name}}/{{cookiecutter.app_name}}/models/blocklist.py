"""Simple blocklist implementation using database

Using database may not be your prefered solution to handle blocklist in your
final application, but remember that's just a cookiecutter template. Feel free
to dump this code and adapt it for your needs.

For this reason, we don't include advanced tokens management in this
example (view all tokens for a user, revoke from api, etc.)

If we choose to use database to handle blocklist in this example, it's mainly
because it will allow you to run the example without needing to setup anything else
like a redis or a memcached server.

This example is heavily inspired by
https://github.com/vimalloc/flask-jwt-extended/blob/master/examples/blocklist_database.py
"""
from {{cookiecutter.app_name}}.extensions import db


class TokenBlocklist(db.Model):
    """Blocklist representation"""

    id = db.Column(db.Integer, primary_key=True)
    jti = db.Column(db.String(36), nullable=False, unique=True)
    token_type = db.Column(db.String(10), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    revoked = db.Column(db.Boolean, nullable=False)
    expires = db.Column(db.DateTime, nullable=False)

    user = db.relationship("User", lazy="joined")

    def to_dict(self):
        return {
            "token_id": self.id,
            "jti": self.jti,
            "token_type": self.token_type,
            "user_identity": self.user_identity,
            "revoked": self.revoked,
            "expires": self.expires,
        }
