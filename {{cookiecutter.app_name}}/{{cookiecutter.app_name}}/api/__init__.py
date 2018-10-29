import importlib
from flask_restful import Api
from flask_restful import Resource

API_VERSIONS = ['v1']  # supported API versions


def register_api(app):
    api = Api(app, catch_all_404s=True)

    # noinspection PyMethodMayBeStatic
    class Version(Resource):
        def get(self):
            """Get version of API."""
            return {'version': API_VERSIONS[-1], 'api_versions': API_VERSIONS}

    api.add_resource(Version, '/', '/version')

    for version in API_VERSIONS:
        mod = importlib.import_module("{{cookiecutter.app_name}}.api." + version)
        app.register_blueprint(mod.blueprint)
    return api
