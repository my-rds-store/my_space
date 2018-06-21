.. onepice documentation master file, created by
   sphinx-quickstart on Thu May  4 09:58:38 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

##################
Hello World
##################

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

编程类开放书籍荟萃
    * https://linuxstory.org/free-chinese-programming-books/
    * https://www.zhihu.com/question/38836382

匿名网盘
    *  `nofile.io <https://nofile.io/>`_
    *  `奶牛快传 <http://cowtransfer.com/>`_
    *  `瑞典 anonfile  <https://anonfile.com/>`_
    *  `即得 <https://good.gd.cn/>`_
    *  `degoo(jiang_xmin@massclouds.com)  <https://degoo.com>`_

短链接服务
    * https://st.im/ 

* `chroot  <https://www.howtogeek.com/howto/linux/reset-your-ubuntu-password-easily-from-the-live-cd/>`_


`各类程序员学习路线图 <http://www.runoob.com/coder-learn-path>`_


************************
Ubuntu 编译源码包
************************

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


##################
镜像下载地址
##################

* `Ubuntu  <http://cdimage.ubuntu.com/releases/>`_
* `CentOS  <http://isoredirect.centos.org/centos/7/isos/x86_64/>`_
* `Fedora  </>`_


************
源列表
************

    * 科大开源镜像站:  http://mirrors.ustc.edu.cn/
    * 163源地址 ： http://mirrors.163.com/
    * 阿里源地址:  http://mirrors.aliyun.com/

.. code-block:: bash
    
    $ curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    $ curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo 
    $ sudo yum makecache


    # centos/fedora 安装epel扩展源 并更换为科大开源镜像
    $ sudo yum -y install epel-release
    $ sudo sed -e 's!^mirrorlist=!#mirrorlist=!g' \
             -e 's!^#baseurl=!baseurl=!g' \
             -e 's!//download\.fedoraproject\.org/pub!//mirrors.ustc.edu.cn!g' \
             -e 's!http://mirrors\.ustc!https://mirrors.ustc!g' \
             -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo

`Fodora 中文社区软件源 <https://repo.fdzh.org/>`_

Ubuntu 源列表
================


    `官方源列表 <https://wiki.ubuntu.com.cn/%E6%BA%90%E5%88%97%E8%A1%A8>`_

    `163源列表 <http://mirrors.163.com/.help/ubuntu.html>`_
    
.. code-block:: bash

    # ubuntu14.04  163源
    $ sudo wget -O /etc/apt/sources.list  http://mirrors.163.com/.help/sources.list.trusty
    # sudo curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty

    # ubuntu 14.04 更换阿里源
    $ grep "archive.ubuntu.com" /etc/apt/sources.list && \
           sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

    # 科大源
    $ sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

* `apt-get命令使用代理 <http://daemon369.github.io/network/2014/06/05/use-proxy-for-apt-get>`_

.. code-block:: bash

    #  APT工具集使用的默认配置文件是/etc/apt/apt.conf
    $ sudo tee /etc/apt/apt.conf <<-'EOF'
    Acquire::http::proxy "http://127.0.0.1:8123/";
    Acquire::https::proxy "https://127.0.0.1:8123/"; 
    EOF
    
    # 1.使用-o选项
    sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8123/" update

    # 2. 使用-c选项
    
    $ sudo tee ~/apt_proxy.conf <<-'EOF'
    Acquire::http::proxy "http://127.0.0.1:8123/";
    Acquire::https::proxy "https://127.0.0.1:8123/"; 
    EOF
    sudo apt-get -c ~/apt_proxy.conf update


    # 3. 如果我们设置了环境变量APT_CONFIG，那么APT工具集将使用APT_CONFIG指向的配置文件。
    $ export APT_CONFIG=~/apt_proxy.conf
    $ sudo apt-get update
    
************
待研究
************

* `itchat <http://itchat.readthedocs.io/zh/latest/>`_
    * http://itchat.readthedocs.io/zh/latest/
    * http://itchat.readthedocs.io/zh/latest/api/#api
    * https://github.com/littlecodersh/EasierLife/blob/master/Plugins/Tuling/tuling.py
    * https://blog.csdn.net/co_zy/article/details/73302984

    * 图灵机器人 api
        * http://www.tuling123.com/
        * https://www.kancloud.cn/turing/web_api/522989

P2P File Transfer
    https://github.com/ypingcn/P2PChat-Qt
    https://github.com/aanrv/P2P-File-Transfer-Client
    https://www.cnblogs.com/snake-hand/p/3148366.html
    https://blog.csdn.net/hackertom/article/details/73692902

--------------

* 天气预报 android 短信推送 

--------------

http://www.isjian.com/

Linux From Scratch
   https://linux.cn/lfs/LFS-BOOK-7.7-systemd/index.html 

   http://www.linuxfromscratch.org/

前端框架(js)
   `Meteor <https://www.meteor.com/>`_

* `jitsi  开源视频会议 <https://jitsi.org/>`_

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



..
 我是注释内容
 你看不到我

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   qemu_libvirt/qemu
   vim/vim
   mac/index
   git/index
   python/index
   java/index
   android/index
   golang/index
   cpp/index
   nginx/index
   download_tools/index
   bittorrent/index
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
   openbox/index
   linux_tools_cfg/index
   x11/index
   install_cd_customization/index
   gfw_is_shit/index
   other/index

