# tox-docker

Docker image for running tox with Python 2.7, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, PyPy and PyPy3.

CPython Versions:
  * `2.7.18`
  * `3.4.9`
  * `3.5.9`
  * `3.6.12`
  * `3.7.9`
  * `3.8.6`
  * `3.9.0`

PyPy Versions:
  * PyPy `7.3.3` - Python `2.7`
  * PyPy `7.3.3` - Python `3.6`
  * PyPy `7.3.3` - Python `3.7`


## Supported tags and respective `Dockerfile` links

* [`latest` (Dockerfile)](https://github.com/Robert-96/tox-docker/blob/master/Dockerfile)

## How to use this image

This image installs different versions of CPython and PyPy facilitating running [tox](https://tox.readthedocs.io/en/latest/) on a linux machine.

### Create a `Dockerfile` in your project

```
FROM robert96/tox

COPY . /app
WORKDIR /app 

RUN tox
```

Then, run the commands to build and run the Docker image:

```
$ docker build -t my-tox-runner .
$ docker run --name my-tox-runner my-tox-runner
```
