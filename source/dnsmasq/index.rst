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

http://www.yunweipai.com/archives/8664.html
http://chuansong.me/n/471642951828
http://debugo.com/dnsmasq/
http://blog.csdn.net/linuxnews/article/details/51034338

# slove "dnsmasq: setting capabilities failed: Operation not permitted"
https://hub.docker.com/r/fayehuang/centos-serf/~/dockerfile/



**cat /etc/dnsmasq.conf**

.. code::

    #port=5353
    resolv-file=/etc/dnsmasq.resolv.conf
    strict-order
    user=root
    listen-address=172.17.0.2,127.0.0.1
    #no-dhcp-interface=eth0
    bind-dynamic
    no-hosts
    addn-hosts=/etc/dns_add_hosts
    cache-size=5000

**cat /etc/dns_add_hosts**

.. code::

    124.133.33.114 mcabc.com
    58.56.27.130   mcgit

**cat /etc/dnsmasq.resolv.conf**

.. code::

    nameserver 114.114.114.114
    nameserver 8.8.8.8

.. code-block:: sh

    $ nslookup mcabc.com

