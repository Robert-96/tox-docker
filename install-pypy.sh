#!/bin/bash

validate_python_version() {
    VERSION=$1
    VERSION_REGEX='^([0-9]+\.)([0-9]+)$'

    if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
        echo "Invalid CPython version '$VERSION'."
        echo "The version must use a major.minor pattern (e.g 2.7, 3.4)."
        exit 1
    fi
}

validate_pypy_version() {
    VERSION=$1
    VERSION_REGEX='^([0-9]+\.){2}([0-9]+)$'

    if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
        echo "Invalid PyPy version '$VERSION'."
        echo "The version must use a major.minor.patch pattern (e.g 2.7.18, 3.4.9)."
        exit 1
    fi
}

install_pypy() {
    PYTHON_VERSION=$1
    PYPY_VERSION=$2
    BASE_URL="https://downloads.python.org/pypy"

    FILE="pypy$PYTHON_VERSION-v$PYPY_VERSION-linux64"
    ARCHIVE="$FILE.tar.bz2"
    URL="$BASE_URL/$ARCHIVE"

    echo "Installing PyPy $PYPY_VERSION - Python $PYTHON_VERSION"

    wget -q -P /tmp $URL
    tar -x -C /opt -f "/tmp/$ARCHIVE"
    rm "/tmp/$ARCHIVE"
    mv "/opt/$FILE" "/opt/pypy$PYTHON_VERSION"

    if [[ "$PYTHON_VERSION" == "2.7" ]]; then
        ln -s "/opt/pypy$PYTHON_VERSION/bin/pypy" "/usr/local/bin/pypy"

        pypy --version &> /dev/null
    else
        ln -s "/opt/pypy$PYTHON_VERSION/bin/pypy3" "/usr/local/bin/pypy$PYTHON_VERSION"

        eval "pypy$PYTHON_VERSION --version &> /dev/null"
    fi
}

validate_python_version $1
validate_pypy_version $2
install_pypy $1 $2
