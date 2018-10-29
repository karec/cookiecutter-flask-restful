from setuptools import setup, find_packages

# get required packages for the Pipfile or requirements file
try:
    from pipenv.project import Project
    from pipenv.utils import convert_deps_to_pip

    pfile = Project().parsed_pipfile
    requirements = convert_deps_to_pip(pfile['packages'], r=False)
    test_requirements = convert_deps_to_pip(pfile['dev-packages'], r=False)
except ImportError:
    # get the requirements from the requirements.txt
    requirements = [line.strip()
                    for line in open('requirements/prod.txt').readlines()
                    if line.strip() and not line.startswith('#')]
    # get the test requirements from the test_requirements.txt
    test_requirements = [line.strip()
                         for line in
                         open('requirements/dev.txt').readlines()
                         if line.strip() and not line.startswith('#')]

# get the version
with open('{{cookiecutter.app_name}}/__init__.py', 'r') as f:
    for line in f:
        if line.startswith('__version__'):
            version = line.strip().split('=')[-1].strip(' \'"')
            break
    else:
        version = '0.0.1'

BUILD_REQUIRED_FILES = (
    'LICENSE',
    'AUTHORS.rst',
    'CONTRIBUTING.rst',
    'HISTORY.rst',
    'README.md',
    'Pipfile',
    'Pipfile.lock',
    'requirements/prod.txt',
    'requirements/dev.txt'
)

readme = open('README.md').read()
history = open('HISTORY.rst').read().replace('.. :changelog:', '')

setup(
    name='{{cookiecutter.app_name}}',
    version=version,
    description='{{cookiecutter.project_short_description}}',
    long_description=readme,
    url='''https//github.com/Eventador/{{ cookiecutter.app_name }}''',
    packages=find_packages(where='.', exclude=['tests']),
    package_dir={'''{{ cookiecutter.app_name }}''': '''{{ cookiecutter.app_name }}'''},
    include_package_data=True,
    install_requires=requirements,
    zip_safe=False,

    test_suite='pytest',
    tests_require=test_requirements,
    data_files=[('', BUILD_REQUIRED_FILES)],

    entry_points={
            'console_scripts': [
                '{{cookiecutter.app_name}} = {{cookiecutter.app_name}}.manage:cli'
            ]
        }
)
