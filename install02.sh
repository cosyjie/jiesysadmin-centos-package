pyenv virtualenv 3.10.12 jiesysadmin310
cd /cosyjieserver/jiesysadmin/
pyenv local jiesysadmin310
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

pip install django~=4.2
pip install psutil
#pip install eventlet
#pip install python-engineio
#pip install python-socketio
pip install gunicorn
pip install cryptography
pip install setproctitle

python manage.py makemigrations
python manage.py migrate
python manage.py createadmin

cp -f /opt/jiesysadmin.service /etc/systemd/system/

systemctl enable jiesysadmin.service
systemctl start jiesysadmin.service