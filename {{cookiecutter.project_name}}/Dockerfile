# This is a simple Dockerfile to use while developing
# It's not suitable for production
#
# It allows you to run both flask and celery if you enabled it
# for flask: docker run --env-file=.flaskenv image flask run
# for celery: docker run --env-file=.flaskenv image celery worker -A myapi.celery_app:app
#
# note that celery will require a running broker and result backend
FROM python:{{ cookiecutter.python_version }}

RUN mkdir /code
WORKDIR /code

COPY requirements.txt pyproject.toml tox.ini ./
RUN pip install -U pip
RUN pip install -r requirements.txt
RUN pip install -e .

COPY {{ cookiecutter.app_name }} {{ cookiecutter.app_name }}/
COPY migrations migrations/

EXPOSE 5000
