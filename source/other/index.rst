其他
================


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


SPAW 分区
-------------

Linux VPS的使用过程中，SWAP交换分区是一个很重要系统缓存分区。他是在内存不够用的情况下，从硬盘中临时分出一部分空间系统当做内存使用。但是，如果SWAP的占用超过30%的时候，系统的性能就会受到影响，这时候就要刷新SWAP。

刷新SWAP
    可以执行命令刷新一次SWAP（将SWAP里的数据转储回内存，并清空SWAP里的数据）

    .. code-block:: sh

        $ sudo swapoff -a && sudo swapon -a

关闭SWAP
    在内存大于2G时候，一般情况下可以关闭

    .. code-block:: sh

        $ sudo swapoff -a

开启SWAP
    .. code-block:: sh

        $ sudo swapon -a


屏幕录像gif
---------------

* `LICEcap(支持Windows Mac) <http://www.cockos.com/licecap/>`_
* `byzanz-gui(支持Linux) <https://git.oschina.net/mc_space/byzanz-gui>`_


检查端口通不通
----------------


查看端口占用
^^^^^^^^^^^^^

    .. code-block:: sh

        $ sudo netstat -anp | grep ":80\ "


检查端口通不通
^^^^^^^^^^^^^^^^

#. python 检查端口通不通

    .. code-block:: python

        #!/usr/bin/env python
        #coding=utf8

        ip = '192.168.5.204'
        port  = 5900

        import socket
         
        sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
         
        sk.settimeout(1)
         
        try:
            sk.connect((ip,port))
            print 'Server %s:%s  OK!' % (ip,port)
        except Exception:
            print 'Server %s:%s not connect!' % (ip,port) 
        sk.close()




#. nc命令检查端口通不通

    .. code-block:: sh

        $ nc  -vz 192.168.5.204 5904


#. telnet 命令检查端口通不通

    
    .. code-block:: sh

        $ telnet 192.168.5.204 5900 

#. 查看当前使用的端口

    .. code-block:: sh

       $ netstat -anlp | grep -w LISTEN
       $ netstat -aunp      # udp


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

`amixer的用法(音频编码音量控制) <http://blog.sina.com.cn/s/blog_8795b0970101ig2p.html>`_

#. 查看:

.. code-block:: sh

    $ sudo alsamixer
    $ sudo amixer -D pulse

#. 声音设置

.. code-block:: sh

    $ amixer -D pulse sset "Master" on
    $ amixer -D pulse sset "Master" off    // 静音
    $ amixer set "Master" 100%

#. 录音设置

.. code-block:: sh

    $ amixer set "Capture" 100%

    $ amixer set "Front Mic Boost" 53%
    $ amixer set "Rear Mic Boost"  53%

`alsamixer设置默认声卡及调节音量保存配置 <http://www.it165.net/os/html/201212/4118.html>`_


nmcli命令
-----------

`2.3.使用 NETWORKMANAGER 命令行工具 NMCLI <https://access.redhat.com/documentation/zh-CN/Red_Hat_Enterprise_Linux/7/html/Networking_Guide/sec-Using_the_NetworkManager_Command_Line_Tool_nmcli.html>`_


.. code:: sh

    $ nmcli help
    $ nmcli c help

    $ nmcli con show
    $ nmcli dev show eth0


查询含有 *\*rdma.so* 的rpm 包
--------------------------------

.. code:: sh

    yum provides *rdma.so

Fedora 开启SSH服务
   https://my.oschina.net/atttx123/blog/58100 
	
问题
--------

``Apache2``
^^^^^^^^^^^^^

.. code::

    重启Apache2出现：
    Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName.问题
    在/etc/apache2/apache2.conf文件最后加上：
    # Server Name
    ServerName localhost

.. raw:: html

    <iframe width="400" height="225" frameborder="0" src="http://127.0.0.1:3080/media/adding-a-video-in-mediadrop/embed_player"></iframe>

------

插入youku视频

.. raw:: html

    <embed src='http://player.youku.com/player.php/sid/XMjc2ODQzNTcwMA==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>

.. raw:: html

    <iframe height=498 width=510 src='http://player.youku.com/embed/XMzcyNzAyODAw' frameborder=0 'allowfullscreen'></iframe>

