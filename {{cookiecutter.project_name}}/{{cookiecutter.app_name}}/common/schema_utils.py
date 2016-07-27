from {{cookiecutter.app_name}}.extensions import marshmallow
from {{cookiecutter.app_name}}.common.exceptions import SchemaValidationError


class BaseAPISchema(marshmallow.ModelSchema):
    """Base API schema class

    Handle validation errors for load and dump methods, raising
    SchemaValidationError in case of error.

    This class can be used if you always handle validation errors the same way
    """

    def load(self, data, many=None, partial=None):
        data, errors = super(BaseAPISchema, self).load(data, many, partial)

        if errors:
            raise SchemaValidationError(errors)

        return data

    def dump(self, obj, many=None, update_fields=True, **kwargs):
        data, errors = super(BaseAPISchema, self).dump(obj, many, update_fields, **kwargs)

        if errors:
            raise SchemaValidationError(errors)

        return data
