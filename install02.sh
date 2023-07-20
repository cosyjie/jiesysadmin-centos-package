#! /bin/sh
cd /opt
CPPFLAGS="$(pkg-config --cflags openssl11)" LDFLAGS="$(pkg-config --libs openssl11)" pyenv install -v 3.10.11
pyenv virtualenv 3.10.11 jiesysadmin310
cd /cosyjieserver/jiesysadmin/
pyenv local jiesysadmin310
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install django~=4.2
pip install psutil
pip install eventlet
pip install python-engineio
pip install python-socketio
pip install gunicorn
pip install cryptography
python manage.py makemigrations
python manage.py migrate
python manage.py createadmin
mv -f /cosyjieserver/jiesysadmin/jiesysadmin.service /etc/systemd/system/
systemctl enable jiesysadmin.service
systemctl start jiesysadmin.service