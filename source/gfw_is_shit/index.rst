##########
科学上网
##########

                          *一枝红杏出墙来!!!*

.. image:: https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1821475898,231081266&fm=27&gp=0.jpg
    :alt: alternate text
    :align: center

************
VPS厂商
************

* `搬瓦工 <https://bwh1.net/>`_
* `Vultr(中文网) <https://buy.shangyufeidi.com/vultr/?f=bad>`_
* https://www.vultr.com

*************************
1. 牛逼的shadowsocks          
*************************

* `GitHub shadowsocks <https://github.com/ziggear/shadowsocks>`_

安装 shadowsocks
==================

.. code-block:: bash

    # ubuntu
    $ export LC_ALL=C
    $ apt-get install python-pip

    $ sudo pip install shadowsocks

* `docker shadowsocks <https://hub.docker.com/r/mritd/shadowsocks/>`_
* `kcptun  <https://www.cmsky.com/kcptun/>`_

配置 shadowsocks
==================

* `Configuration via Config File <https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File>`_


Server  
--------


.. code-block:: bash
    
    #  1. 手动启动

    $ sudo ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start

    # 2. 配置自动启动(ubuntu)
    $ sudo tee /etc/shadowsocks.json <<-'EOF'
    {
        "server":"my_server_ip",
        "server_port":8388,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"mypassword",
        "timeout":300,
        "method":"aes-256-cfb",
        "fast_open": false
        "workers": 100
    }
    EOF

    $ sudo tee /etc/init.d/shadowsocks-start.sh <<-'EOF'
    #! /bin/sh
    ### BEGIN INIT INFO
    # Provides:          shadowsocks
    # Required-Start:    $remote_fs $syslog
    # Required-Stop:     $remote_fs $syslog
    # Should-Start:      $network $time
    # Should-stop:       $network $time
    # Default-Start:     2 3 4 5
    # Default-Stop:      0 1 6
    # Short-Description: shadowsocks.
    ### END INIT INFO
    /usr/local/bin/ssserver -c /etc/shadowsocks.json -d start
    EOF

    # 设置启动等级： 
    $ sudo chmod a+x /etc/init.d/shadowsocks-start.sh
    $ sudo update-rc.d /etc/init.d/shadowsocks-start.sh defaults 90

* `在CentOS下配置自启动服务 <http://imchao.wang/2014/02/21/make-your-service-autostart-on-linux/>`_

Client
------
    
* Ubuntu

.. code-block:: bash

    $ sudo tee /etc/shadowsocks.json <<-'EOF'
    {
        "server":"my_server_ip",
        "server_port":8388,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"mypassword",
        "timeout":300,
        "method":"aes-256-cfb",
        "fast_open": true,
        "workers": 100
    }
    EOF
    
    # 手动启动，停止
    $ sudo sslocal -c /etc/shadowsocks.json
    $ sudo sslocal -c /etc/shadowsocks.json -d start
    $ sudo sslocal -c /etc/shadowsocks.json -d stop
    $ sudo sslocal -c /etc/shadowsocks.json -d restart

    # 配置开机自启动
    $ sudo tee /etc/init.d/shadowsocks-start.sh <<-'EOF'
    #!/bin/sh
    ### BEGIN INIT INFO
    # Provides:          shadowsocks
    # Required-Start:    $remote_fs $syslog
    # Required-Stop:     $remote_fs $syslog
    # Should-Start:      $network $time
    # Should-stop:       $network $time
    # Default-Start:     2 3 4 5
    # Default-Stop:      0 1 6
    # Short-Description: shadowsocks.
    ### END INIT INFO
    /usr/local/bin/sslocal -c /etc/shadowsocks.json -d start
    EOF

    # 设置启动等级： 
    $ sudo update-rc.d shadowsocks-start.sh defaults 90

    # 测试
    $ google-chrome --proxy-server=socks5://127.0.0.1:1080

* Windows_ / OSX_ 

