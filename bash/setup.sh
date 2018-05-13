#!/usr/bin/env bash

bash_version=bash-4.4
logfile=bash_setup.log

exec &> $logfile

set -xe

curl -O http://ftp.gnu.org/gnu/bash/${bash_version}.tar.gz
tar xzf ${bash_version}.tar.gz
pushd $bash_version

./configure --prefix=/usr/local
make
sudo make install

sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
chsh -s /usr/local/bin/bash

popd

rm -rf $bash_version
rm $bash_version.tar.gz

exec &> /dev/tty

echo $bash_version installed
