FROM python:3.10.4-slim-buster
MAINTAINER  name Ravi Agarwal <ra921741@gmail.com>

RUN apt-get update && apt-get install -y build-essential libpq-dev --no-install-recommends

ENV INSTALL_PATH /dice
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
#RUN pip install -editable .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "dice.app:create_app()"