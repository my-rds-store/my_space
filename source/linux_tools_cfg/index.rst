####################
常用工具安装极其配置
####################

NFS (for ubuntu14.04)
========================== 1).  NFS Server 
-----------------------------------

.. code-block:: sh

     # Install NFS Server
     $ sudo apt-get install nfs-kernel-server 

.. code-block:: sh

    # 在 /etc/exports 添加
    tree -a /etc/exports<<-'EOF'
    /home/jxm/workspace *(rw,sync,no_root_squash,no_subtree_check)
    EOF

.. code-block:: sh

    # Restart NFS Server
    $ sudo /etc/init.d/rpcbind restart            # 重启rpcbind
    $ sudo /etc/init.d/nfs-kernel-server restart  # 重启nfs

    # 查看
    $ showmount -e 127.0.0.1 
        
    # 查看挂载
    $ sudo df -Th
    

2). NFS Client
--------------

.. code-block:: sh
    
    # 安装NFS Client
    $ sudo apt-get install  nfs-common
    
    # 查看服务器共享文件
    $ showmount -e 192.168.1.122

    # 挂载
    $ sudo mount -t nfs 192.168.1.122:/home/jxm/workspace /mnt
    $ sudo mount.nfs  192.168.1.122:/home/jxm/workspace /mnt


-----

CIFS (Ubuntu 14.04)
=======================

1). 设置共享
---------------

在要挂载的windows系统中找到需要挂载的硬盘或者文件夹，把它设置为共享，　如：在D盘下建立文件夹**cifs_shared**, 设为共享．

2). 安装与配置
---------------------------

.. code-block:: sh

    # 1. 安装 cifs-utils
    $ sudo apt-get install  cifs-utils

    # 2. 在linux系统/mnt目录下创建一个文件夹
    $ mkdir /mnt/work

    # 3. 挂载
    $ sudo mount -t cifs -o username=jxm,password=123456 //192.168.2.102/cifs_shared /mnt
    $ sudo mount.cifs -o username="jxm",password="123456",uid=jxm,gid=jxm  //192.168.2.102/cifs_shared /mnt


**更改文件夹权限。给mount共享文件夹所在组的写权限:**

    .. code-block:: sh

        $ sudo mount.cifs -o username="jxm",password="123456",uid=jxm,gid=jxm,dir_mode=0777 //192.168.2.102/cifs_shared /mnt/
        $ sudo mount.cifs //192.168.2.102/cifs_shared /mnt -o file_mode=0777,dir_mode=0777,rw,username=jxm,password=123456,iocharset=utf8
        $ sudo mount.cifs //192.168.2.102/cifs_shared /mnt -o file_mode=0777,dir_mode=0777,rw,username=jxm,password=123456,iocharset=cp93
        $ sudo mount.cifs //192.168.100.252/Public /mnt


.. image:: ./images/mount_cifs.png
    :scale: 100%
    :alt: alternate text
    :align: center

* `linux cifs自动挂载windows硬盘或文件夹 <http://myblack.blog.chinaunix.net/uid-29261327-id-3988933.html>`_
* `Linux下mount挂载cifs遇到的编码问题 <http://blog.sina.com.cn/s/blog_406127500101f92r.html>`_

-----

FTP服务 (Centos 7)
============================


.. code-block:: sh

    docker run -d --restart=always  --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 -e "PUBLICHOST=localhost"  \
    -e FTP_USER_NAME=mccr -e FTP_USER_PASS=123456 -e FTP_USER_HOME=/home/mccr \
     -v /home:/home  \
    stilliard/pure-ftpd


.. code-block:: sh

    # 1). 安装vsftpd
    $ sudo  yum install -y vsftpd

    # 2). 修改配置文件 /etc/vsftpd/vsftpd.conf 
    ##########################################
    # 如下图修改: anonymous_enable=NO 
    ##########################################

    # 3). 添加用户
    $ sudo  mkdir /home/ftpdir/jxm
    $ sudo  useradd -d /home/ftpdir/jxm -s /sbin/nologin jxm
    # or
    $ sudo  useradd -d /home/ftpdir/jxm -s /bin/sh jxm

    $ sudo  passwd jxm

    # 4). 删除用户：
    $ sudo  userdel  jxm

    # 5). 禁用防火墙
    $ sudo  systemctl stop firewalld.service
    $ sudo  systemctl disable firewalld.service

    # 6). 重启ftp
    $ sudo  systemctl restart vsftpd

