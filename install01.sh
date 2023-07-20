#!/bin/sh
firewall-cmd --add-port=8000/tcp --permanent
firewall-cmd --reload
yum install epel-release -y
yum clean all
yum makecache
yum install gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel openssl11 openssl11-devel wget -y
mkdir /cosyjieserver
mkdir /cosyjieserver/tmp
cd /opt
tar -zxvf sqlite-autoconf-3410200.tar.gz
mv /opt/sqlite-autoconf-3410200 /cosyjieserver/tmp
cd /cosyjieserver/tmp/sqlite-autoconf-3410200
./configure --prefix=/usr/local
make && make install
mv /usr/bin/sqlite3 /usr/bin/sqlite3_old
ln -s /usr/local/bin/sqlite3 /usr/bin/sqlite3
echo "/usr/local/lib" > /etc/ld.so.conf.d/sqlite3.conf
ldconfig
cd /opt
tar -zxvf pyenv-2.3.22.tar.gz
mv pyenv-2.3.22 .pyenv
mv .pyenv /cosyjieserver/
cd /opt
tar -zxvf pyenv-virtualenv-1.2.1.tar.gz
mv /opt/pyenv-virtualenv-1.2.1 pyenv-virtualenv
mv pyenv-virtualenv /cosyjieserver/.pyenv/plugins/
mkdir /cosyjieserver/.pyenv/cache/
mv /opt/Python-3.10.11.tar.xz /cosyjieserver/.pyenv/cache/
cd /cosyjieserver/.pyenv && src/configure && make -C src
echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /etc/bashrc
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /etc/bashrc
echo 'export PYENV_ROOT="/cosyjieserver/.pyenv"' >> /etc/bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /etc/bashrc
echo 'eval "$(pyenv init -)"' >> /etc/bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> /etc/bashrc
echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /etc/profile
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /etc/profile
echo 'export PYENV_ROOT="/cosyjieserver/.pyenv"' >> /etc/profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /etc/profile
echo 'eval "$(pyenv init --path)"' >> /etc/profile
echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /etc/bash_profile
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /etc/bash_profile
echo 'export PYENV_ROOT="/cosyjieserver/.pyenv"' >> /etc/bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /etc/bash_profile
echo 'eval "$(pyenv init -)"' >> /etc/bash_profile
source /etc/profile
source /etc/bashrc
source /etc/bash_profile
mkdir /cosyjieserver/jiesysadmin/
cd /opt/
tar -zxvf jiesysadmin.tar.gz
mv jiesysadmin /cosyjieserver/
exec "$SHELL"