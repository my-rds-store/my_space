##########
dnsmasq
##########

*  邮箱
* `利用Dnsmasq部署DNS服务 <http://www.yunweipai.com/archives/8664.html>`_
* `Dnsmasq(简体中文) <https://wiki.archlinux.org/index.php/Dnsmasq_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>`_
* `关于dnsmasq的使用配置 <http://www.tuicool.com/articles/bUn2Uz>`_ 
* `Dnsmasq使用参考入门 <http://www.freeoa.net/osuport/servap/dnsmasq-use-intro-refer_2480.html>`_
* `dnsmasq之dnsmasq.conf配置 <http://www.mamicode.com/info-detail-1648780.html>`_
* `dnsmasq用法 <http://blog.csdn.net/h721510279812/article/details/39010355>`_


DNS服务
---------
http://374400.blog.51cto.com/364400/1428126/

https://wiki.debian.org/HowTo/dnsmasq
https://manpages.debian.org/jessie/dnsmasq-base/dnsmasq.8.en.html

http://www.yunweipai.com/archives/8664.html
http://chuansong.me/n/471642951828
http://debugo.com/dnsmasq/
http://blog.csdn.net/linuxnews/article/details/51034338

# slove "dnsmasq: setting capabilities failed: Operation not permitted"
https://hub.docker.com/r/fayehuang/centos-serf/~/dockerfile/



**cat /etc/dnsmasq.conf**

.. code::

    user=root
    interface=br0
    #except-interface=    #不想监听
    listen-address=192.168.5.204,127.0.0.1
    no-dhcp-interface=br0  # br0禁止dhcp服务

    strict-order
    all-servers   #发起查询,选择回应最快的一条作为查询结果返回
    resolv-file=/etc/dnsmasq.resolv.conf  # 配置Dnsmasq其他指向的DNS服务器

    no-hosts   # 不想使用/etc/hosts
    addn-hosts=/etc/dns_add_hosts   # 存放域名解析列表

    cache-size=5000  # 设置dns缓存大小,默认为150条

**cat /etc/dns_add_hosts**

.. code::

    58.56.27.130 mcgit.com
    192.168.2.3  jiangxumin.com
    124.133.33.114 mcedu.com


**cat /etc/dnsmasq.resolv.conf**

.. code::

    nameserver 114.114.114.114
    nameserver 180.76.76.76
    nameserver 8.8.8.8

.. code-block:: sh

    $ sudo netstat -anlp | grep ":53 "  # 查看53端口,是否占用
    $ sudo netstat -anlp | grep -w LISTEN | grep ":53 "

    $ dnsmasq --test             # 测试配置是正确
    $ systemctl restart dnsmasq  # 重启dnsmasq服务
    $ systemctl status dnsmasq   # 查看 dnsmasq 服务状态
    $ nslookup jiangxumin.com

