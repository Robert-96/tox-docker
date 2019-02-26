PYTHON_VERSION=$1
PYTHON_BASE_URL="https://www.python.org/ftp/python/"

echo "Installing CPython: $PYTHON_VERSION"

url="$PYTHON_BASE_URL$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz"
wget $url
tar xzvf "Python-$PYTHON_VERSION.tgz"
cd "Python-$PYTHON_VERSION"

./configure
make
make altinstall