.. _Windows: https://github.com/shadowsocks/shadowsocks-csharp
.. _OSX: https://github.com/shadowsocks/shadowsocks-iOS/wiki/Shadowsocks-for-OSX-Help

* Android_ / iOS_ 

.. _Android: https://github.com/shadowsocks/shadowsocks-android 
.. _iOS: https://github.com/shadowsocks/openwrt-shadowsocks

* OpenWRT_ 

.. _OpenWRT: https://github.com/shadowsocks/openwrt-shadowsocks


参考
============

* https://www.cnblogs.com/cursorhu/p/7157257.html

* http://blog.csdn.net/lee_j_r/article/details/54019691
* https://www.8dlive.com/post/168.html
* http://xinwen.eastday.com/a/170207195821936.html
    
****************************
2. 神奇的SwitchyOmega             
****************************


配置代理
============

.. image:: ./image/proxy.png
    :scale: 100%
    :alt: alternate text
    :align: center

 
配置自动切换
============

* `gfwlist <https://github.com/gfwlist/gfwlist>`_

*导入在线，规则列表，立即更新情景模式*

.. code:: 

    在线规则列表:
    https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt 


.. image:: ./image/auto_switch.png
    :scale: 100%
    :alt: alternate text
    :align: center
 
参考
============

* `Chrome 配置 SwitchyOmega <http://www.cylong.com/blog/2017/04/09/chrome-SwitchyOmega/>`_
* `SS + SwitchyOmega实现代理自动切换 <https://eliyar.biz/AutoProxy-By-Shadowsocks-and-SwitchyOmega/>`_


************************************
3. polipo http/https的代理转发
************************************

Shadowsocks是我们常用的代理工具,它使用socks5协议,而终端很多工具目前只支持http和https等协议,对socks5协议支持不够好, 所以需要将socks协议转换成http协议.

.. code-block:: bash

    $ sudo apt-get install polipo
    $ sudo polipo -v
    $ man polipo
    # the default values.  See /usr/share/doc/polipo/examples/config.sample
    
.. code-block:: bash

    $ sudo tee /etc/polipo/config <<-'EOF'

    # This file only needs to list configuration variables that deviate
    # from the default values.  See /usr/share/doc/polipo/examples/config.sample
    # and "polipo -v" for variables you can tweak and further information.

    logSyslog = true
    logFile = /var/log/polipo/polipo.log

    socksParentProxy = "127.0.0.1:1080"
    socksProxyType = socks5

    proxyAddress = "0.0.0.0"
    proxyPort = 8123
    allowedClients = 127.0.0.1, ::1, 192.168.8.0/24 
    
    EOF

    $ sudo service polipo restart

:: 

    socksParentProxy : 上级代理ip,端口
    socksProxyType   : 是上级代理类型

    proxyAddress     : 监听的ip
    proxyPort        : 是本地监听端口
    allowedClients   : 是允许连接ip范围


.. code-block:: bash

    # 以ubuntu 测试通过
    echo -e "\n------------------------------------------\n"
    curl ip.gs
    #curl ifconfig.me
    echo -e "\n------------------------------------------\n"

    export https_proxy=https://127.0.0.1:8123
    export  http_proxy=http://127.0.0.1:8123
    export HTTPS_PROXY=https://127.0.0.1:8123
    export  HTTP_PROXY=http://127.0.0.1:8123

    curl ip.gs
    #curl ifconfig.me
    echo -e "\n------------------------------------------\n"

    $ git config --global http.proxy=localhost:8123

 
参考
============

* `Shadowsocks + Polipo 配置全局代理(Linux 版本) <https://blog.csdn.net/jon_me/article/details/53525059/>`_
* `shadowsocks和polipo配置全局代理 <https://blog.denghaihui.com/2017/10/10/shadowsocks-polipo/>`_

*  `ubuntu Polipo 快速使用 <http://wiki.ubuntu.org.cn/UbuntuHelp:Polipo/zh>`_


