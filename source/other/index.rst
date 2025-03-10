其他
================

.. math:: \sigma_\mathrm{mean} = \frac{\sigma}{\sqrt{N}}

.. math::

    \begin{bmatrix} 
     1 & 3\\ 
    -2 & 0 
    \end{bmatrix}  
    \begin{bmatrix} 
    -1 \\ 
    2  
    \end{bmatrix} =
    \begin{bmatrix} 
    5 \\ 
    2  
    \end{bmatrix}

::

    windows 计算 MD5 SHA1  SHA256
    > certutil -hashfile D:\filename.txt MD5
    > certutil -hashfile D:\filename.txt SHA1
    > certutil -hashfile D:\filename.txt SHA256


系统常见问题
-----------------

* Ubuntu
    * `ubuntu 18.04 鼠标键盘延迟问题 <https://blog.csdn.net/xmzwlw/article/details/48287313>`_
    
      .. code-block:: sh

          # 安装ccsm 
          sudo apt-get install compizconfig-settings-manager

          # 启动ccsm :  General -> OpenGL  -> disable “Sync To VBlank”
          ccsm  

Windows镜像下载地址
    https://msdn.itellyou.cn/

qbittorrent
    http://www.qbittorrent.org/

OBS Studio
-----------------

官网
    https://obsproject.com/

搭建RTMP服务器

**Docker**

.. code-block:: bash

    # https://hub.docker.com/r/jasonrivers/nginx-rtmp/
    $ sudo docker run -d  -p 1935:1935 -p 8088:8080  --rm  jasonrivers/nginx-rtmp

    # or 
    # https://github.com/alfg/docker-nginx-rtmp
    $ sudo docker run -d -p 1935:1935 -p 8080:80 --rm alfg/nginx-rtmp


开源许可证
-----------

* http://www.ruanyifeng.com/blog/2011/05/how_to_choose_free_software_licenses.html

ceph
    * `英文文档 <http://docs.ceph.com/docs/master/rados/>`_
    * `中文文档 <http://docs.ceph.org.cn/>`_


other
--------------

mingw编译gtk
^^^^^^^^^^^^

`Hello World program using GTK+ <http://mingw-cross.sourceforge.net/hello_gtk.html>`_

------------------------

`不要这样学习JavaScript <http://blog.crimx.com/2014/05/15/how-to-learn-javascript-properly/#不要这样学习JavaScript>`_

------------------------

* `快速建立工程模板cookiecutter <https://pypi.python.org/pypi/cookiecutter/1.5.1>`_
* `virtualenv搭建虚拟环境 <http://www.cnblogs.com/kym/archive/2011/12/29/2306428.html>`_


patch
-----

* `linux patch 命令小结 <http://blog.csdn.net/wh_19910525/article/details/7515540>`_
* `patch 命令用法详解 <http://blog.csdn.net/clozxy/article/details/5830880>`_
* `二进制patch工具xdelta的使用方法 <http://blog.csdn.net/panda_bear/article/details/8191859/>`_



SPAW 分区
-------------

`Linux系统swappiness参数在内存与交换分区之间优化作用 <http://blog.csdn.net/lufeisan/article/details/53339991>`_

Linux VPS的使用过程中，SWAP交换分区是一个很重要系统缓存分区。他是在内存不够用的情况下，从硬盘中临时分出一部分空间系统当做内存使用。但是，如果SWAP的占用超过30%的时候，系统的性能就会受到影响，这时候就要刷新SWAP。

.. code-block:: sh

    # 可以执行命令刷新一次SWAP（将SWAP里的数据转储回内存，并清空SWAP里的数据）
    $ sudo swapoff -a && sudo swapon -a

    
    $ cat /proc/sys/vm/swappiness  # 查看
    $ sysctl -q vm.swappiness      # 查看当前设置

    # 临时设置
    $ sudo sysctl vm.swappiness=10

    # 永久设置
    $ sudo echo "vm.swappiness=10" >> /etc/sysctl.conf
    $ sysctl -p  # 激活


屏幕录像gif
---------------

* `LICEcap(支持Windows Mac) <http://www.cockos.com/licecap/>`_
* `byzanz-gui(支持Linux) <https://git.oschina.net/mc_space/byzanz-gui>`_



CenterOS
------------

#. 检查某服务是否开机启动

    .. code-block:: sh

            # chkconfig dnsmasq 
	

#. 开启/禁止 某服务开机启动

    .. code-block:: sh

            # chkconfig dnsmasq on/off
            # systemctl enable/disable  dnsmasq 
	

