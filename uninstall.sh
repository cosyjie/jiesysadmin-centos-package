echo '取消防火墙8000端口'

firewall-cmd --zone=public --remove-port=8000/tcp --permanent

echo '中止服务...'
systemctl stop jiesysadmin.service
systemctl disable jiesysadmin.service

echo '取消配置...'
sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /etc/bashrc
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /etc/bashrc
sed -i '/PYENV_ROOT/d' /etc/bashrc
sed -i '/pyenv/d' /etc/bashrc

sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /etc/profile
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /etc/profile
sed -i '/PYENV_ROOT/d' /etc/profile
sed -i '/pyenv/d' /etc/profile

sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /etc/bash_profile
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /etc/bash_profile
sed -i '/PYENV_ROOT/d' /etc/bash_profile
sed -i '/pyenv/d' /etc/bash_profile

sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /root/.bashrc
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /root/.bashrc
sed -i '/PYENV_ROOT/d' /root/.bashrc
sed -i '/pyenv/d' /root/.bashrc

sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /root/.profile
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /root/.profile
sed -i '/PYENV_ROOT/d' /root/.profile
sed -i '/pyenv/d' /root/.profile

sed -i '/PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM/d' /root/.bash_profile
sed -i '/PYTHON_BUILD_MIRROR_URL/d' /root/.bash_profile
sed -i '/PYENV_ROOT/d' /root/.bash_profile
sed -i '/pyenv/d' /root/.bash_profile

echo '删除文件'
rm -rf /cosyjieserver
rm -rf /root/.pyenv

echo '重载配置'
source /etc/bash_profile
source /etc/bashrc
source /etc/profile

source /root/.profile
source /root/.bashrc
source /root/.bash_profile

exec "$SHELL"