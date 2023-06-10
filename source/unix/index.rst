Linux
============

split分割文件
-------------

http://blog.csdn.net/whu_zhangmin/article/details/45870077

.. code:: sh

    $ split -b 4000M -d -a 1 cm-11.tar.gz cm-11.tar.gz.

    # 使用split命令，-b 4000M 表示设置每个分割包的大小，单位还是可以k
    #  -d "参数指定生成的分割包后缀为数字的形式
    # -a x来设定序列的长度(默认值是2)，这里设定序列的长度为1

    # 执行命令后，生成压缩包如下：
    -rw-r--r--  1 root     root      4194304000 May 20 14:00 cm-11.tar.gz.0
    -rw-r--r--  1 root     root      4194304000 May 20 14:02 cm-11.tar.gz.1
    -rw-r--r--  1 root     root      4194304000 May 20 14:03 cm-11.tar.gz.2
    -rw-r--r--  1 root     root      4194304000 May 20 14:05 cm-11.tar.gz.3
    -rw-r--r--  1 root     root      4194304000 May 20 14:06 cm-11.tar.gz.4
    -rw-r--r--  1 root     root      4194304000 May 20 14:08 cm-11.tar.gz.5
    -rw-r--r--  1 root     root      4194304000 May 20 14:09 cm-11.tar.gz.6
    -rw-r--r--  1 root     root      2256379886 May 20 14:10 cm-11.tar.gz.7

    # 合并文件
    $ cat cm-11.tar.gz.* | tar -zxv

7zip
-------

* `7-zip-examples <https://www.dotnetperls.com/7-zip-examples>`_

.. code-block:: sh

  $ 7za a -t7z w7_64_5200u_comp.qcow2.7z w7_64_5200u_comp.qcow2 -mx9


tar 打包
---------------

.. code-block:: sh

    $ tar czvf test.tar.gz *         # 压缩当前文件夹下非隐藏文件的文件
    $ tar czvf ../abc.tgz  .[!.]* *  # 压缩当前文件夹下所有文件,排除两个隐藏文件夹"."和“..”

    $ tar -tf  name.tgz  # 查看压缩包内容


nohub 
----------------------------

.. code-block:: sh

    nohup /root/runoob.sh > /dev/null 2>&1 &
    nohup /root/runoob.sh > runoob.log 2>&1 &





常见问题
--------------------

.. code-block:: sh

    # 1. umount.nfs: /mnt: device is busy
    $ fuser -vm /mnt  #  查看挂载点，被那些进程占用


`磁盘坏道 <http://man.linuxde.net/badblocks>`_
--------------------------------------------------------

.. code-block:: sh

    $ badblocks -b 4096 -c 16 /dev/hda1 -o hda-badblocks-list
    $ badblocks -s -v /dev/sda



* nettop

ssh 无密码登录
--------------------

http://blog.csdn.net/zhaihaifei/article/details/50523576




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

* `CentOS 7网卡网桥、绑定设置 <http://www.cnblogs.com/configure/p/5799538.html>`_
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


8. 定时任务
----------------------

.. code-block:: sh

    $ export EDITOR=vim
    $ crontab -e

    $ service cron status/start/stop/restart
    $ systemcltl  restart crond

::

    # 每天　23 点　1 分　执行
    # m h  dom mon dow   command
    1 23 * * *  /root/workspace_for_docker/mk_mcstudent_iso.sh 

.. image:: https://images2015.cnblogs.com/blog/1173412/201706/1173412-20170627141421461-845471341.png

* `使用crontab，让linux定时执行shell脚本 <https://www.cnblogs.com/wucaiyun1/p/6866730.html>`_
* `一个简单的linux下设置定时执行shell脚本的示例 <https://www.cnblogs.com/bcphp/p/7084967.html>`_

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


Linux 快速原型工具 Pencil 
--------------------------------

* http://pencil.evolus.vn/Downloads.html


`Ubuntu制作apt源 <https://www.cnblogs.com/sixloop/p/make_ubuntu_apt_repo.html>`_
-----------------------------------------------------------------------------------

* nginx

.. code-block:: sh

    apt install nginx


* nginx辑配置文件

::

    server {
     error_log /var/log/nginx/apt_server.log info;
     listen  8080;
     #server_name www.example.com;
     root /var/www/apt_server;
     autoindex on;
     
     location / {
      #index index.html index.htm;
     }
    }


.. code-block:: sh

    nginx -t reload  #重载配置


