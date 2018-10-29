"""Default configuration

Use env var to override
"""
import os
from datetime import timedelta

DEBUG = True

env = os.getenv

# SECURITY CONFIGURATION
# ----------------------------------------------------------
# The secret key is needed to keep the client-side sessions secure. Raises exception if FLASK_SECRET_KEY not configured.
SECRET_KEY = env('FLASK_SECRET_KEY', 'changeme')

# FLASK RESTful CONFIG
# ----------------------------------------------------------
BUNDLE_ERRORS = True

# DATABASE CONFIG
# ----------------------------------------------------------
SQLALCHEMY_DATABASE_URI = "sqlite:////tmp/{{cookiecutter.app_name}}.db"
SQLALCHEMY_TRACK_MODIFICATIONS = False

# Flask-JWT-Extended CONFIG
# ----------------------------------------------------------
# TODO: Change it
JWT_BLACKLIST_ENABLED = True
JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']
JWT_SECRET_KEY = env('JWT_SECRET_KEY')
JWT_ACCESS_TOKEN_EXPIRES = timedelta(days=30)

# LOGGING CONFIG
# ----------------------------------------------------------
LOGGER_NAME = '{{cookiecutter.app_name}}'
SLACK_API_KEY = env('SLACK_TOKEN', None)
DEFAULT_SLACK_CHANNEL = 'C0HSEJTGE'
LOG_FILE = "logs/api.ERROR.log"
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '[%(asctime)s] %(levelname)s [%(module)s] """%(message)s"""'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose'
        },
        'app-file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'formatter': 'verbose',
            'filename': 'logs/app.log',
            'maxBytes': 100 * 1024 * 1024,  # 100Mb
            'backupCount': 3,
        },
        'request-file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'formatter': 'verbose',
            'filename': 'logs/api.request.log',
            'when': 'D',
            'backupCount': 3,

        },
        'slack-error': {
            'level': 'ERROR',
            'icon_emoji': ':beetle:',
            'username': 'evEv8sAPIBot',
            'api_key': SLACK_API_KEY,
            'class': 'slacker_log_handler.SlackerLogHandler',
            'channel': DEFAULT_SLACK_CHANNEL
        },
    },
    'loggers': {
        'slack.error': {
            'handlers': ['slack-error'],
            'propagate': False,
            'level': 'ERROR',
        },
        'api.request': {
            'handlers': ['request-file', 'slack-error'],
            'propagate': False,
            'level': 'INFO',
        },
        '{{cookiecutter.app_name}}': {
            'handlers': ['app-file', 'console'],
            'propagate': False,
            'level': 'INFO',
        },
    }
}

# OTHER CONFIG HERE
# ----------------------------------------------------------
