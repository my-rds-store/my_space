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
软件开发中的问题归根结底是人的问题     
*************************************

需求设计:
    基本上到现在我就没见到过合格的理清疑问、细化细节的需求设计。很多人过来一个需求，就几句话，这算什么需求？

低效的沟通:
    有的人只会浪费时间写很长的邮件，却不拎起电话，或者当面来问。有的人不愿意在晚上稍微花点时间在网上找一下大洋彼岸的同事，宁可写邮件。一件事情可以反复来回好几天，而本来可以只花十多分钟。

不切实际的项目进度安排:
    我发现很多项目经理只会强调早就失去意义的截止日期。我们搞工程，如果做出来的是个垃圾产品，死守预设日期有什么意义？

过多的会议:
    很多会，是和工程项目无关的。往往在大公司这种情况比较常见，因为个人往往会被摊上很多乱七八糟的事情，越往上越多。

垃圾网络。
    国情，不解释。

猪队友:
    很多问题，归根结底都是人。比如：对技术缺乏“工匠精神”，能完成任务就好，从来不考虑其它方面、是否能进一步改进等等。对新技术缺乏敏感度，甚至抵触。缺乏团队精神，喜欢强调自己的职责范围，不在他所认为的范围内的事情，就不管不问。缺乏谦虚，自以为是，没有相互学习的精神。很多讨论，变成站队、甚至面子问题。


*************
PDF book     
*************
   
* `linux公社下载地址 <https://linux.linuxidc.com/>`_

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



.. code-block:: sh

    apt-get download  <your_package_here> #  Download the binary package into the current directory
    ####################
    apt-get clean
    apt-get --download-only install <your_package_here>
    cp /var/cache/apt/archives/*.deb <your_directory_here>
    
************
待研究
************

* `申请Let's Encrypt永久免费SSL证书 <https://www.jianshu.com/p/3ae2f024c291>`_
    * https://letsencrypt.org/

----

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
   openstack/index
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
   lightweight_markup_language/index
   latex/index
   pycharm/remote_debug
   docker/index
   kubernetes/index
   rancher/index
   vagrant/index
   virtualbox/index
   database/index
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

