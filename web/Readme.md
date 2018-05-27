Dockerfile for django + wagtail development
====

Build for artifacts

```
# build builder image
docker build -t builder -f Dockerfile.build web

# build artifacts to volume
# need to use bind mount to share wheels to dev build
# mkdir wheel
docker run -it --rm --mount type=bind,src=$(pwd)/wheel,dst=/usr/local/wheel --mount type=bind,src=$(pwd)/web,dst=/usr/local/app,ro iotpi-build
```

Build for development

```
docker build -t iotpi-dev -f Dockerfile web
docker run -it --rm --mount type=bind,src=$(pwd)/wheel,dst=/usr/local/wheel --mount type=bind,src=$(pwd),dst=/usr/local/app,ro iotpi-dev
```