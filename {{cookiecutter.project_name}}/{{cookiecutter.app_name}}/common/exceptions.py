class SchemaValidationError(Exception):
    """Raised when marshmallow schema validation fail"""
    status_code = 422

    def __init__(self, message):
        self.message = message

    def to_dict(self):
        rv = {"message": self.message}
        return rv
