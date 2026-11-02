网络与远程
========================================

ssh 无密码登录
--------------------

https://blog.csdn.net/zhaihaifei/article/details/50523576




网络配置
---------------------------

配置Mac 地址 
```````````````````````

* https://en.wikibooks.org/wiki/Changing_Your_MAC_Address/Linux
  
.. code-block:: sh

  /etc/init.d/networking stop
  ifconfig eth0 hw ether 02:01:02:03:04:08
  /etc/init.d/networking start

  /etc/init.d/network stop
  ip link set eth0 address 02:01:02:03:04:08
  /etc/init.d/network start

Bringing interfaces up/down 
`````````````````````````````````

.. code-block:: sh

    # ip 
    $ sudo  ip link set dev <interface> up
    $ sudo  ip l    s   dev <interface> down
    
    # ifconfig 
    $ sudo  /sbin/ifconfig <interface> up
    $ sudo  /sbin/ifconfig <interface> down

ip 命令使用 
```````````````````````

.. code-block:: sh

    ip addr add 192.168.2.1/24 dev enp0s25 #添加IP地址
    ip addr del 192.168.2.1/24 dev enp0s25 #删除IP地址

    ip link set enp0s25 up/down

    sudo ip route show
    sudo ip route add default via 192.168.2.1 # 添加默认路由
    sudo ip route del default via 192.168.2.1 # 

    # 修改Mac 地址
    sudo ip link set dev wlp0s20f3 down
    sudo ip link set dev wlp0s20f3 address 00:01:4f:00:15:f1
    sudo ip link set dev wlp0s20f3 up

CentOS 网络
`````````````````````

* `CentOS 7网卡网桥、绑定设置 <https://www.cnblogs.com/configure/p/5799538.html>`_
* `bond <https://www.cnblogs.com/liwanggui/p/6807212.html>`_
   
.. code::

    TYPE=Ethernet
    DEVICE=enp2s0
    ONBOOT=yes
    BOOTPROTO=static
    IPADDR=192.168.8.25
    NETMASK=255.255.255.0
    GATEWAY=192.168.8.254
    DNS1=114.114.114.114
    DNS2=180.76.76.76

ubuntu 网络
```````````````````````
:: 

    auto lo 
    iface lo inet loopback 

    auto enp1s0
    iface enp1s0 inet manual 

    auto br0
    iface br0 inet dhcp

    bridge_ports enp1s0 
    bridge_stp off   
    bridge_fd 0      
    bridge_maxwait 0 
    bridge_maxage 12


::

        # /etc/network/interfaces 添加
	auto enp0s25
	iface enp0s25 inet static
	address 192.168.0.88
	netmask 255.255.255.0
	gateway 192.168.0.1

::

        sudo apt-get install resolvconf

        # interfaces 方式修改 DNS,  在 /etc/network/interfaces 添加
	dns-nameserver xx.xx.xx.xx  # 单个 重启电脑生效
	dns-nameserver xxx.xxx.xx.xx
	dns-nameservers xxx.xxx.xxx.xxx xxx.xxx.xx.xxx  # 多个 重启电脑生效

::

	# resolvconf 方式修改 dns
        #    /etc/resolv.conf                     # 临时
        #    /etc/resolvconf/resolv.conf.d/head   # sudo resolvconf -u  更新

        nameserver xxx.xxx.xx.xxx
        nameserver xx.xx.xx.xx


无线网卡
`````````````````````

* `ubuntu server 16.10 启用有/无线网卡 <https://blog.csdn.net/ltwang_tech/article/details/69258249>`_

* BCM4332
    * https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers
    * https://help.ubuntu.com/community/WifiDocs/Driver/bcm43xx