#. 启动/停止/重启 某服务

    .. code-block:: sh

            # systemctl start/stop/restart dnsmasq 


amixer
---------

* `Ubuntu14.04使能root用户音频系统 <http://blog.163.com/ljf_gzhu/blog/static/13155344020156513446281/>`_

`amixer的用法(音频编码音量控制) <http://blog.sina.com.cn/s/blog_8795b0970101ig2p.html>`_

#. 查看:

.. code-block:: sh

    $ sudo alsamixer
    $ sudo amixer -D pulse
    $ sudo amixer scontrols   # 查看,哪些选择可以控制

#. 声音设置

.. code-block:: sh

    $ amixer -D pulse sset "Master" on
    $ amixer -D pulse sset "Master" off    // 静音
    $ amixer set "Master" 100%

    $ amixer set "PCM" 94%    #  6100u 华科 噪音

#. 录音设置

.. code-block:: sh

    $ amixer set "Capture" 100%

    $ amixer set "Front Mic Boost" 53%
    $ amixer set "Rear Mic Boost"  53%


`alsamixer设置默认声卡及调节音量保存配置 <http://www.it165.net/os/html/201212/4118.html>`_


.. code-block:: bash

    $ sudo apt-get install alsa-base alsa-utils alsa-oss alsa-tools

    # 1. 如果默认声卡不是需要的
    # 在home目录添加.asoundrc文件

    $ sudo tee $HOME/.asoundrc <<-'EOF'
    defaults.ctl.card 1 defaults.pcm.card 1
    EOF

    # 数字1代表声卡序号
    # 可以通过以下指令查看

    $ cat /proc/asound/cards

    # 2. alsamixer调节声音
    # Master和PCM是必须打开的。
    # Master和PCM声道默认是静音的，标记是MM，用左右方向键选择，按M来修改为OO就是开启，上下键调节音量大小。 
    # 配置好之后执行：
    $ alsactl store # 保存配置, 配置会保存在/var/lib/alsa/asound.state


nmcli命令
-----------

`2.3.使用 NETWORKMANAGER 命令行工具 NMCLI <https://access.redhat.com/documentation/zh-CN/Red_Hat_Enterprise_Linux/7/html/Networking_Guide/sec-Using_the_NetworkManager_Command_Line_Tool_nmcli.html>`_


.. code:: sh

    $ nmcli help
    $ nmcli c help

    $ nmcli con show
    $ nmcli dev show eth0

*  `工具Valgrind,检测内存泄露 <https://www.cnblogs.com/wangkangluo1/archive/2011/07/20/2111248.html>`_


rmp and yum   
--------------

* `RPM包的制作* <https://blog.csdn.net/samxx8/article/details/71945726>`_


查询含有 *\*rdma.so* 的rpm 包
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: sh

    yum provides *rdma.so


nginx
------

* `nginx简易教程 <http://www.cnblogs.com/jingmoxukong/p/5945200.html>`_


* BurnInTest - 电脑系统稳定性与可靠性测试工具

----------

* `Ubuntu 14.04安装teamviewer 远程桌面 <https://blog.csdn.net/love_xiaozhao/article/details/52704197>`_

ubutnu 源制作
---------------

* https://gist.github.com/awesomebytes/ce0643c1ddead589ab06e2a1e4c5861b

* Requirements
    * Python (I used 2.7).
    * dpkg-scanpackages: **sudo apt-get install dpkg-dev**
    * gzip: **sudo apt-get install gzip**


* 1. Create your debian hosting folder structure

    .. code-block:: sh

        mkdir simple_debian_repo
        cd simple_debian_repo
        mkdir debian

* 2. Add your `.deb` files to the `debian` folder

    .. code-block:: sh

        cp my_awesome_thing.deb simple_debian_repo/debian

* 3. Create Packages.gz file

    .. code-block:: sh

        # You'll need to do this every time you add/update a .deb.
        dpkg-scanpackages debian /dev/null | gzip -9c > debian/Packages.gz


    You'll get an output similar to

    .. code:: 

        dpkg-scanpackages: warning: Packages in archive but missing from override file:
        dpkg-scanpackages: warning:   my_awesome_thing.deb
        dpkg-scanpackages: info: Wrote 1 entries to output Packages file.


* 4. Run a webserver to host it

    .. code-block:: sh

        cd simple_debian_repo/
        python -m SimpleHTTPServer 8000

