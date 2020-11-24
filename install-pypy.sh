#!/bin/bash

PYTHON_VERSION=$1
PYPY_VERSION=$2
BASE_URL="https://downloads.python.org/pypy"

echo "Installing PyPy $PYPY_VERSION: Python $PYTHON_VERSION"

file="pypy$PYTHON_VERSION-v$PYPY_VERSION-linux64"
archive="$file.tar.bz2"
url="$BASE_URL/$archive"

wget -q -P /tmp $url
tar -x -C /opt -f "/tmp/$archive"
rm "/tmp/$archive"
mv "/opt/$file" "/opt/pypy$PYTHON_VERSION"

if [[ "$PYTHON_VERSION" == "2.7" ]]; then
    ln -s "/opt/pypy$PYTHON_VERSION/bin/pypy" "/usr/local/bin/pypy"
else
    ln -s "/opt/pypy$PYTHON_VERSION/bin/pypy3" "/usr/local/bin/pypy$PYTHON_VERSION"
fi
