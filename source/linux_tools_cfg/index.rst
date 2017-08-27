####################
常用工具安装极其配置
####################


一. NFS (for ubuntu14.04)
==========================

1).  NFS Server 
-----------------------------------

**Install NFS Server**

    .. code-block:: sh

         $ sudo apt-get install nfs-kernel-server 

**Config**

    在 **/etc/exports** 添加

    .. code::

        /home/jxm/workspace *(rw,sync,no_root_squash,no_subtree_check)


**Restart NFS Server**

    .. code-block:: sh

        $ sudo /etc/init.d/rpcbind restart            # 重启rpcbind
        $ sudo /etc/init.d/nfs-kernel-server restart  # 重启nfs
    
**查看**

    .. code-block:: sh

        $ showmount -e 127.0.0.1 

**查看挂载**
    
    .. code-block:: bash
        
        $ sudo df -Th
    

2). NFS Client
--------------

**安装NFS Client**

    .. code-block:: sh
    
        $ sudo apt-get install  nfs-common

**查看服务器共享文件**

    .. code-block:: sh
    
        $ showmount -e 192.168.1.122

**挂载**

    .. code-block:: sh

        $ sudo mount -t nfs 192.168.1.122:/home/jxm/workspace /mnt

        $ sudo mount.nfs  192.168.1.122:/home/jxm/workspace /mnt

二. CIFS (Ubuntu 14.04)
=======================

1). 设置共享
---------------

在要挂载的windows系统中找到需要挂载的硬盘或者文件夹，把它设置为共享，　如：在D盘下建立文件夹**cifs_shared**, 设为共享．

2). ubuntu 安装　cifs-utils
---------------------------
    .. code-block:: sh

        $ sudo apt-get install  cifs-utils

3). 在linux系统/mnt目录下创建一个文件夹
-----------------------------------------

    .. code-block:: sh

        $ mkdir /mnt/work

4).  挂载
------------

    .. code-block:: sh

        $ sudo mount -t cifs -o username=jxm,password=123456 //192.168.2.102/cifs_shared /mnt

    或者:

    .. code-block:: sh

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



三). FTP服务 (Centos 7)
============================




1). 安装vsftpd
--------------------------

    .. code-block:: sh

        $ sudo  yum install -y vsftpd

2). 修改配置文件 /etc/vsftpd/vsftpd.conf 修改 anonymous_enable=NO 
------------------------------------------------------------------

.. image:: ./images/vsftp.conf.png
    :scale: 100%
    :alt: alternate text
    :align: center


3). 添加用户
----------------

    .. code-block:: sh

        $ sudo  mkdir /home/ftpdir/jxm
        $ sudo  useradd -d /home/ftpdir/jxm -s /sbin/nologin jxm
                   或 sudo  useradd -d /home/ftpdir/jxm -s /bin/bash jxm
        $ sudo  passwd jxm

4). 删除用户：
--------------

    .. code-block:: sh

        $ sudo  userdel  jxm

5). 禁用防火墙
-------------------

    .. code-block:: sh

        $ sudo  systemctl stop firewalld.service
        $ sudo  systemctl disable firewalld.service

6). 重启ftp
----------------

    .. code-block:: sh

        $ sudo  systemctl restart vsftpd


四). 挂载Ftp目录(Ubuntu 14.04)
==================================

1). 安装curlftpfs
-------------------

    .. code-block:: sh

        $ sudo apt-get install  curlftpfs  


2). 挂载
-------------
    .. code-block:: sh

        $ sudo curlftpfs -o codepage=gbk  ftp://username:password@192.168.8.25   /mnt  

        $ sudo curlftpfs -o codepage=utf-8 ftp://username:password@192.168.8.25/public /mnt




五). Centos 7 网络配置
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


.. raw:: html

	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="https://music.163.com/outchain/player?type=2&id=413961293&auto=1&height=66"></iframe>



