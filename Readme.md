Dockerfile for django + wagtail development
====

Build for artifacts

```
# build builder image
docker build -t builder -f Dockerfile.build .

# create volume to save built wheels
docker volume create wheel-vol

# build artifacts to volume
docker run -it --rm --mount src=iotpi-wheel,dst=/usr/local/wheel --mount type=bind,src=$(pwd),dst=/usr/local/app,ro iotpi-build
```