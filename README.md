# tox-docker

Docker image for running tox with Python 2.7, 3.4, 3.5, 3.6, 3.7, PyPy, PyPy3 and Jython.

CPython Versions:

* `2.7.15`
* `3.4.9`
* `3.5.6`
* `3.6.8`
* `3.7.2`

PyPy `7.0.0`:

* Python `2.7.13`
* Python `3.5.2`

Jython:

* `2.7.1`


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
