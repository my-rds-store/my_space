.. onepice documentation master file, created by
   sphinx-quickstart on Thu May  4 09:58:38 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Hello World
===================================

|today|

    ::

        我简直无以言表，我 
        瞠目结舌 
        我头脑发热或羽翼失修 
        而使灵魂有点蠢动 
        我一意孤行 
        去诠释那团火 

        我记下第一行苍白文字 
        变态的、空洞无物、纯粹 
        的痴言乱语、一整个无知者的 
        终极智慧 

        而忽然间我瞥见 
        天堂之锁开启 
        诸多星辰、离离草木 
        镶边的幻影 
        迷一般地 
        与箭、火焰和花丛 
        以及寥廓长夜、寰宇浑然一体 

匿名网盘
    *  `nofile.io <https://nofile.io/>`_
    *  `奶牛快传 <http://cowtransfer.com/>`_
    *  `瑞典 anonfile  <https://anonfile.com/>`_
    *  `即得 <https://good.gd.cn/>`_
    *  `degoo(jiang_xmin@massclouds.com)  <https://degoo.com>`_

短链接服务
    * https://st.im/ 

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   qemu_libvirt/qemu
   vim/vim
   git/index
   python/index
   nginx/index
   shell/shell
   sphinx/index
   pycharm/remote_debug
   docker/index
   vagrant/index
   database/mysql
   database/sqlite
   qt/index
   mingw32/index
   nsis/index
   dnsmasq/index
   apache/index 
   android/index
   openbox/index
   linux_tools_cfg/index
   gfw_is_shit/index
   other/index


`各类程序员学习路线图 <http://www.runoob.com/coder-learn-path>`_

动漫死神 
    https://tieba.baidu.com/p/4029180251


Ubuntu 编译源码包
---------------------

http://blog.sina.com.cn/s/blog_476d8cf30100lnd4.html

* `Debian 维护者指导 <https://www.debian.org/doc/manuals/debmake-doc/>`_
* `Debian 管理员手册 <https://www.debian.org/doc/manuals/debian-handbook/index.zh-cn.html>`_

.. code-block:: bash
 
    $ sudo apt-get source tree

    $ sudo apt-get build-dep tree

    $ cd tree-1.5.1.2
    $ sudo dpkg-buildpackage

    #  构建 vlc 打包环境
    apt-get update
    apt-get install curl -y  
    curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty
    apt-get update
    sudo apt-get build-dep vlc -y
    #sudo apt-get source vlc




源列表
-------

    * 163源地址 ： http://mirrors.163.com/

    * 阿里源地址:  http://mirrors.aliyun.com/

.. code-block:: bash

    #centos 安装epel扩展源
    $ sudo yum -y install epel-release

`Fodora 中文社区软件源 <https://repo.fdzh.org/>`_

Ubuntu 源列表
    `官方源列表 <https://wiki.ubuntu.com.cn/%E6%BA%90%E5%88%97%E8%A1%A8>`_

    `163源列表 <http://mirrors.163.com/.help/ubuntu.html>`_
    
    .. code-block:: bash
    
         # ubuntu14.04  163源
         wget -O /etc/apt/sources.list  http://mirrors.163.com/.help/sources.list.trusty
         curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty


.. code-block:: bash

    # ubuntu 14.04 更换阿里源
    $ grep "archive.ubuntu.com" /etc/apt/sources.list && \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

待研究
--------

http://www.isjian.com/

Linux From Scratch
   https://linux.cn/lfs/LFS-BOOK-7.7-systemd/index.html 

   http://www.linuxfromscratch.org/

前端框架(js)
   `Meteor <https://www.meteor.com/>`_

BitTorrent
    * `CentOS 下搭建BT下载服务器安装笔记  <http://www.linuxidc.com/Linux/2011-05/35510.htm>`_
    * `CTorrent <http://www.3haoweb.cn/a/internet/download/bt/2010/1030/4446.html>`_
    * `其他 <http://blog.csdn.net/vblittleboy/article/details/38494807>`_

.. code-block:: bash
    
    # 制作种子
    mktorrent -a http://192.168.8.204:18888/announce -o drbl-live-xfce.iso.torrent /home/jxm/Downloads/drbl-live-xfce.iso
    # or
    ctorrent -t ~/Downloads/virtualbox-5.1.deb -u http://192.168.8.204:18888/announce -s virtualbox-5.1.deb.torrent

    # 启动下载
    ctorrent virtualbox-5.1.deb.torrent -s ~/Downloads/virtualbox-5.1.deb

BT Tracker List
    https://github.com/ngosang/trackerslist
    https://newtrackon.com/

bittorrent文件编辑工具
    * BEncode Editor
    * TrackerEditor

Firefly
    https://github.com/getlantern/forum/issues/4902

..
 我是注释内容
 你看不到我


