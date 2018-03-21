########
科学上网
########

************
VPS厂商
************

* `搬瓦工 <https://bwh1.net/>`_
* `Vultr(中文网) <https://buy.shangyufeidi.com/vultr/?f=bad>`_
* https://vultr.com

***************
1. shadowsocks
***************

* `GitHub shadowsocks <https://github.com/ziggear/shadowsocks>`_

参考
============

* https://www.cnblogs.com/cursorhu/p/7157257.html

* http://blog.csdn.net/lee_j_r/article/details/54019691
* https://www.8dlive.com/post/168.html
* http://xinwen.eastday.com/a/170207195821936.html


安装 shadowsocks
==================

.. code-block:: bash

    $ sudo pip insall shadowsocks


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

************
2. VPN
************

*整理中....*

