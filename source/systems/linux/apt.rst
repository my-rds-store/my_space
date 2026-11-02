APT 源与镜像
============

.. warning::

   以下 Ubuntu 14.04/trusty 命令为历史记录；现代 Ubuntu 请使用
   deb822 格式的 .sources 文件，不要直接覆盖 /etc/apt/sources.list。

镜像下载地址
------------

* `Ubuntu <http://cdimage.ubuntu.com/releases/>`_
* `CentOS <http://isoredirect.centos.org/centos/7/isos/x86_64/>`_

源列表
------

* 科大开源镜像站: http://mirrors.ustc.edu.cn/
* 163 源地址: http://mirrors.163.com/
* 阿里源地址: http://mirrors.aliyun.com/

`Fedora 中文社区软件源 <https://repo.fdzh.org/>`_

.. code-block:: bash

    # ubuntu 14.04 163 源（历史）
    $ sudo wget -O /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty
    # sudo curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty

    # ubuntu 14.04 更换阿里源
    $ grep "archive.ubuntu.com" /etc/apt/sources.list && \
           sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

    # 科大源
    $ sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

* `apt-get 命令使用代理 <http://daemon369.github.io/network/2014/06/05/use-proxy-for-apt-get>`_

.. code-block:: bash

    # APT 工具集使用的默认配置文件是 /etc/apt/apt.conf
    $ sudo tee /etc/apt/apt.conf <<-'EOF'
    Acquire::http::proxy "http://127.0.0.1:8123/";
    Acquire::https::proxy "https://127.0.0.1:8123/";
    EOF

    # 1. 使用 -o 选项
    sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8123/" update

    # 2. 使用 -c 选项
    $ sudo tee ~/apt_proxy.conf <<-'EOF'
    Acquire::http::proxy "http://127.0.0.1:8123/";
    Acquire::https::proxy "https://127.0.0.1:8123/";
    EOF
    sudo apt-get -c ~/apt_proxy.conf update

    # 3. 设置 APT_CONFIG 环境变量
    $ export APT_CONFIG=~/apt_proxy.conf
    $ sudo apt-get update
