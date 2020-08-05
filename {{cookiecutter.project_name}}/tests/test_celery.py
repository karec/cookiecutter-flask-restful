import pytest

from {{cookiecutter.app_name}}.app import init_celery
from {{cookiecutter.app_name}}.tasks.example import dummy_task


@pytest.fixture(scope="session")
def celery_session_app(celery_session_app, app):
    celery = init_celery(app)

    celery_session_app.conf = celery.conf
    celery_session_app.Task = celery_session_app.Task

    yield celery_session_app


@pytest.fixture(scope="session")
def celery_worker_pool():
    return "solo"


def test_example(celery_session_app, celery_session_worker):
    """Simply test our dummy task using celery"""
    res = dummy_task.delay()
    assert res.get() == "OK"
