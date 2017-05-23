其他
================


other
--------------

* `快速建立工程模板cookiecutter <https://pypi.python.org/pypi/cookiecutter/1.5.1>`_
* `virtualenv搭建虚拟环境 <http://www.cnblogs.com/kym/archive/2011/12/29/2306428.html>`_


屏幕录像gif
---------------

* `LICEcap(支持Windows Mac) <http://www.cockos.com/licecap/>`_
* `byzanz-gui(支持Linux) <https://git.oschina.net/mc_space/byzanz-gui>`_


.. image:: ./x.gif
       :height: 660px
       :width: 580 px
       :scale: 70%
       :alt: x text
       :align: center


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
