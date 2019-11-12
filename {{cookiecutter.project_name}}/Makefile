.PHONY: init build run db-migrate test tox

init: build run db-migrate
	docker-compose exec web {{cookiecutter.app_name}} init

build:
	docker-compose build

run:
	docker-compose up -d

db-migrate:
	docker-compose exec web {{cookiecutter.app_name}} db migrate

test:
tox:
	docker-compose run -v $(PWD)/tests:/code/tests:ro web tox -e {{ cookiecutter.tox_python_env }}
