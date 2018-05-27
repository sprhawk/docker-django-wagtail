#!/bin/bash
# docker build -t iotpi-build -f Dockerfile.build .
mkdir -p wheel
docker run -it --rm --mount type=bind,src=$(pwd)/wheel,dst=/usr/local/wheel --mount type=bind,src=$(pwd),dst=/usr/local/app,ro iotpi-build $@
