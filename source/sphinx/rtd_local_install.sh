
## Document url
## https://www.chenyudong.com/archives/readthedocs-private-install.html
## https://docs.readthedocs.io/en/latest/install.html

##  update ubuntu 14.04 apt source in china  
# sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
# update

sudo apt-get install python-virtualenv -y 
sudo apt-get install git -y 

sudo apt-get install build-essential -y 
sudo apt-get install python-dev python-pip python-setuptools -y 
sudo apt-get install libxml2-dev libxslt1-dev zlib1g-dev -y 

sudo apt-get install elasticsearch  -y
sudo apt-get install redis-server -y 

echo "pip upgrade"
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc
export LC_ALL=en_US.UTF-8
pip install --upgrade pip   -i https://pypi.mirrors.ustc.edu.cn/simple


virtualenv rtd
cd rtd
source bin/activate

mkdir checkouts
cd checkouts

git clone --depth 1 https://github.com/rtfd/readthedocs.org.git

cd readthedocs.org
pip install -r requirements.txt  -i https://pypi.mirrors.ustc.edu.cn/simple

python manage.py migrate
python ./manage.py createsuperuser

#python ./manage.py createsuperuser --username=jiangxumin  --email=jiang_xmin@massclouds.com

python manage.py loaddata test_data

python manage.py runserver 0.0.0.0:8080 

