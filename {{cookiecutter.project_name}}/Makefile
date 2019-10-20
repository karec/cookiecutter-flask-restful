.PHONY: init build run db-migrate

init: build run db-migrate
	docker-compose exec web {{cookiecutter.app_name}} init

build:
	docker-compose build

run:
	docker-compose up -d

db-migrate:
	docker-compose exec web {{cookiecutter.app_name}} db migrate
