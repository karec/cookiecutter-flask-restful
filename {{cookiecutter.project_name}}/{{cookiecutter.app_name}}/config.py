"""Default configuration

Use env var to override
"""
DEBUG = True
SECRET_KEY = "changeme"

SQLALCHEMY_DATABASE_URI = "sqlite:////tmp/{{cookiecutter.app_name}}.db"
SQLALCHEMY_TRACK_MODIFICATIONS = False

JWT_BLACKLIST_ENABLED = True
JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']
{% if cookiecutter.use_celery == "yes" %}
CELERY_BROKER_URL = "amqp://guest:guest@localhost/"
CELERY_RESULT_BACKEND = "amqp://guest:guest@localhost/"
{% endif %}
