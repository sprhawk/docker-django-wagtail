FROM python:3.6.5-alpine3.7

RUN apk --no-cache add openjpeg libjpeg-turbo zlib mariadb-client-libs

RUN addgroup iotpi && \
    adduser -S -G iotpi iotpi && \
    mkdir /usr/local/venv && \
    chown -R iotpi:iotpi /usr/local/venv && \
    mkdir /usr/local/wheel && \
    chown -R iotpi:iotpi /usr/local/wheel && \
    mkdir /usr/local/app && \
    chown -R iotpi:iotpi /usr/local/app

VOLUME [ "/usr/local/app" ]

# should mount code root to /usr/local/app
WORKDIR /usr/local/app

USER iotpi:iotpi

COPY web/requirements.txt /tmp
COPY wheel/* /usr/local/wheel/

RUN python3 -m venv /usr/local/venv && \
    . /usr/local/venv/bin/activate && \
    pip3 install --no-index --find-links /usr/local/wheel pip && \
    pip3 install --no-index --find-links /usr/local/wheel -r /tmp/requirements.txt

EXPOSE 8000

ENV PYTHONUNBUFFERED 1
CMD . /usr/local/venv/bin/activate && \
    python3 manage.py runserver 0.0.0.0:8000