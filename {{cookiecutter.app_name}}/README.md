{{ cookiecutter.app_name }}
===========================

{{ cookiecutter.project_short_description}}


Installation
---

	# install pip:
	$ sudo easy_install pip

	# install virtualenv:
	$ sudo easy_install virtualenv

	# inside your repo, create env and activate it:
	$ virtualenv env/ && . env/bin/activate

	# install required packages
	$ pip install -e .


Documentation
---
	# generate new static doc
	$ make doc


Testing
---
	# run all tests
	$ make test
	
	# check for tests coverage
	$ make cover

Start Service
---

	# it will start on http://localhost:5000
	$ ENV=dev python app.py

Example Usage
---

	$ curl 'localhost:5000/v1/users/'

Deployment
---
Provide deployment instruction here
