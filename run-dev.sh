#!/bin/bash
# docker build -t iotpi-dev -f Dockerfile .
docker run -it --rm --mount type=bind,src=$(pwd)/wheel,dst=/usr/local/wheel --mount type=bind,src=$(pwd),dst=/usr/local/app,ro iotpi-dev