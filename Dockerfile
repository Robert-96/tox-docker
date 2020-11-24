FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        git curl wget make \
        build-essential \
        openssl libssl1.0-dev \
        libncursesw5-dev libc6-dev libpq-dev libffi-dev \
        libbz2-dev libgdbm-dev libsqlite3-dev libreadline6-dev libncurses5-dev zlib1g-dev liblzma-dev tk-dev

COPY install-cpython.sh .
COPY install-pypy.sh .
RUN chmod +x install-cpython.sh
RUN chmod +x install-pypy.sh

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Get PyPy
RUN ./install-pypy.sh "2.7" "7.3.3"
RUN ./install-pypy.sh "3.6" "7.3.3"
RUN ./install-pypy.sh "3.7" "7.3.3"

RUN pypy -V
RUN pypy3.6 -V
RUN pypy3.7 -V

# Get Python 2.7
RUN ./install-cpython.sh "2.7.18"
RUN python2.7 -V
RUN python2.7 get-pip.py
RUN python2.7 -m pip -h

# Get Python 3.4
RUN ./install-cpython.sh "3.4.9"
RUN python3.4 -V

# Get Python 3.5
RUN ./install-cpython.sh "3.5.9"
RUN python3.5 -V

# Get Python 3.6
RUN ./install-cpython.sh "3.6.12"
RUN python3.6 -V

# Get Python 3.7
RUN ./install-cpython.sh "3.7.9"
RUN python3.7 -V

# Get Python 3.8
RUN ./install-cpython.sh "3.8.6"
RUN python3.8 -V

# Get Python 3.9
RUN ./install-cpython.sh "3.9.0"
RUN python3.9 -V

# Install tox
RUN python3.9 -m pip install tox
RUN tox --version