* 5. Configure any machine to point to your new debian repository

    .. code-block:: sh

        tee  /etc/apt/sources.list <<-"EOF"
        deb [trusted=yes] http://127.0.0.1:8000 debian/
        EOF
         
        apt-get update
        apt-cache search  "deb包“

    Note: 
        that the packages will be non authenticated, so if you want to stop having warnings you'll need to add the **[trusted=yes]**



ubuntu 好用的工具
------------------

.. code-block:: sh

	# Indicator Stickynotes - Ubuntu 桌面便签小工具 
	sudo add-apt-repository ppa:umang/indicator-stickynotes
	sudo apt-get update 
	sudo apt-get install indicator-stickynotes 


tty终端中显示和输入中文
------------------------------------

* https://blog.csdn.net/maybe_frank/article/details/53371201
* https://fooyou.github.io/document/2015/11/30/fbterm-display-and-input-Chinese-in-tty.html

.. code-block:: sh

   $ sudo apt-get install fbterm
   $ sudo fbterm



问题
------

``Apache2``
^^^^^^^^^^^^^

.. code::

    重启Apache2出现：
    Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName.问题
    在/etc/apache2/apache2.conf文件最后加上：
    # Server Name
    ServerName localhost

.. code-block:: bash

    # centos 目录或文件名中文显示 
    # vim /etc/httpd/conf/httpd.conf
    AddDefaultCharset UTF-8
    IndexOptions Charset=GBK

------

插入视频

.. raw:: html

    <video width="638" height="478" style=" background-color: #000;boder-with: 2px solid #000;" controls>
        <source src="https://user-images.githubusercontent.com/3022416/225920856-745a3bb7-6b35-403d-87b0-6e5085952d70.mp4">
    </video>


.. raw:: html

    <video width="638" height="478" controls>
        <source src="http://192.168.2.100:81/project-release-space-assets/4.0/videos/智能控制4.0软件介绍20241217.m4v">
    </video>

-------

remote-viewer
    https://www.systutorials.com/docs/linux/man/1-remote-viewer/

   --hotkeys=release-cursor=""   # 屏蔽 ctrl+alt
   
   

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


************
待研究
************

* `申请Let's Encrypt永久免费SSL证书 <https://www.jianshu.com/p/3ae2f024c291>`_
    * https://letsencrypt.org/


************************
DDRL(企鵝龍)
************************

* `Partclone <https://partclone.org>`_
    * `鸟哥介绍DDRL <http://linux.vbird.org/linux_enterprise/0130drbl_clonezilla.php>`_
    * `Partclone - git hub <https://github.com/Thomas-Tsai/partclone>`_

* https://github.com/stevenshiau/drbl
* http://drbl.nchc.org.tw/advanced/


Udpcast
===========

* http://www.udpcast.linux.lu/mkimagedoc.html

----

P2P File Transfer
    https://github.com/ypingcn/P2PChat-Qt
    https://github.com/aanrv/P2P-File-Transfer-Client
    https://www.cnblogs.com/snake-hand/p/3148366.html
    https://blog.csdn.net/hackertom/article/details/73692902

--------------

http://www.isjian.com/

Linux From Scratch
   https://linux.cn/lfs/LFS-BOOK-7.7-systemd/index.html 

   http://www.linuxfromscratch.org/


**************************************************************************
软件开发中的问题归根结底是人的问题     
**************************************************************************

::

        需求设计:
            基本上到现在我就没见到过合格的理清疑问、细化细节的需求设计。
            很多人过来一个需求，就几句话，这算什么需求？

        低效的沟通:
            有的人只会浪费时间写很长的邮件，却不拎起电话，或者当面来问。
            一件事情可以反复来回好几天，而本来可以只花十多分钟。

        不切实际的项目进度安排:
            我发现很多项目经理只会强调早就失去意义的截止日期。
            我们搞工程，如果做出来的是个垃圾产品，死守预设日期有什么意义？

        过多的会议:
            很多会，是和工程项目无关的。往往在大公司这种情况比较常见，
            因为个人往往会被摊上很多乱七八糟的事情，越往上越多。

        垃圾网络。
            国情，不解释。

        猪队友:
            很多问题，归根结底都是人的问题。
            比如：对技术缺乏“工匠精神”，能完成任务就好，从来不考虑其它方面、是否能进一步改进等等。 
            对新技术缺乏敏感度，甚至抵触。
            缺乏团队精神，喜欢强调自己的职责范围，不在他所认为的范围内的事情，就不管不问。
            缺乏谦虚，自以为是，没有相互学习的精神。很多讨论，变成站队、甚至面子问题。

