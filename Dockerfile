FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        git curl wget make \
        build-essential \
        openssl libssl1.0-dev \
        libncursesw5-dev libc6-dev libpq-dev libffi-dev \
        libbz2-dev libgdbm-dev libsqlite3-dev libreadline6-dev libncurses5-dev zlib1g-dev liblzma-dev tk-dev

# Get PyPy
COPY install-pypy.sh .
RUN chmod +x install-pypy.sh

RUN ./install-pypy.sh "2.7" "7.3.11"
RUN ./install-pypy.sh "3.8" "7.3.11"
RUN ./install-pypy.sh "3.9" "7.3.11"

# Get CPython
COPY install-cpython.sh .
RUN chmod +x install-cpython.sh

RUN ./install-cpython.sh "2.7.18"
RUN ./install-cpython.sh "3.4.10"
RUN ./install-cpython.sh "3.5.10"
RUN ./install-cpython.sh "3.6.15"
RUN ./install-cpython.sh "3.7.16"
RUN ./install-cpython.sh "3.8.16"
RUN ./install-cpython.sh "3.9.16"
RUN ./install-cpython.sh "3.10.9"
RUN ./install-cpython.sh "3.11.1"
RUN ./install-cpython.sh "3.12.0"

# Install tox
RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install setuptools wheel tox
RUN tox --version
