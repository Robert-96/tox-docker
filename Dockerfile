FROM debian:sid

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        git curl wget make \
        build-essential \
        openssl libssl1.0-dev \
        libncursesw5-dev libc6-dev libpq-dev libffi-dev \
        libbz2-dev libgdbm-dev libsqlite3-dev libreadline6-dev libncurses5-dev zlib1g-dev liblzma-dev tk-dev

COPY install.sh .
RUN chmod +x install.sh

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Get Python 2.7
RUN ./install.sh "2.7.15"
RUN python2.7 -V
RUN python2.7 get-pip.py
RUN python2.7 -m pip -h

# Get Python 3.4
RUN ./install.sh "3.4.9"
RUN python3.4 -V
RUN python3.4 -m pip -h

# Get Python 3.5
RUN ./install.sh "3.5.6"
RUN python3.5 -V
RUN python3.5 -m pip -V

# Get Python 3.6
RUN ./install.sh "3.6.8"
RUN python3.6 -V
RUN python3.6 -m pip -h

# Get Python 3.7
RUN ./install.sh "3.7.2"
RUN python3.7 -V
RUN python3.7 -m pip -h

# Get Jython and PyPy
RUN apt-get install -y \
        jython \
        pypy \
        pypy-dev \
        pypy3 \
        pypy3-dev

RUN pypy -V
RUN pypy3 -V
RUN jython -V

# Install tox
RUN python3.7 -m pip install tox
RUN tox --version
