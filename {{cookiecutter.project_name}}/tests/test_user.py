import factory
from pytest_factoryboy import register

from {{cookiecutter.app_name}}.models import User


@register
class UserFactory(factory.Factory):

    username = factory.Sequence(lambda n: 'user%d' % n)
    email = factory.Sequence(lambda n: 'user%d@mail.com' % n)
    password = "mypwd"

    class Meta:
        model = User


def test_get_user(client, db, user, admin_headers):
    # test 404
    rep = client.get("/api/v1/users/100000", headers=admin_headers)
    assert rep.status_code == 404

    db.session.add(user)
    db.session.commit()

    # test get_user
    rep = client.get('/api/v1/users/%d' % user.id, headers=admin_headers)
    assert rep.status_code == 200

    data = rep.get_json()['user']
    assert data['username'] == user.username
    assert data['email'] == user.email
    assert data['active'] == user.active


def test_put_user(client, db, user, admin_headers):
    # test 404
    rep = client.put("/api/v1/users/100000", headers=admin_headers)
    assert rep.status_code == 404

    db.session.add(user)
    db.session.commit()

    data = {'username': 'updated'}

    # test update user
    rep = client.put(
        '/api/v1/users/%d' % user.id,
        json=data,
        headers=admin_headers
    )
    assert rep.status_code == 200

    data = rep.get_json()['user']
    assert data['username'] == 'updated'
    assert data['email'] == user.email
    assert data['active'] == user.active


def test_delete_user(client, db, user, admin_headers):
    # test 404
    rep = client.delete("/api/v1/users/100000", headers=admin_headers)
    assert rep.status_code == 404

    db.session.add(user)
    db.session.commit()

    # test get_user
    user_id = user.id
    rep = client.delete(
        '/api/v1/users/%d' % user_id,
        headers=admin_headers
    )
    assert rep.status_code == 200
    assert db.session.query(User).filter_by(id=user_id).first() is None


def test_create_user(client, db, admin_headers):
    # test bad data
    data = {
        'username': 'created'
    }
    rep = client.post(
        '/api/v1/users',
        json=data,
        headers=admin_headers
    )
    assert rep.status_code == 422

    data['password'] = 'admin'
    data['email'] = 'create@mail.com'

    rep = client.post(
        '/api/v1/users',
        json=data,
        headers=admin_headers
    )
    assert rep.status_code == 201

    data = rep.get_json()
    user = db.session.query(User).filter_by(id=data['user']['id']).first()

    assert user.username == 'created'
    assert user.email == 'create@mail.com'


def test_get_all_user(client, db, user_factory, admin_headers):
    users = user_factory.create_batch(30)

    db.session.add_all(users)
    db.session.commit()

    rep = client.get('/api/v1/users', headers=admin_headers)
    assert rep.status_code == 200

    results = rep.get_json()
    for user in users:
        assert any(u['id'] == user.id for u in results['results'])
