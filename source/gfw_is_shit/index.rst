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

    $ sudo pip install shadowsocks

* `docker shadowsocks <https://hub.docker.com/r/mritd/shadowsocks/>`_
* `kcptun  <https://www.cmsky.com/kcptun/>`_

配置 shadowsocks
==================


* `Configuration via Config File <https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File>`_


.. code-block:: bash
    
    #  代理服务器端
    ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start

    # 自动启动(ubuntu)
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

* `在CentOS下配置自启动服务 <http://imchao.wang/2014/02/21/make-your-service-autostart-on-linux/>`_

    
.. code-block:: bash

    # 本地PC (ubuntu)
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

    $ sudo sslocal -c /etc/shadowsocks.json
    $ sudo sslocal -c /etc/shadowsocks.json -d start
    $ sudo sslocal -c /etc/shadowsocks.json -d stop
    $ sudo sslocal -c /etc/shadowsocks.json -d restart

    $ google-chrome --proxy-server=socks5://127.0.0.1:1080


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


******
polipo
******


.. code-block:: bash

    $ sudo apt-get install polipo
    $ sudo polipo -v
    $ man polipo
    # the default values.  See /usr/share/doc/polipo/examples/config.sample
    
.. code-block:: bash

    sudo tee /etc/shadowsocks.json <<-'EOF'
    
    # This file only needs to list configuration variables that deviate
    # from the default values.  See /usr/share/doc/polipo/examples/config.sample
    # and "polipo -v" for variables you can tweak and further information.

    logSyslog = true
    logFile = /var/log/polipo/polipo.log

    proxyAddress = "0.0.0.0"
    proxyPort = 17070
    socksParentProxy = "127.0.0.1:7070"
    socksProxyType = socks5
    allowedClients = 127.0.0.1
    
    EOF

    $ sudo service polipo restart


.. code-block:: bash

    # 以ubuntu 测试通过
    echo -e "\n------------------------------------------\n"
    curl ip.gs
    #curl ifconfig.me
    echo -e "\n------------------------------------------\n"

    export https_proxy=https://127.0.0.1:17070
    export HTTPS_PROXY=https://127.0.0.1:17070
    export  http_proxy=http://127.0.0.1:17070
    export  HTTP_PROXY=http://127.0.0.1:17070

    curl ip.gs
    #curl ifconfig.me
    echo -e "\n------------------------------------------\n"

 
参考
============

* `Shadowsocks + Polipo 配置全局代理(Linux 版本) <https://blog.csdn.net/jon_me/article/details/53525059/>`_
* `shadowsocks和polipo配置全局代理 <https://blog.denghaihui.com/2017/10/10/shadowsocks-polipo/>`_