Ftp遇到的问题  
---------------

* 没有网关,ftp登录慢,解决

  * `Linux vsftpd login method to solve the problem of slow card <https://www.programering.com/a/MDN1YzMwATU.html>`_
  * `vsftpd log in is slow <http://geekinlinux.blogspot.com/2012/11/vsftpd-log-in-is-slow.html>`_

.. code-block:: sh

    tee -a  /etc/vsftpd/vsftpd.conf <<-'EOF'
    reverse_lookup_enable=NO
    EOF

------------------------------------------------------------------

.. image:: ./images/vsftp.conf.png
    :scale: 100%
    :alt: alternate text
    :align: center

-----

挂载Ftp目录(Ubuntu 14.04)
==================================

.. code-block:: sh

    # 1). 安装curlftpfs
    $ sudo apt-get install  curlftpfs  

    # 2). 挂载
    $ sudo curlftpfs -o codepage=gbk  ftp://username:password@192.168.8.25   /mnt  
    $ sudo curlftpfs -o codepage=utf-8 ftp://username:password@192.168.8.25/public /mnt

-----

x11vnc
=========================

#. 安装与启动

.. code-block:: sh

  # 安装 x11 openbox
  # apt-get install xserver-xorg x11-xserver-utils
  $ sudo apt-get install xorg openbox

  # 安装x11vnc：
  $ sudo apt-get install x11vnc

  # 设置VNC的连接密码：
  $ sudo x11vnc -storepasswd
  $ sudo x11vnc -storepasswd 123456 ~/.vnc/passwd
  $ sudo x11vnc -storepasswd 123456 /etc/x11vnc.pass

  #. 启动VNC Server：
  $ sudo  x11vnc -forever -shared -rfbauth ~/.vnc/passwd

#. 开机自启动

.. code-block:: sh

  $ cp ~/.vnc/passwd /etc/x11vnc.pass

编辑 `/etc/init/x11vnc.conf`

::

  start on login-session-start
  script
  /usr/bin/x11vnc -auth /var/run/lightdm/root/:0 -noxrecord -noxfixes \
  -noxdamage -rfbauth /etc/x11vnc.pass -forever -bg -rfbport 5900 -o \
  /var/log/x11vnc.log
  end script


参考: Ubuntu安装X11VNC https://yq.aliyun.com/ziliao/29494

-----

Ubuntu 14.04安装teamviewer 远程桌面
=========================================


http://blog.csdn.net/love_xiaozhao/article/details/52704197


-----

安装WPS for Linux 
===================

* 百度云盘
* `WPS for Linux 下载地址 1 <http://community.wps.cn/download/>`_
* `WPS for Linux 下载地址 2 <http://wps-community.org/download.html?vl=a21#download>`_

:: 

    启动WPS for Linux后，出现提示"系统缺失字体" 。

    1. 下载缺失的字体文件，然后复制到Linux系统中的/usr/share/fonts文件夹中。

	    国外下载地址：https://www.dropbox.com/s/lfy4hvq95ilwyw5/wps_symbol_fonts.zip

	    国内下载地址：https://pan.baidu.com/s/1eS6xIzo

    2. 将解压的字体，拷贝到 /usr/share/fonts/wps-office/

    4. 重启 wps


参考: http://www.cnblogs.com/liangml/p/5969404.html

-----

Synergy 一套键鼠同时控制多台电脑
=========================================

* `[ 下载地址 ] <https://sourceforge.net/projects/synergy-stable-builds/files/>`_

.. code:: 

    Question::
        system tray is unavailable don't close your window

    sudo apt-get install sni-qt

