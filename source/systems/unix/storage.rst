磁盘与存储
========================================

`磁盘坏道 <https://man7.org/linux/man-pages/man8/badblocks.8.html>`_
--------------------------------------------------------------------------------------------

.. code-block:: sh

    $ badblocks -b 4096 -c 16 /dev/hda1 -o hda-badblocks-list
    $ badblocks -s -v /dev/sda



* nettop

磁盘IO 查看
-----------------------

https://www.cnblogs.com/ggjucheng/archive/2013/01/13/2858810.html

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

