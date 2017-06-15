其他
================


other
--------------

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

.. raw:: html

    <embed src='http://player.youku.com/player.php/sid/XMjc2ODQzNTcwMA==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>

.. raw:: html

    <iframe height=498 width=510 src='http://player.youku.com/embed/XMzcyNzAyODAw' frameborder=0 'allowfullscreen'></iframe>