* `Synergy 一套键鼠同时控制多台电脑 Win/Mac/Linux <https://www.iplaysoft.com/synergy.html>`_

* `Compiling Synergy <https://github.com/symless/synergy-core/wiki/Compiling#Dependencies>`_
  
-----

FSearch : Linux 版本的 Everything
=========================================

* `FSearch  <https://launchpad.net/~christian-boxdoerfer/+archive/ubuntu/fsearch-daily?field.series_filter>`_

.. code-block:: bash

    sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
    sudo apt-get update
    sudo apt install fsearch-trunk

--------


网络配置
=========================

配置Mac 地址 
--------------

* https://en.wikibooks.org/wiki/Changing_Your_MAC_Address/Linux
  
.. code-block:: sh

  /etc/init.d/networking stop
  ifconfig eth0 hw ether 02:01:02:03:04:08
  /etc/init.d/networking start

  /etc/init.d/network stop
  ip link set eth0 address 02:01:02:03:04:08
  /etc/init.d/network start

Bringing interfaces up/down 
----------------------------

.. code-block:: sh

    # ip 
    $ sudo  ip link set dev <interface> up
    $ sudo  ip l    s   dev <interface> down
    
    # ifconfig 
    $ sudo  /sbin/ifconfig <interface> up
    $ sudo  /sbin/ifconfig <interface> down

ip 命令使用 
--------------

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
--------------

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
---------------
    
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
----------------

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

-------

8. 定时任务
=============

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
==========

iftop
---------------

.. code-block:: sh

    $ brew install iftop # mac
    $ export PATH=$PATH:/usr/local/sbin

nethogs
---------------

.. code-block:: sh

    $ brew install nethogs # mac
    $ export PATH=$PATH:/usr/local/sbin

nload
---------------

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


tmux
--------------------------------

* `使用 tmux 打造更强大的终端 <https://linux.cn/article-8421-1.html>`_

* `Tmux 速成教程：技巧和调整 <http://blog.jobbole.com/87584/>`_

* `tmux-yank <https://tmux-plugins.github.io/tmux-yank/>`_

.. code-block:: sh

    $ sudo apt-get install tmux # ubuntu
    $ sudo brew    install tmux    # osX

.. code:: 

    C-b ?          显示快捷键帮助

    c-b : set -g display-panes-time 2000
    C-b : Up, Down 
          Left, Right  更改窗口大小

    C-b q          显示分隔窗口的编号
    C-b q 0-9      切换到窗口的编号对应的窗口

    C-b C-o        调换窗口位置，类似与vim 里的C-w
    C-b 空格键     采用下一个内置布局
    C-b !          把当前窗口变为新窗口
    C-b "          模向分隔窗口
    C-b %          纵向分隔窗口
    C-b o          跳到下一个分隔窗口
    C-b 上下键     上一个及下一个分隔窗口
    C-b ALT-方向键 调整分隔窗口大小
    C-b c          创建新窗口
    C-b 0~9        选择几号窗口
    C-b c          创建新窗口
    C-b n          选择下一个窗口
    C-b l          切换到最后使用的窗口
    C-b p          选择前一个窗口
    C-b w          以菜单方式显示及选择窗口
    C-b t          显示时钟
    C-b ;          切换到最后一个使用的面板
    C-b x          关闭面板
    C-b &          关闭窗口
    C-b s          以菜单方式显示和选择会话

    C-b d          退出tumx，并保存当前会话，这时，tmux仍在后台运行，
                   可以通过tmux attach进入 到指定的会话

.. code-block:: sh

    tee ${HOME}/.tmux.conf  <<-'EOF'
    #延时时间 1200 ms
    set -g display-panes-time 1200
    EOF


    $ tmux list-sessions
    
    $ tmux attach-session   # 附加

`tmate <https://tmate.io/>`_
--------------------------------

* https://linux.cn/article-9096-1.html


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


.. raw:: html

	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="https://music.163.com/outchain/player?type=2&id=413961293&auto=1&height=66"></iframe>