.. code-block:: sh

    sudo apt-get install lshw
    sudo apt-get install wireless-tools wpasupplicant 

    #Ubuntu Server默认的情况下不会启用无线网卡，需要手动来启用无线网卡。
    sudo lshw -numeric -class network
    sudo ifconfig -a

    #检查是哪一个接口来支持无线连接
    sudo iwconfig
    #启动无线网卡WLAN0
    sudo ip link set wlan0 up
    # 查看 SSID
    sudo iwlist wlan0 scanning | egrep 'Cell |Encryption|Quality|Last beacon|ESSID'
     
    #生成无线路由密钥。这一步就是根据你无线网络的SSID和密码，来生成WLAN需要的配置文件
    wpa_passphrase ESSID password > /etc/wpa_config.conf
    # or
    wpa_passphrase SSID  password > /etc/wpa_config.conf

    # 设置无线网络。
    # 编辑/etc/network/interfaces文件，将wlan添加到其中：
    tee -a /etc/network/interfaces <<-'EOF'
    auto wlan0
    iface wlan0 inet dhcp
    wpa-conf /etc/wpa_config.conf
    EOF

    # 重新启动计算机。根据我实际的操作结果来看，配置好了之后虽然说无线网卡被启用了，但是驱动貌似没加载全。
    # 因此需要重启Ubuntu Server以便完整启用无线网卡。

 

防火墙
---------------

* `Iptables与Firewalld防火墙 <https://www.linuxprobe.com/chapter-08.html>`_

* `Centos防火墙设置与端口开放的方法 <https://blog.csdn.net/u011846257/article/details/54707864>`_
  
  .. code-block:: sh
       
	systemctl start/stop firewalld      # 启动/禁用防火墙
	systemctl enable/disable firewalld  # 设置开机自动启动/禁用开机自启动

	firewall-cmd --reload               # 重启防火墙
     
	# 查看防火墙状态
	systemctl status firewalld 
	firewall-cmd --state

	firewall-cmd --version  # 版本

	firewall-cmd --get-active-zones           # 查看区域信息
	firewall-cmd --get-zone-of-interface=eth0 # 查看指定接口所属区域信息

	# 将接口添加到区域(默认接口都在public)
	firewall-cmd --zone=public --add-interface=eth0 # (永久生效再加上 --permanent 然后reload防火墙)
	
	# 设置默认接口区域
	firewall-cmd --set-default-zone=public(立即生效，无需重启)
	
	firewall-cmd --reload          # 或
	firewall-cmd --complete-reload # (两者的区别就是第一个无需断开连接，就是firewalld特性之一动态添加规则，
			  	       #  第二个需要断开连接，类似重启服务)


	# 查看指定区域所有打开的端口
	firewall-cmd --zone=public --list-ports

	# 在指定区域打开端口（记得重启防火墙）
	firewall-cmd --zone=public --add-port=80/tcp             # 临时,重启失效
	firewall-cmd --zone=public --add-port=80/tcp --permanent # 永久生效再加上 

	firewall-cmd --panic-on    # 拒绝所有包
	firewall-cmd --panic-off   # 取消拒绝状态
	firewall-cmd --query-panic # 查看是否拒绝
  

	# 说明：
	#   –zone              作用域
	#   –add-port=8080/tcp 添加端口，格式为：端口/通讯协议
	#   –permanent         永久生效，没有此参数重启后失效


流量监控   
--------------

iftop
```````````````

.. code-block:: sh

    $ brew install iftop # mac
    $ export PATH=$PATH:/usr/local/sbin

nethogs
```````````````

.. code-block:: sh

    $ brew install nethogs # mac
    $ export PATH=$PATH:/usr/local/sbin

nload
`````````````````

.. code-block:: sh

    $ apt-get install nload 

查看硬件温度
------------------------------

*  `lm-sensors <https://wiki.archlinux.org/index.php/Lm_sensors_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>`_


.. code-block:: sh
     
    $ sudo apt-get install lm-sensors
    $ sudo yum     install lm_sensors

    #  CPU  温度
    $ sensors-detect
    $ sensors

    #  硬盘温度
    $ sudo apt-get install hddtemp
    $ sudo hddtemp /dev/sda1

    #  cpu 使用
    $ sudo apt-get install sysstat
    $ mpstat
    $ vmstat

    $ watch -d -n 1 'echo free;mpstat;echo;free -m;echo temp; sudo hddtemp /dev/sd? ;echo; sensors'


网络唤醒
--------------------------------

* `Wake Up Computers Using Linux Command  <https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html>`_

.. code-block:: sh

    sudo apt-get install  -y etherwake 

    wakeonlan    E4:3A:6E:06:39:0A
    # or
    sudo etherwake -i eth0  E4:3A:6E:06:39:0A


检查端口通不通
----------------

查看端口占用
`````````````````

    .. code-block:: sh

        $ sudo netstat -anp | grep ":80\ "


检查端口通不通
`````````````````

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

