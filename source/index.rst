.. onepice documentation master file, created by
   sphinx-quickstart on Thu May  4 09:58:38 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

##################
Hello World
##################

|today|

.. raw:: html

    <!doctype html>
    <html>
    <head>
    <meta charset="utf-8">
    <meta name="keywords" content="诗歌">
    <meta name="description" content="精选诗歌">
     
    <title>诗歌</title>
    <style type="text/css">
    #wrapper {
            width: 400px;
            background-color: #261718;
    }
    .tet{
            color: #E8B606;	
    }
     
    #wrapper #box {
            width: 260px;
            text-align: center;
            margin:0 auto;
    }
    p {line-height:5px;}
    h1 {
            background-image: url(image/u=648132297,961608322&fm=21&gp=0.jpg);
            background-position: 12% 0%;
    }
    </style>
    </head>
     
    <body>
    <div id="wrapper">
      <div id="box">
        <h1 class="tet">诗</h1>
        <h4 class="tet">聂鲁达【智利】</h4>
        <p class='tet'>我简直无以言表，我 </p>
        <p class='tet'>瞠目结舌 </p>
        <p class='tet'>我头脑发热或羽翼失修 </p>
        <p class='tet'>而使灵魂有点蠢动 </p>
        <p class='tet'>我一意孤行 </p>
        <p class='tet'>去诠释那团火 </p>
        <br/>

        <p class='tet'>我记下第一行苍白文字 </p>
        <p class='tet'>变态的、空洞无物、纯粹 </p>
        <p class='tet'>的痴言乱语、一整个无知者的 </p>
        <p class='tet'>终极智慧 </p>

        <br/>
        <p class='tet'>而忽然间我瞥见 </p>
        <p class='tet'>天堂之锁开启 </p>
        <p class='tet'>诸多星辰、离离草木 </p>
        <p class='tet'>镶边的幻影 </p>
        <p class='tet'>迷一般地 </p>
        <p class='tet'>与箭、火焰和花丛 </p>
        <p class='tet'>以及寥廓长夜、寰宇浑然一体 </p>
        <br/>

      </div>
    </div>
     
    </body>
    </html>

------------------------------

*************************************
宝贝读物     
*************************************

.. code::

    <<我的情绪小怪兽>>
        引导宝宝如何理解情绪,为以后更好的控制管理自己的情绪打下基础。
        情绪管理很重要,直接影响人际交往，问题解决，自信心等。

    <<小灯泡情绪管理绘本>>
        来自韩国的"暖心"情绪绘本，为儿童的性情培养提供全面的解决方案，用一段段温情的亲子时光引导孩子.
        学会正当释放情绪，培养健康快乐心态.


*************************************
学习笔记     
*************************************

* `线性代数 <https://my-linear-algebra.readthedocs.io/zh/latest/>`_


*************
open edx     
*************

*  https://shuer.link/#/discover

* `学堂在线 <http://www.xuetangx.com>`_
    * username : jiang_xumin@massclouds.com

* `中国大学MOOC <https://www.icourse163.org/>`_
    * username :jiang_xumin@massclouds.com

* `edx <https://www.edx.org/>`_
    * login : google emal 

* `MOOC 网站：Coursera、Udacity、edX，哪个更适合中国人？你有何经验分享？ <https://www.zhihu.com/question/21095181>`_


编程类开放书籍荟萃
    * https://linuxstory.org/free-chinese-programming-books/
    * https://www.zhihu.com/question/38836382

**流程图**

* `Drawio <https://github.com/jgraph/drawio-desktop/releases>`_  

.. code-block:: sh

  sudo snap install drawio

* `ProcessOn <https://www.processon.com/>`_
* `yEd <https://www.yworks.com/products/yed/download>`_

---------------

* `mobaxterm <https://mobaxterm.mobatek.net/download.html>`_

--------------

* `协作工具 leangoo <https://www.leangoo.com>`_

* grub-customizer


匿名网盘
    * `奶牛快传 <http://cowtransfer.com/>`_
    * `Firefox Send <https://send.ioiox.com/>`_
    * `瑞典 anonfile  <https://anonfile.com/>`_
    * `degoo(jiang_xmin@massclouds.com)  <https://degoo.com>`_



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


************************
镜像下载地址
************************

* `Ubuntu  <http://cdimage.ubuntu.com/releases/>`_
* `CentOS  <http://isoredirect.centos.org/centos/7/isos/x86_64/>`_


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



.. code-block:: sh

    apt-get download  <your_package_here> #  Download the binary package into the current directory
    ####################
    apt-get clean
    apt-get --download-only install <your_package_here>
    cp /var/cache/apt/archives/*.deb <your_directory_here>
    


* `jitsi  开源视频会议 <https://jitsi.org/>`_




..
 我是注释内容
 你看不到我

.. toctree::
   :maxdepth: 2
   :caption: Contents:
    
   ros/index
   ros/ros2
   autoware/index
   apollo/index
   webrtc/index
   unity/index
   qemu_libvirt/qemu
   openstack/index
   vim/vim
   mac/index
   git/index
   python/index
   java/index
   android/index
   golang/index
   cpp/index
   rust/index
   qt/index
   opencv/index
   nginx/index
   download_tools/index
   bittorrent/index
   lightweight_markup_language/index
   latex/index
   docker/index
   kubernetes/index
   rancher/index
   vagrant/index
   virtualbox/index
   database/index
   unix/index
   unix/unix
   unix/shell/shell
   IDE/index
   windows/index
   mingw32/index
   nsis/index
   dnsmasq/index
   apache/index 
   openbox/index
   linux_tools_cfg/index
   x11/index
   install_cd_customization/index
   gfw_is_shit/index
   tensorflow/index
   other/index

------------------

* `英特尔® 服务器主板 S1200SPL的 pGFX 图形驱动程序 S1200SPL <https://downloadcenter.intel.com/zh-cn/download/25689/pGFX-Graphics-Driver-for-the-Intel-Server-Board-S1200SPL?product=97950&_ga=2.88649426.81022229.1538991029-1974842179.1536233238>`_


