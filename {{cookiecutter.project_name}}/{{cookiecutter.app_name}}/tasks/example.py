from {{cookiecutter.app_name}}.extensions import celery


@celery.task
def dummy_task():
    return "OK"
