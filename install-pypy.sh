# Get PyPy
wget -q -P /tmp https://downloads.python.org/pypy/pypy2.7-v7.3.3-linux64.tar.bz2
tar -x -C /opt -f /tmp/pypy2.7-v7.3.3-linux64.tar.bz2
rm /tmp/pypy2.7-v7.3.3-linux64.tar.bz2
mv /opt/pypy2.7-v7.3.3-linux64 /opt/pypy
ln -s /opt/pypy/bin/pypy /usr/local/bin/pypy

# Get PyPy3.6
wget -q -P /tmp https://downloads.python.org/pypy/pypy3.6-v7.3.3-linux64.tar.bz2
tar -x -C /opt -f /tmp/pypy3.6-v7.3.3-linux64.tar.bz2
rm /tmp/pypy3.6-v7.3.3-linux64.tar.bz2
mv /opt/pypy3.6-v7.3.3-linux64 /opt/pypy3.6
ln -s /opt/pypy3.6/bin/pypy3 /usr/local/bin/pypy3.6

# Get PyPy3.7
wget -q -P /tmp https://downloads.python.org/pypy/pypy3.7-v7.3.3-linux64.tar.bz2
tar -x -C /opt -f /tmp/pypy3.7-v7.3.3-linux64.tar.bz2
rm /tmp/pypy3.7-v7.3.3-linux64.tar.bz2
mv /opt/pypy3.7-v7.3.3-linux64 /opt/pypy3.7
ln -s /opt/pypy3.7/bin/pypy3 /usr/local/bin/pypy3.7
