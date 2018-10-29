FROM python:3.6-slim
MAINTAINER Eventador Labs <developers@eventador.io>

ARG site_dir=/app
RUN mkdir -p $site_dir
WORKDIR $site_dir

# install netcat
RUN apt-get update \
  && apt-get -y install netcat bash \
  && apt-get clean

COPY docker/wait-for-it.sh /tmp/wait-for-it.sh
RUN chmod +x /tmp/wait-for-it.sh
COPY requirements/prod.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

ADD . $site_dir

EXPOSE 5100

CMD ["gunicorn", "-c", "/app/docker/gunicorn.py", "--bind=0.0.0.0:5100", "wsgi:app"]
