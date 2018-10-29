# HTTP status codes
# http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
from flask import jsonify, make_response, json
from werkzeug.exceptions import HTTPException

HTTP_OK_BASIC = 200
HTTP_OK_CREATED = 201
HTTP_OK_ACCEPTED = 202
HTTP_OK_NORESPONSE = 204
HTTP_NOT_MODIFIED = 304
HTTP_BAD_REQUEST = 400
HTTP_BAD_UNAUTHORIZED = 401
HTTP_BAD_FORBIDDEN = 403
HTTP_BAD_NOTFOUND = 404
HTTP_METHOD_NOT_ALLOWED = 405
HTTP_BAD_CONFLICT = 409
HTTP_BAD_RESOURCE = 410
HTTP_UNPROCESSABLE_ENTITY = 422
HTTP_DEFAULT_SERVICE_FAIL = 500
HTTP_SERVICE_UNAVAILABLE = 503
HTTP_INTERNAL_TIMEOUT = 504


##############################
# Json Serialization for more than simple returns
def make_json_error(ex):
    response = jsonify(message=str(ex))
    response.status_code = (ex.code if isinstance(ex, HTTPException)
                            else HTTP_DEFAULT_SERVICE_FAIL)
    return response


##############################
# Json Serialization as written in restful docs
def output_json(data, code, headers=None):
    """Makes a Flask response with a JSON encoded body"""
    resp = make_response(json.dumps(data), code)
    resp.headers.extend(headers or {})
    return resp


class APIError(HTTPException):
    """
    Rest exception class
    see: http://flask.pocoo.org/docs/0.10/patterns/apierrors/#simple-exception-class
    """

    status_code = HTTP_BAD_REQUEST

    def __init__(self, status_code, message=None, error_code=None, payload=None, property=None, response=None):
        super().__init__(description=message, response=response)
        # Variables
        self.message = message
        self.code = status_code
        self.error_code = error_code
        self.payload = payload
        self.property = property

    @property
    def data(self):
        return self.to_dict()

    def to_dict(self):
        rv = dict(self.payload or ())
        if not self.message:
            # RESTError can be raised with no extra data, just the status code
            # In that case, the status code is clear so there is no point in outputting an empty error
            return {}

        rv['message'] = self.message
        if self.error_code:
            rv['error_code'] = self.error_code
        if self.property:
            rv['property'] = self.property
        return {"errors": [rv]}


def convert_error_dict_to_list(error_dict, error_code=None):
    """
    Given an error dict (returned by Marshmallow), convert into a list of errors
    """
    return_value = []
    for f, errors in error_dict.items():
        # error can be a string, a dictionary, list of string or a list of dictionary
        if isinstance(errors, str) or isinstance(errors, dict):
            # if error is just a singular, wrap it in a list so we can treat it the same way
            errors = [errors]
        for error in errors:
            if isinstance(error, dict):
                error['property'] = f
            elif isinstance(error, str):
                error = dict(message=error, property=f)
            if error_code is not None:
                error['error_code'] = error_code
            return_value.append(error)
    return return_value
