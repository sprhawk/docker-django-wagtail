FROM python:3.6.5-alpine3.7

RUN apk --no-cache add openjpeg libjpeg-turbo zlib && \
    pip3 install -U pip

RUN addgroup iotpi && \
    adduser -S -G iotpi iotpi && \
    mkdir /usr/local/venv && \
    chown -R iotpi:iotpi /usr/local/venv && \
    mkdir /usr/local/wheel && \
    chown -R iotpi:iotpi /usr/local/wheel

# should mount code root to /usr/local/app
WORKDIR /usr/local/app

COPY requirements.txt .

USER iotpi:iotpi

VOLUME [ "/usr/local/wheel" ]
COPY wheel/* /usr/local/wheel/

RUN python3 -m venv /usr/local/venv && \
    . /usr/local/venv/bin/activate && \
    pip3 install --no-index --find-links /usr/local/wheel -r requirements.txt

EXPOSE 8000

ENV PYTHONUNBUFFERED 1
CMD . /usr/local/venv/bin/activate && \
    python3 manage.py runserver 0.0.0.0:8000