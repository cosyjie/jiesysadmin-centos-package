firewall-cmd --add-port=8000/tcp --permanent
firewall-cmd --reload
yum install wget -y
wget -O /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
yum makecache

yum install gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel openssl11 openssl11-devel -y

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
tar -zxvf pyenvall.tar.gz
mv .pyenv /root/

cd /root/.pyenv && src/configure && make -C src

echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /root/.bashrc
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /root/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(pyenv init -)"' >> /root/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /root/.profile
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /root/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.profile
echo 'eval "$(pyenv init --path)"' >> /root/.profile

echo 'export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1' >> /root/.bash_profile
echo 'export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python"' >> /root/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bash_profile
echo 'eval "$(pyenv init -)"' >> /root/.bash_profile

source /root/.profile
source /root/.bashrc
source /root/.bash_profile

mkdir /cosyjieserver/jiesysadmin/
cd /opt/

#tar -zxvf jiesysadmin.tar.gz
#mv jiesysadmin /cosyjieserver/

exec "$SHELL"
