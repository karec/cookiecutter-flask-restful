import re
from flask import request
from flask_restful import Resource, reqparse

from {{cookiecutter.app_name}}.api import API_VERSIONS
from {{cookiecutter.app_name}}.exceptions import APIError

version_re = re.compile(r".*\/(?P<version>v\d)\/.*")


def _get_api_version():
    m = version_re.match(request.url)
    if m and m.group('version'):
        return m.group('version')


class BaseResource(Resource):
    method_decorators = []

    def __init__(self, *args, **kwargs):
        super(BaseResource, self).__init__(*args, **kwargs)
        self.parser = reqparse.RequestParser()

    @staticmethod
    def is_version_supported():
        return _get_api_version() in API_VERSIONS

    @staticmethod
    def is_req_old_version():
        return API_VERSIONS[-1] != _get_api_version()

    def _dump(self, obj, schema, **kwargs):
        selected_schema = schema if schema is not None else self.schema
        if selected_schema:
            return selected_schema().dump(obj, **kwargs)
        else:
            APIError(500, f"Error serializing obj: {obj}")

    def _load(self, schema, partial=False, **kwargs):
        args = request.get_json(force=True)
        kwargs['partial'] = partial
        selected_schema = schema if schema is not None else self.schema

        if selected_schema:
            return selected_schema().load(args, **kwargs)
        else:
            APIError(500, f"Error deserializing obj: {args}")

    def serialize(self, obj, schema=None, **kwargs):
        """
        Serialize an object into json that can be sent back to client. It allows caller to specify
         the schema. If not provided, it will use self.schema
        """
        if isinstance(obj, (list, tuple)):
            kwargs['many'] = True

        if not self.is_version_supported():
            raise APIError(400, f"API version is not supported. Supported versions: {','.join(API_VERSIONS)}")

        result = self._dump(obj, schema, **kwargs)
        return {"results": result}

    def deserialize(self, schema=None, partial=False, **kwargs):
        """
        Deserialize request JSON into object. Should be use in both post and put method to get an object that can be
        created or updated. If the schema has any validations, it'll also be run as well.
        """
        return self._load(schema, partial=partial, **kwargs)
