# tox-docker

Docker image for running tox with Python 2.7, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, PyPy and PyPy3.

CPython Versions:
  * `2.7.18`
  * `3.4.10`
  * `3.5.10`
  * `3.6.15`
  * `3.7.16`
  * `3.8.16`
  * `3.9.16`
  * `3.11.1`
  * `3.12.0`

PyPy Versions:
  * PyPy `7.3.11` - Python `2.7`
  * PyPy `7.3.11` - Python `3.6`
  * PyPy `7.3.11` - Python `3.7`

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

## License

This project is licensed under the [MIT License](https://github.com/Robert-96/tox-docker/blob/main/LICENSE).
