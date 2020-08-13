# tox-docker

Docker image for running tox with Python 2.7, 3.4, 3.5, 3.6, 3.7, 3.8, PyPy and PyPy3.

CPython Versions:

* `2.7.18`
* `3.4.9`
* `3.5.9`
* `3.6.11`
* `3.7.8`
* `3.8.5`

PyPy `7.3.1`:

* PyPy - Python `2.7`
* PyPy3 - Python `3.6`

## Supported tags and respective `Dockerfile` links

* [`latest` (Dockerfile)](https://github.com/Robert-96/tox-docker/blob/master/Dockerfile)

## How to use this image

This image installs different versions of CPython, PyPy and Jython facilitating running [tox](https://tox.readthedocs.io/en/latest/) on a linux machine.

### Create a `Dockerfile` in your project

```
FROM robert96/tox

COPY . /app
RUN tox
```

Then, run the commands to build and run the Docker image:

```
$ docker build -t my-tox-runner .
$ docker run --name my-tox-runner my-tox-runner
```
