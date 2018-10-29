################################################################################
# Inspired by: https://github.com/mvanholsteijn/docker-makefile
################################################################################

CONTAINERS = `docker ps -a -q`
IMAGES = `docker images -a -q`

GIT_VERSION   = $(shell git log -1 --pretty=format:%h)
GIT_NOTES     = $(shell git log -1 --oneline)

REGISTRY_HOST=016926191061.dkr.ecr.us-east-1.amazonaws.com
NAME={{cookiecutter.app_name}}
IMAGE=$(REGISTRY_HOST)/$(NAME)

RELEASE_SUPPORT := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))/.make-release-support
VERSION=$(shell . $(RELEASE_SUPPORT) ; getVersion)
TAG=$(shell . $(RELEASE_SUPPORT); getTag)

SHELL=/bin/bash
BANNER = "\n==================== $(1) ===================="

.PHONY: pre-build docker-build post-build build release patch-release minor-release major-release tag check-status check-release showver \
	push do-push post-push

build: pre-build docker-build post-build

pre-build: ecr-login
	@echo $(call BANNER,"Building...")


pre-push: ecr-login
	@echo $(call BANNER,"Pushing: $(IMAGE)")


post-build:


post-push:


ecr-login:
	$(shell aws ecr get-login --no-include-email --region us-east-1)

docker-build: .release
ifeq ($(NOCACHE),TRUE)
	docker build --no-cache -t $(IMAGE):$(VERSION) .
else
	docker build -t $(IMAGE):$(VERSION) .
endif
	@DOCKER_MAJOR=$(shell docker -v | sed -e 's/.*version //' -e 's/,.*//' | cut -d\. -f1) ; \
	DOCKER_MINOR=$(shell docker -v | sed -e 's/.*version //' -e 's/,.*//' | cut -d\. -f2) ; \
	if [ $$DOCKER_MAJOR -eq 1 ] && [ $$DOCKER_MINOR -lt 10 ] ; then \
		echo docker tag -f $(IMAGE):$(VERSION) $(IMAGE):latest ;\
		docker tag -f $(IMAGE):$(VERSION) $(IMAGE):latest ;\
	else \
		echo docker tag $(IMAGE):$(VERSION) $(IMAGE):latest ;\
		docker tag $(IMAGE):$(VERSION) $(IMAGE):latest ; \
	fi

.release:
	@echo "release=0.0.0" > .release
	@echo "tag=$(NAME)-0.0.0" >> .release
	@echo INFO: .release created
	@cat .release


release: NOCACHE=TRUE
release: check-status check-release build push


push: pre-push do-push post-push

do-push: ecr-login
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

snapshot: build push

showver: .release
	@. $(RELEASE_SUPPORT); getVersion

tag-patch-release: VERSION := $(shell . $(RELEASE_SUPPORT); nextPatchLevel)
tag-patch-release: .release tag

tag-minor-release: VERSION := $(shell . $(RELEASE_SUPPORT); nextMinorLevel)
tag-minor-release: .release tag

tag-major-release: VERSION := $(shell . $(RELEASE_SUPPORT); nextMajorLevel)
tag-major-release: .release tag

patch-release: tag-patch-release release
	@echo $(call BANNER,"Finished version: $(VERSION)")

minor-release: tag-minor-release release
	@echo $(call BANNER,"Version: $(VERSION)")

major-release: tag-major-release release
	@echo $(call BANNER,"Version: $(VERSION)")


tag: TAG=$(shell . $(RELEASE_SUPPORT); getTag $(VERSION))
tag: check-status
	@echo $(call BANNER,"Tagging '${TAG}'")
	@. $(RELEASE_SUPPORT) ; ! tagExists $(TAG) || (echo "ERROR: tag $(TAG) for version $(VERSION) already tagged in git" >&2 && exit 1) ;
	@. $(RELEASE_SUPPORT) ; setRelease $(VERSION)
	git add .
	git commit -m "bumped to version $(VERSION)" ;
	git tag $(TAG) ;
	@ if [ -n "$(shell git remote -v)" ] ; then git push --tags ; else echo 'no remote to push tags to' ; fi

check-status:
	@. $(RELEASE_SUPPORT) ; ! hasChanges || (echo "ERROR: there are still outstanding changes" >&2 && exit 1) ;

check-release: .release
	@. $(RELEASE_SUPPORT) ; tagExists $(TAG) || (echo "ERROR: version not yet tagged in git. make [minor,major,patch]-release." >&2 && exit 1) ;
	@. $(RELEASE_SUPPORT) ; ! differsFromRelease $(TAG) || (echo "ERROR: current directory differs from tagged $(TAG). make [minor,major,patch]-release." ; exit 1)

.PHONY: up down show seed resetdb reset clean clean-eggs clean-build docker-clean

up:
	@if ! test -d postgresdata ; then mkdir -p postgresdata ; fi
	docker-compose up -d postgresdb
	sleep 2
	docker-compose up -d --build {{cookiecutter.app_name}}

down:
	docker-compose down

show:
	docker-compose ps

seed: resetdb
	@if ! test -d postgresdata ; then mkdir -p postgresdata ; fi
	docker-compose up -d postgresdb
	sleep 2
	docker-compose up --build postgres-seed
	sleep 2
	docker-compose up -d --build {{cookiecutter.app_name}}

resetdb:
	docker-compose down
	rm -rf postgresdata

reset: down clean setup seed
	@echo "Everything is wonderful!  Make sure to run 'make seed'"

test:
	pytest -v tests
	flake8 {{cookiecutter.app_name}}

clean: clean-eggs clean-build
	@find . -iname '*.pyc' -delete
	@find . -iname '*.pyo' -delete
	@find . -iname '*~' -delete
	@find . -iname '*.swp' -delete
	@find . -iname '__pycache__' -delete
	@rm -rf logs/*

clean-eggs:
	@find . -name '*.egg' -print0|xargs -0 rm -rf --
	@rm -rf .eggs/

clean-build:
	@rm -fr .pytest_cache/
	@rm -fr .tox/*
	@rm -fr build/
	@rm -fr dist/
	@rm -fr *.egg-info

docker-clean:
	@if [ -n "$(CONTAINERS)" ]; then docker stop $(CONTAINERS); fi;
	@if [ -n "$(CONTAINERS)" ]; then docker rm $(CONTAINERS); fi;
	@if [ -n "$(IMAGES)" ]; then docker rmi -f $(IMAGES); fi;
	docker container prune --force
	docker image prune --force
	docker volume prune --force
	docker network prune --force
	docker system prune --force