.. raw:: html

    <iframe height=498 width=510 src="http://player.youku.com/embed/XMjgzODg5NzYwNA==?client_id=undefined" frameborder=0 allowfullscreen></iframe>

------

插入github 视频

.. raw:: html

    <video width="638" height="478" controls>
        <source src="http://github.liaoxuefeng.com/sinaweibopy/video/git-apt-install.mp4">
    </video>


------

插入gitliab 视频

.. raw:: html

    <video width="638" height="478" controls>
        <source src="http://58.56.27.130:800/jiang_xmin/videos/raw/master/test/LakePowell_Thunderstorms_nimiaRM_4471864_062_1080_HD_ZH-CN.mp4">
    </video>


    <video width="638" height="478" controls>
        <source src="http://58.56.27.130:800/jiang_xmin/videos/raw/master/mcserver/creat_course.mp4">
    </video>



-------

插入百度云盘

.. raw:: html

    <video width="638" height="478" controls>
        <source src="https://d11.baidupcs.com/file/c3f114b8af0538d6115cb999c203bc5f?bkt=p3-0000704efb1fbe3f09ed4973db1154656483&xcode=818c9e935f798db6570eaae746598dd0bfa3efe48b5ae2b70b2977702d3e6764&fid=705205442-250528-55740032843716&time=1498015007&sign=FDTAXGERLBHS-DCb740ccc5511e5e8fedcff06b081203-2E7ZycCw1sxqN%2FzX%2BiT%2BOeA9IUQ%3D&to=d11&size=452161518&sta_dx=452161518&sta_cs=5604&sta_ft=mp4&sta_ct=7&sta_mt=5&fm2=MH,Yangquan,Netizen-anywhere,,shandong,ct&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=0000704efb1fbe3f09ed4973db1154656483&sl=83099727&expires=8h&rt=sh&r=376250870&mlogid=3976873212576580908&vuk=705205442&vbdid=2939017377&fin=%E5%93%88%E5%B0%94%E7%9A%84%E7%A7%BB%E5%8A%A8%E5%9F%8E%E5%A0%A1.mp4&fn=%E5%93%88%E5%B0%94%E7%9A%84%E7%A7%BB%E5%8A%A8%E5%9F%8E%E5%A0%A1.mp4&rtype=1&iv=0&dp-logid=3976873212576580908&dp-callid=0.1.1&hps=1&csl=299&csign=aH32eCyhXT%2FyKiSSRhPc3C7xP2o%3D&by=themis">
    </video>

    <video width="638" height="478" controls>
        <source src="https://nbct01.baidupcs.com/file/9d2bdcb775c417ba82e5001aced243b7?bkt=p3-00003ba7ed0850b8b6036fd520787b5e1e39&fid=705205442-250528-230870834788841&time=1498016729&sign=FDTAXGERLBHS-DCb740ccc5511e5e8fedcff06b081203-vXKmCJCb3EMkQOHUYeMdUoNMb6o%3D&to=67&size=45713742&sta_dx=45713742&sta_cs=3&sta_ft=mp4&sta_ct=7&sta_mt=5&fm2=MH,Ningbo,Netizen-anywhere,,shandong,ct&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=00003ba7ed0850b8b6036fd520787b5e1e39&sl=79888463&expires=8h&rt=sh&r=318596121&mlogid=3977335580399524366&vuk=705205442&vbdid=2939017377&fin=%E7%AC%AC01%E7%AB%A001+%E5%AD%A6%E4%B9%A0%E8%AE%BE%E5%A4%87%E5%87%86%E5%A4%87%E5%8F%8A%E5%AD%A6%E4%B9%A0%E8%AE%BA%E5%9D%9B.mp4&fn=%E7%AC%AC01%E7%AB%A001+%E5%AD%A6%E4%B9%A0%E8%AE%BE%E5%A4%87%E5%87%86%E5%A4%87%E5%8F%8A%E5%AD%A6%E4%B9%A0%E8%AE%BA%E5%9D%9B.mp4&rtype=1&iv=0&dp-logid=3977335580399524366&dp-callid=0.1.1&hps=1&csl=284&csign=i3P%2FclMK%2FwgOYQR3g9DYv8cgku8%3D&by=themis">
    </video>


