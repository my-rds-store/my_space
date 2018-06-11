####################
常用工具安装极其配置
####################

NFS (for ubuntu14.04)
==========================

1).  NFS Server 
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

`WPS for Linux 下载地址 <http://wps-community.org/download.html?vl=a21#download>`_

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

* `Synergy 一套键鼠同时控制多台电脑 Win/Mac/Linux <https://www.iplaysoft.com/synergy.html>`_

* `Compiling Synergy <https://github.com/symless/synergy-core/wiki/Compiling#Dependencies>`_

-----

Centos 7 网络配置
=========================

`1. CentOS 7网卡网桥、绑定设置 <http://www.cnblogs.com/configure/p/5799538.html>`_
   
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
    $ sudo  service cron status/start/stop/restart

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

lm-sensors (CPU  温度)
------------------------------

.. code-block:: sh
     
    $ sudo apt-get install lm-sensors
    $ sudo yum     install lm_sensors

    #  CPU  温度
    $ sensors





.. raw:: html

	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="https://music.163.com/outchain/player?type=2&id=413961293&auto=1&height=66"></iframe>

