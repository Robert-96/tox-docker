#!/bin/bash

validate_version() {
    VERSION=$1
    VERSION_REGEX='^([0-9]+\.){2}([0-9]+)$'

    if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
        echo "Invalid version '$VERSION'."
        echo "The version must use a major.minor.patch pattern (e.g 2.7.18, 3.4.9)."
        exit 1
    fi
}

install_cpython() {
    PYTHON_VERSION=$1
    BASE_URL="https://www.python.org/ftp/python"

    FILE="Python-$PYTHON_VERSION"
    ARCHIVE="$FILE.tgz"
    URL="$BASE_URL/$PYTHON_VERSION/$ARCHIVE"

    echo "Installing CPython $PYTHON_VERSION"

    wget -q -P /tmp $URL
    tar -x -C /opt -f "/tmp/$ARCHIVE"
    cd "/opt/$FILE"

    ./configure &> /dev/null
    make &> /dev/null
    make altinstall &> /dev/null

    cd

    MAJOR=`echo $PYTHON_VERSION | cut -d. -f1`
    MINOR=`echo $PYTHON_VERSION | cut -d. -f2`
    eval "python$MAJOR.$MINOR --version &> /dev/null"

    PYTHON2_REGEX='^2\.7\.([0-9]+)$'
    if [[ $PYTHON_VERSION =~ $PYTHON2_REGEX ]]; then
        echo "Installing pip for CPython $PYTHON_VERSION"

        curl --silent https://bootstrap.pypa.io/get-pip.py --output /tmp/get-pip.py
        python2.7 /tmp/get-pip.py &> /dev/null
        python2.7 -m pip --version &> /dev/null
    fi
}

validate_version $1
install_cpython $1