* 初始化仓库目录

.. code-block:: sh

    mkdir -p /var/www/apt_server
    cd /var/www/apt_server
    mkdir -p dists/zesty/main/binary-amd64
    mkdir -p dists/zesty/main/binary-i386
    mkdir -p dists/zesty/main/binary-arm64
    ln -s /var/cache/apt/archives /var/www/apt_server/packages


    sudo apt-get install dpkg-dev 


* 建立包列表及依赖信息文件

.. code-block:: sh

    cd /var/www/apt_server/
    dpkg-scanpackages packages /dev/null | gzip > dists/zesty/main/binary-amd64/Packages.gz
    dpkg-scanpackages packages /dev/null | gzip > dists/zesty/main/binary-i386/Packages.gz
    dpkg-scanpackages packages /dev/null | gzip > dists/zesty/main/binary-arm64/Packages.gz


-------------------


* 加入源地址 `/etc/apt/sources.list`

::

    deb http://{IP}:8080 zesty main
    deb [arch=amd64] http://{IP}:8080 zesty main
    deb [arch=i386] http://{IP}:8080 zesty main
    deb [arch=arm64] http://{IP}:8080 zesty main


.. code-block:: sh

    sudo apt-get update --allow-insecure-repositories

    sudo apt-get install vim --allow-unauthenticated

        # 注意事项：需要加上这个 --allow-unauthenticated选项。
        #           本地的源是没有签名的，直接更新ubuntu下的apt会提示找不到release文件，
        #           是一种不安全的源，默认是被禁用的。

*  递归下载所需deb包及依赖包


.. code-block:: sh

    #edit your package list.
    PACKAGES="wget 
              tcpdump
              unzip"
     
    # get dep recurse
    DEPS=$(apt-cache depends --recurse --no-recommends --no-suggests \
              --no-conflicts --no-breaks --no-replaces --no-enhances \
              --no-pre-depends ${PACKAGES} | grep "^\w" )
     
    echo $DEPS
     
    # download all deps
    cd /var/www/ubuntu/packages/
    apt-get download $DEPS


* apt-mirror 待研究


gdialog
----------------

.. code-block:: sh


    #!/bin/bash

    #test the gDialog
    height=24
    width=80
    text="text"
    filename="/home/ocean/.bashrc"

    gdialog --title "testbox" --textbox "$filename" $(($height*4)) $width 
    gdialog --title "checklist" --checklist "$text" $height $width   2   "1" "aaaa" "on"  "2" "bbbb" "on" # list_height [tag text status]
    gdialog --title "infobox" --infobox "$text =========" $height $width
    gdialog --title "inputbox" --inputbox  "$text" $height $width "initial string" 
    gdialog --title "menu" --menu "$text" $height $width 2 "1" "aaaa" "2" "bbbb"    #menu_height [tag item]
    gdialog --title "msgbox" --msgbox "$text========" $height $width 
    gdialog --title "radiolist" --radiolist "$text" $height $width 2 "1" "aaaa" "on" "2" "bbbb" "off"
    gdialog --title "yesno" --yesno "$text" $height $widch


Linux平台下的service程序编写指南
------------------------------------

C
    http://blog.csdn.net/gobitan/article/details/5903342
python
    http://blog.csdn.net/philip502/article/details/13511625
    https://stackoverflow.com/questions/4705564/python-script-as-linux-service-daemon


磁盘IO 查看
-----------------------

http://www.cnblogs.com/ggjucheng/archive/2013/01/13/2858810.html

.. code-block:: sh
    
     $ iostat -d -x -k 1   


硬盘分区格式化与挂载
----------------------

* 添加磁盘分区 

.. code::

    root@localhost:~# fdisk /dev/vdb 
    Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
    Building a new DOS disklabel with disk identifier 0x7de2444b.
    Changes will remain in memory only, until you decide to write them.
    After that, of course, the previous content won't be recoverable.

    Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

    Command (m for help): m
    Command action
       a   toggle a bootable flag
       b   edit bsd disklabel
       c   toggle the dos compatibility flag
       d   delete a partition
       l   list known partition types
       m   print this menu
       n   add a new partition
       o   create a new empty DOS partition table
       p   print the partition table
       q   quit without saving changes
       s   create a new empty Sun disklabel
       t   change a partition's system id
       u   change display/entry units
       v   verify the partition table
       w   write table to disk and exit
       x   extra functionality (experts only)

    Command (m for help): n
    Partition type:
       p   primary (0 primary, 0 extended, 4 free)
       e   extended
    Select (default p): p
    Partition number (1-4, default 1): 1
    First sector (2048-146800639, default 2048): 
    Using default value 2048
    Last sector, +sectors or +size{K,M,G} (2048-146800639, default 146800639): 
    Using default value 146800639

    Command (m for help): w
    The partition table has been altered!

