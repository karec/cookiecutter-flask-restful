import json


class TestApi:

    # UserList tests

    def test_user_list_200(self, testapp, users):
        resp = testapp.get('/v1/users')
        data = json.loads(resp.get_data(as_text=True))
        assert len(data) == 50
        assert data[0].get('username') == "user0"
        assert data[0].get('email') == "user0@mail.com"

    def test_user_list_post_201(self, testapp, users):
        data = {
            'username': 'valid',
            'email': 'valid@valid.com'
        }
        resp = testapp.post(
            '/v1/users',
            data=json.dumps(data),
            content_type='application/json'
        )
        assert resp.status_code == 201

        user_id = json.loads(resp.get_data(as_text=True))['id']
        resp = testapp.get('/v1/users/{}'.format(user_id))

        assert resp.status_code == 200
        assert json.loads(resp.get_data(as_text=True))['username'] == 'valid'

    def test_user_post_500(self, testapp, users):
        data = {
            'username': 'user0',
            'email': 'user0@mail.com'
        }
        resp = testapp.post(
            '/v1/users',
            data=json.dumps(data),
            content_type='application/json'
        )
        assert resp.status_code == 500

    # UserDetail tests

    def test_user_put_200(self, testapp, users):
        resp = testapp.put('/v1/users/1', data=json.dumps({
            'username': 'new_name',
            'email': 'newmail@mail.com'
        }), content_type='application/json')
        assert resp.status_code == 200

        resp = testapp.get('/v1/users/1')
        assert resp.status_code == 200

        data = json.loads(resp.get_data(as_text=True))

        assert data['username'] == "new_name"

    def test_user_put_404(self, testapp, users):
        resp = testapp.put('/v1/users/10000', data=json.dumps({
            'username': 'new_name',
            'email': 'newmail@mail.com'
        }), content_type='application/json')
        assert resp.status_code == 404

    def test_user_get_200(self, testapp, users):
        resp = testapp.get('/v1/users/1')
        assert resp.status_code == 200

        data = json.loads(resp.get_data(as_text=True))

        assert data["id"] == 1
        assert data['username'] == 'user0'
        assert data['email'] == 'user0@mail.com'

    def test_user_get_404(self, testapp, users):
        resp = testapp.get('/v1/users/10000')
        assert resp.status_code == 404

    def test_user_delete_202(self, testapp, users):
        resp = testapp.delete('/v1/users/1')
        assert resp.status_code == 202

    def test_user_delete_404(self, testapp, users):
        resp = testapp.delete('/v1/users/10000')
        assert resp.status_code == 404
