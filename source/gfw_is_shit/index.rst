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
* https://vultr.com

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

.. code-block:: bash
    
    #  代理服务器端
    nohup ssserver -p 443 -k password -m aes-256-cfb >>/dev/null &
    
    # 本地PC (ubuntu)
    $ sudo tee /etc/shadowsocks.json <<-'EOF'
    {
        "server":"45.63.71.50",
        "server_port":443,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"password",
        "timeout":300,
        "method":"aes-256-cfb",
        "fast_open": true,
        "workers": 1
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