.. code-block:: sh

    # 格式化
    mkfs -t ext4 -c /dev/vdb1
    mkfs.ext4 -c /dev/vdb1

.. code::

    # /etc/fstabe
    # sudo  blkid  查看 磁盘UUID
    UUID=fd05da95-d9f5-4a3e-8cf3-41c9dff1f5b8  /home    ext4  defaults   0  0
    # or
    /dev/vdb1  /home    ext4  defaults   0  0


* `Linux LVM逻辑卷配置过程详解（创建，增加，减少，删除，卸载)  <http://blog.51cto.com/dreamfire/1084729>`_


.. code-block:: sh
    
    # lvm 减少逻辑卷的空间,释放给其他逻辑卷使用

    ###############################
    # 1. 减少逻辑卷ssd-cdata的空间
    ###############################
    umount /dev/mapper/ssd-cdata           # 卸载 ssd-cdata
    
    e2fsck -f /dev/mapper/ssd-cdata        # 检车逻辑卷上　剩余空间
    
    resize2fs /dev/mapper/ssd-cdata 10G    # 将文件系统减少到 10G
    
    lvreduce -L 10G /dev/mapper/ssd-cdata  # 将逻辑卷减少到 10G
    　
    mount /dev/mapper/ssd-cdata /cdata     # 挂载重新使用


    ###############################
    #  2. 增加逻辑卷ssd-data的空间
    ###############################
    
    pvscan           # 查看剩余,未分配空间
    
    lvextend -L +13.90G  /dev/mapper/ssd-data   # 逻辑卷增加10G

    lvs               # 查看

    # 同步文件系统
    resize2fs  /dev/mapper/ssd-data   # resize2fs命令,针对的是ext2、ext3、ext4文件系统
    xfs_growfs /dev/mapper/ssd-data  # xfs_growfs命令,针对的是xfs文件系统


    ###############################
    #  扩容
    ###############################

    # 1 建立新的分区
    fdisk  -l /dev/vda
    partprobe

    # 2 新建新的pv
    pvcreate /dev/vda3
    pvdisplay
    pvscan

    # 3 # 放大 VG
    # vgcreate -s 16M centos /dev/vda3
    vgextend centos /dev/vda3
    vgdisplay

    # 4  增加 LV
    lvextend -L +50G /dev/mapper/centos-root
    lvdisplay

    # 5 完整的将lv 容量，扩充到整个文件系统
    # resize2fs /dev/mapper/centos-root
    xfs_growfs /dev/mapper/centos-root
    df -hT


.. code-block:: sh

    # 
    curl http://ip-api.com/json/

    # 获取 public ip 
    $ curl icanhazip.com
    $ curl ipecho.net/plain; echo
    $ curl ifconfig.me
    $ curl  -s freegeoip.net/xml/ | grep "<IP>" | sed 's/<\/.*$//g' | sed 's/^.*>//g'
    
    # get <CountryCode>
    $ curl  -s freegeoip.net/json/ | sed "s/^.*country_code\":\"//g" | sed 's/\".*$//g'
    $ curl  -s freegeoip.net/xml/ | grep "<CountryCode>" | sed 's/<\/.*$//g' | sed 's/^.*>//g'

    # 
    $ curl freegeoip.net/json/github.com
    $ curl freegeoip.net/json/baidu.com
    $ curl ipinfo.io/8.8.8.8
    $ curl ipinfo.io/8.8.8.8/country

    # https://github.com/fiorix/freegeoip
    # https://ipstack.com/

Ubuntu 修改 启动时间等待  
-------------------------------

.. code-block:: sh

    # Ubuntu14.04 , Ubuntu18.04
    
    sed -i 's/^.*GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=0/' /etc/default/grub
    sed -i 's/timeout=10/timeout=0/' /etc/grub.d/30_os-prober
    update-grub


禁止ubuntu 更新内核   
--------------------------------------


Systemd  
-------------------

* `Systemd 入门教程 <http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html>`_
* `systemctl 命令完全指南 <https://www.linuxidc.com/Linux/2015-07/120833.htm>`_
* `REATING AND MODIFYING SYSTEMD UNIT FILES <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files>`_

