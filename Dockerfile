FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y  \
        git curl wget make \
        build-essential \
        openssl \
        libncursesw5-dev libc6-dev libpq-dev libffi-dev \
        libbz2-dev libgdbm-dev libsqlite3-dev libreadline6-dev libncurses5-dev zlib1g-dev liblzma-dev tk-dev

# Install libssl1.0 and libssl1.0-dev
RUN wget https://snapshot.debian.org/archive/debian-security/20240630T105336Z/pool/updates/main/g/glibc/multiarch-support_2.28-10%2Bdeb10u4_amd64.deb
RUN dpkg -i multiarch-support_2.28*.deb
RUN rm multiarch-support_2.28*.deb

RUN wget https://snapshot.debian.org/archive/debian/20170705T160707Z/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8%2B1_amd64.deb
RUN dpkg -i libssl1.0.0_1.0*.deb
RUN rm libssl1.0.0_1.0*.deb

RUN wget https://snapshot.debian.org/archive/debian/20170705T160707Z/pool/main/o/openssl/libssl-dev_1.0.2l-1~bpo8%2B1_amd64.deb
RUN dpkg -i libssl-dev_1.0*.deb
RUN rm libssl-dev_1.0*.deb

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
RUN ./install-cpython.sh "3.7.17"
RUN ./install-cpython.sh "3.8.20"
RUN ./install-cpython.sh "3.9.23"
RUN ./install-cpython.sh "3.10.18"
RUN ./install-cpython.sh "3.11.13"
RUN ./install-cpython.sh "3.12.11"
RUN ./install-cpython.sh "3.13.5"

# Install tox
RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install setuptools wheel tox
RUN tox --version
