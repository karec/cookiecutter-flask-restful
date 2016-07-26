import os

DEBUG = False
TESTING = False

PROJECT_ROOT = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))

SQLALCHEMY_DATABASE_URI = 'sqlite:////tmp/api.db'
SQLALCHEMY_TRACK_MODIFICATIONS = True


LOGGING_CONFIG = {
    'version': 1,
    'root': {
        'level': 'NOTSET',
        'handlers': ['default'],
    },
    'formatters': {
        'verbose': {
            'format': '[%(asctime)s: %(levelname)s / %(name)s] %(message)s',
        },
    },
    'handlers': {
        'default': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose',
        }
    },
    'loggers': {
        '{{cookiecutter.app_name}}': {
            'handlers': ['default'],
            'level': 'INFO',
            'propagate': False,
        }
    }
}
