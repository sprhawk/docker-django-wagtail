Dockerfile for django + wagtail development
====

Build for artifacts

```
# build builder image
docker build -t builder -f Dockerfile.build .

# create volume to save built wheels
docker volume create wheel-vol

# build artifacts to volume
docker run -it --rm --mount source=wheel-vol,target=/usr/local/wheel builder
```