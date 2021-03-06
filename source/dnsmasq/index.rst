##########
Dnsmasq
##########


Install
=======

 
 .. code-block:: bash

    $ sudo yum install dnsmasq 


*  邮箱
* `利用Dnsmasq部署DNS服务 <http://www.yunweipai.com/archives/8664.html>`_
* `Dnsmasq(简体中文) <https://wiki.archlinux.org/index.php/Dnsmasq_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>`_
* `关于dnsmasq的使用配置 <http://www.tuicool.com/articles/bUn2Uz>`_ 
* `Dnsmasq使用参考入门 <http://www.freeoa.net/osuport/servap/dnsmasq-use-intro-refer_2480.html>`_
* `dnsmasq之dnsmasq.conf配置 <http://www.mamicode.com/info-detail-1648780.html>`_
* `dnsmasq用法 <http://blog.csdn.net/h721510279812/article/details/39010355>`_


DNS服务
=========

http://374400.blog.51cto.com/364400/1428126/

https://wiki.debian.org/HowTo/dnsmasq
https://manpages.debian.org/jessie/dnsmasq-base/dnsmasq.8.en.html

http://www.yunweipai.com/archives/8664.html
http://chuansong.me/n/471642951828
http://debugo.com/dnsmasq/
http://blog.csdn.net/linuxnews/article/details/51034338

# slove "dnsmasq: setting capabilities failed: Operation not permitted"
https://hub.docker.com/r/fayehuang/centos-serf/~/dockerfile/


.. code::

    # /etc/dnsmasq.conf

    user=root
    interface=br0
    except-interface=virbr0,lo   #不想监听
    #listen-address=192.168.5.204,127.0.0.1
    no-dhcp-interface=br0        # br0禁止dhcp服务

    strict-order
    all-servers   #发起查询,选择回应最快的一条作为查询结果返回
    resolv-file=/etc/dnsmasq.resolv.conf  # 配置Dnsmasq其他指向的DNS服务器

    no-hosts                        # 不想使用/etc/hosts
    addn-hosts=/etc/dns_add_hosts   # 存放域名解析列表

    cache-size=5000  # 设置dns缓存大小,默认为150条

**cat /etc/dns_add_hosts**

.. code::
     
    58.56.27.130   mcgit.net
    192.168.2.3    jiangxumin.net
    124.133.33.114 mcedu.net
    192.168.5.166  ftp.jiangxumin.net


**cat /etc/dnsmasq.resolv.conf**

.. code::

    nameserver 223.5.5.5
    nameserver 223.6.6.6
    nameserver 114.114.114.114
    nameserver 180.76.76.76
    nameserver 8.8.8.8

.. code-block:: sh

    $ sudo netstat -anlp | grep ":53 "  # 查看53端口,是否占用
    $ sudo netstat -anlp | grep -w LISTEN | grep ":53 "

    $ sudo dnsmasq --test             # 测试配置是正确
    $ sudo systemctl restart dnsmasq  # 重启dnsmasq服务
    $ sudo systemctl status dnsmasq   # 查看 dnsmasq 服务状态
    $ sudo nslookup  jiangxumin.com

    $ sudo dnsmasq  -C /etc/dnsmasq.conf  # 启动dnsmasq 进程 指定配置文件

DHCP服务
===============

.. code-block:: bash

    interface=br0
    bind-dynamic
    dhcp-range=192.168.106.1,192.168.106.240,1h
    dhcp-option=1,255.255.255.0
    dhcp-option=3,192.168.106.254
    dhcp-option=6,114.114.114.114,
    dhcp-leasefile=/var/lib/dnsmasq/dnsmasq.leases


Nat转发
===============

    * `Linux CentOS 6 NAT 转发 完整教程  <http://www.linuxidc.com/Linux/2017-07/145382.htm>`_
    * `linux-iptables nat设置路由转换 <http://blog.csdn.net/cooling88/article/details/51040054>`_

* 两个网卡:
    * enp2s0 : 连接外网, 192.168.8.25
    * enp3s0 : dhcp server, 192.168.16.254

enp3s0配置

::

    # 网卡地址配置成 网管地址
    # cat /etc/sysconfig/network-scripts/ifcfg-enp3s0

    DEVICE=enp3s0
    TYPE=Ethernet
    ONBOOT=yes
    BOOTPROTO=static

    IPADDR=192.168.16.254
    NETMASK=255.255.255.0

dnsmasq 配置

::

    #/etc/dnsmasq.conf

    user=root
    bind-dynamic
    #interface=enp2s0,enp3s0
    interface=enp3s0
    except-interface=enp2s0,lo
    dhcp-range=192.168.16.50,192.168.16.200,1h

    no-dhcp-interface=enp2s0         #   br0禁止dhcp服务

    dhcp-option=1,255.255.255.0
    dhcp-option=3,192.168.16.254  # 网关
    dhcp-option=6,8.8.8.8,180.76.76.76
    dhcp-leasefile=/var/lib/dnsmasq/dnsmasq.leases

    # Mac地址绑定 
    dhcp-host=00:1f:16:19:e2:df,192.168.16.122,infinite
    dhcp-host=00:e0:6f:69:e6:e8,192.168.16.123,infinite


防火墙net转发

.. code-block:: sh

    # add
    iptables -t nat -A POSTROUTING -s 192.168.16.0/24 -j SNAT --to 192.168.8.25

    # delete
    #iptables -t nat -D POSTROUTING -s 192.168.16.0/24 -j SNAT --to 192.168.8.25

    # show
    iptables -t nat -nL

