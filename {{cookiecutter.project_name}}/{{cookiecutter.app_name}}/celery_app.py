from {{cookiecutter.app_name}}.app import init_celery

app = init_celery()
app.conf.imports = app.conf.imports + ("{{cookiecutter.app_name}}.tasks.example",)
