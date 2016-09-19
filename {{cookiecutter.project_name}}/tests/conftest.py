import pytest


from {{cookiecutter.app_name}}.app import create_app
from {{cookiecutter.app_name}}.extensions import db as _db
from .factories import user_factory


@pytest.fixture
def app():
    app_test = create_app(testing=True)
    return app_test


@pytest.fixture
def testapp(app):
    return app.test_client()


@pytest.fixture
def db(app):
    _db.app = app

    with app.app_context():
        _db.create_all()

    yield _db

    _db.session.close()
    _db.drop_all()


@pytest.fixture
def users(db):
    users = [user_factory(i) for i in range(0, 50)]
    db.session.add_all(users)
    db.session.commit()