.. code-block:: sh

    # Ubuntu 目录为 /lib/systemd/system/
    # Centos 目录为 /usr/lib/systemd/system/

    systemctl cat sshd.service

    # 修改后，reload
    systemctl daemon-reload

    systemctl reload *.service #重新加载服务配置文件 ?????????????????

    systemctl enable  massclouds-core
    systemctl disable massclouds-core

    systemctl start   massclouds-core
    systemctl stop    massclouds-core
    systemctl restart massclouds-core

    # list enabled ...
    systemctl list-unit-files | grep enabled

    # 查看日志
    journalctl -f -u massclouds-core


example 
---------------

.. code-block:: ini

    [Unit]
    Description=xinit
    #After=systemd-user-sessions.service
    [Service]
    #Environment=DISPLAY=:0.0
    Type=simple
    ExecStart=/usr/bin/startx  /usr/bin/openbox
    StandardOutput=syslog
    #KillMode=process
    [Install]
    WantedBy=multi-user.target
    #WantedBy=graphical.target

.. code-block:: ini

    [Unit]
    Description=massclouds-core
    [Service]
    Type=simple
    ExecStart=/opt/massclouds_core/bin/massclouds
    KillMode=process
    [Install]
    WantedBy=multi-user.target
    #WantedBy=graphical.target  # 图形用户

------

::

    [Unit]
    Description : 服务的简单描述
    Documentation ： 服务文档
    Before、After:定义启动顺序。Before=xxx.service,代表本服务在xxx.service启动之前启动。After=xxx.service,代表本服务在xxx.service之后启动。
    Requires：这个单元启动了，它需要的单元也会被启动；它需要的单元被停止了，这个单元也停止了。
    Wants：推荐使用。这个单元启动了，它需要的单元也会被启动；它需要的单元被停止了，对本单元没有影响。

::

    [Service]
    Type=simple（默认值）：systemd认为该服务将立即启动。服务进程不会fork。如果该服务要启动其他服务，不要使用此类型启动，除非该服务是socket激活型。
    Type=forking：systemd认为当该服务进程fork，且父进程退出后服务启动成功。对于常规的守护进程（daemon），除非你确定此启动方式无法满足需求，使用此类型启动即可。使用此启动类型应同时指定 PIDFile=，以便systemd能够跟踪服务的主进程。
    Type=oneshot：这一选项适用于只执行一项任务、随后立即退出的服务。可能需要同时设置 RemainAfterExit=yes 使得 systemd 在服务进程退出之后仍然认为服务处于激活状态。
    Type=notify：与 Type=simple 相同，但约定服务会在就绪后向 systemd 发送一个信号。这一通知的实现由 libsystemd-daemon.so 提供。
    Type=dbus：若以此方式启动，当指定的 BusName 出现在DBus系统总线上时，systemd认为服务就绪。
    Type=idle: systemd会等待所有任务(Jobs)处理完成后，才开始执行idle类型的单元。除此之外，其他行为和Type=simple 类似。
    PIDFile：pid文件路径
    ExecStart：指定启动单元的命令或者脚本，ExecStartPre和ExecStartPost节指定在ExecStart之前或者之后用户自定义执行的脚本。Type=oneshot允许指定多个希望顺序执行的用户自定义命令。
    ExecReload：指定单元停止时执行的命令或者脚本。
    ExecStop：指定单元停止时执行的命令或者脚本。
    PrivateTmp：True表示给服务分配独立的临时空间
    Restart：这个选项如果被允许，服务重启的时候进程会退出，会通过systemctl命令执行清除并重启的操作。
    RemainAfterExit：如果设置这个选择为真，服务会被认为是在激活状态，即使所以的进程已经退出，默认的值为假，这个选项只有在Type=oneshot时需要被配置。
    StandardOutput=console代表打印输出到系统日志文件，StandardOutput=tty代表打印输出到串口

::

    [Install]
    Alias：为单元提供一个空间分离的附加名字。
    RequiredBy：单元被允许运行需要的一系列依赖单元，RequiredBy列表从Require获得依赖信息。
    WantBy：单元被允许运行需要的弱依赖性单元，Wantby从Want列表获得依赖信息。
    Also：指出和单元一起安装或者被协助的单元。
    DefaultInstance：实例单元的限制，这个选项指定如果单元被允许运行默认的实例。


Service 
---------------

* `Ubuntu Service说明与使用方法 <http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html>`_

