##############
Shell 
##############

*******
ZSH    
*******

* `Oh My ZSH <http://ohmyz.sh/>`_

*******
Book   
*******

* `shell 书籍推荐 <https://blog.csdn.net/hw478983/article/details/78813906>`_

------

* `超赞的Linux软件 <https://alim0x.gitbooks.io/awesome-linux-software-zh_cn/content/>`_

********
Bash    
********


* `explainshell <https://explainshell.com/>`_

更改用户名
---------------

.. code-block:: sh

    #To change username (it is probably best to do this without being logged in):
    sudo usermod -l newUsername oldUsername
    # This however, doesn't rename the home folder.

    # To change home-folder, use
    sudo usermod -d /home/newHomeDir -m newUsername

更改tilix
---------------


.. code-block:: sh

    sudo update-alternatives --config x-terminal-emulator

    #  选择 tilix.wrapper  对应的 标号,  更改 默认 启动


* `linux查看硬链接对应的所有文件 <http://blog.51cto.com/liuqun/1982654>`_


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


常用命令
--------

    http://blog.csdn.net/jxm_csdn/article/details/52234267

    `我使用过的Linux命令之trap - 在脚本中处理信号 <http://blog.csdn.net/world_hello_100/article/details/18049599>`_

* `Bash 脚本 set 命令教程 <http://www.ruanyifeng.com/blog/2017/11/bash-set.html?utm_source=tool.lu>`_

修改文件名 rename
-------------------

* https://blog.csdn.net/WMX843230304WMX/article/details/81870536


.. code-block:: sh

    sudo apt-get instal rename 

    rename -n 's/Screenshotfrom302.mp4/p/' *.png   # 列出需要重命名的文件,只显示，不执行修改
    rename -v 's/Screenshotfrom302.mp4/p/' *.png   # 执行修改，列出已重命名的文件

    rename 'y/A-Z/a-z/' *  # 文件名 大写改小写
    rename 's/[ ]+//g'  *  # 去除文件名的空格
    rename 's/^/myend/' *  # 文件头加入字符串 myend
    rename 's/$/myend/' *  # 文件尾加入字符串 myend


判断安装包,有没有安装
------------------------

* Ubuntu

.. code-block:: sh

    #!/bin/bash
     
    dpkg -s $1 &> /dev/null

    if [ $? -eq 0 ]; then
        echo "Package  is installed!"
    else
        echo "Package  is NOT installed!"
    fi

    # OR
    dpkg -l | grep -qw package || apt-get install package


.. code-block:: sh

    if ! rpm -qa | grep -qw vim; then
        yum install vim
    fi

    # or 
    rpm -qa | grep -qw glibc-static || yum install vim


sftp文件批量上传与下载
------------------------

* https://stackoverflow.com/questions/41378953/unknown-command-lftp
* `用Python实现无交互sftp上传 下载 <http://blog.csdn.net/u010950854/article/details/62233538?utm_source=itdadao&utm_medium=referral>`_

.. code-block:: sh

    #!/bin/bash
    # apt-get install lftp
    
    # 上传文件

    #SFTP配置信息

    USER=jxm  #用户名
    PASSWORD=123456  #密码

    SRCDIR=/home/jxm/Documents  #待上传文件根目录
    DESDIR=/tmp                 #FTP目录

    IP=127.0.0.1
    PORT=22

    # 修改 IFS
    OIFS=$IFS
    IFS=$(echo -en "\n\b")

    #获取文件
    cd ${SRCDIR}
    #FILES=`ls`  #目录下的所有文件
    #FILES=`find ${SRCDIR} -mmin -50 -name '*.mp4'` #修改时间在执行时间五分钟之前的文件
    FILES=`find ${SRCDIR} -name '*.pdf'`

    for FILE in ${FILES}
    do
        echo ${FILE}
    #发送文件 (关键部分）
    lftp -u ${USER},${PASSWORD} sftp://${IP}:${PORT} <<EOF
    set sftp:auto-confirm yes
    cd ${DESDIR}/
    lcd ${SRCDIR}
    put '${FILE}'
    by
    EOF
    done
    IFS=$OIFS    # 恢复IFS

.. code-block:: sh

    #!/bin/bash

    # 下载文件

    USER=root
    PASSWORD=5EYS40T04BMF  # 密码

    SRCDIR=/u02/dab        # 下载文件目录
    DESDIR=/u01/sftpFiles  # FTP目录(待下载文件目录)
    
    IP=192.168.1.10
    PORT=22

    lftp -u ${USER},${PASSWORD} sftp://${IP}:${PORT}<<EOF
    cd ${DESDIR}
    lcd ${SRCDIR}
    get text.xml  #需要下载的文件为text.xml
    by
    EOF

Shell 统计代码行数
-------------------------


.. code-block:: sh

    # 文件名 空格问题 ？？？
    find . -type f  -name "*.c*" -or -name "*.h**"  -or -name "*.msg"   | xargs cat | wc -l | sort -k2

.. code-block:: sh

    total=0
    find . -type f  -name "*.c*" -or -name "*.h**"  -or -name "*.msg" | while read FILE; do
         #you see use grep instead wc ! for properly counting
         count=$(grep -c ^ < "$FILE")
         let total=total+count #in bash, you can convert this for another shell
         #echo "$FILE has $count lines ===>  $total"
         echo "TOTAL LINES COUNTED ...  :  $total"
    done
    echo "TOTAL LINES COUNTED:  $total" #打印为 0 ?????


Shell 获取文件名和后缀名
--------------------------

.. code-block:: sh

    $ file="thisfile.txt"
    $ echo "filename: ${file%.*}"
    filename: thisfile
    $ echo "extension: ${file##*.}"
    extension: txt
    $ basename '/a/b/c/name.txt'    #用于去掉路径信息，返回纯粹的文件名
    name.txt

    dirname  #获取文件路径


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


shell 文件所在路径
----------------------------

.. code-block:: sh

    #!/usr/bin/env bash
    #coding=utf-8

    #VERSION="123" # 版本号   
    #DATETIME=`date -d today +"%Y%m%d%H%M"`               # 时间

    SELF_RELATIVE_DIR=`dirname $0`                       # 获取 脚本文件所在的相对路径
    #SELF_ABSOLUTE_DIR=$(readlink -f "$SELF_RELATIVE_DIR")
    SELF_ABSOLUTE_DIR=`readlink -f "$SELF_RELATIVE_DIR"` # 当前 脚本文件，所在的绝对路径

    export PYTHONPATH=$PYTHONPATH:$SELF_ABSOLUTE_DIR


    #python $1
    ipython 


* apt


.. code-block:: sh

    apt install --only-upgrade <packagename>

    # 用apt升级单个软件包

    apt-get upgrade [-u]

    # 升级所以已经安装的包裹为最新可用版本.
    # 不会安装新的或移除老的包裹.
    # 如果一个包改变了倚赖关系而需要安装一个新的包裹,那么它将不会被升级,而是标志为 hold .
    # apt-get update 不会升级被标志为 hold 的包裹 (这个也就是 hold 的意思).请看下文如何手动设置包裹为 hold .
    # 我建议同时使用 ‘-u’ 选项,因为这样你就能看到哪些包裹将会被升级.


apt-get install时如何指定安装版本
-----------------------------------

.. code-block:: sh

    $ sudo apt-get install package=version

拷贝文件并且示进度
---------------------

.. code-block:: sh

    $ rrsync  -a -P  path1   path2
    $ sync


只拷贝软连接
-----------------

.. code-block:: sh

    $ sudo cp -d $HOME/bin/FoxitReader /usr/local/bin/ 


Sed 命令
----------

.. code-block:: sh

    sed -i '3s/^/your_test\n/' test.txt      # 在第3行前，插入一行
    sed -i "3s/$/\nyour_test/" test.txt      # 在第3行后，插入一行


    sed -i '3s/your_test/my_test/' test.txt  # 修改第三行


查找当前目录，及其子目录，” .c “ 文件脚本
------------------------------------------

.. code-block:: sh

    #!/usr/bin/env bash

    for file in `find ./ -type f -name "*.c"`;
    do
	echo $file
	# do something
    done

    # delete pyc
    find . -name '*.pyc' -delete

    # File's data was last modified n*24 hours ago
    find  -type f  -mtime +10  -name "mcstudent_offline*"

    find ./  -type f -perm -111 #查看具有可执行权限的文件


.. code-block:: sh

    find -type  f  -name  '*.cpp'  |   xargs  grep  '关键字'    # 查找含有某字符串的所有文件
    chmod a+x `find ./ -type f -name '*.c'`  			# 修改当前目录及其子目录，文件属性
    service --status-all                                        # 查看进程服务



判断文件中包含字段
--------------------

.. code-block:: sh

    File=/etc/yum.conf
    #WORD='proxy'
    WORD='^proxy=.*$'
    if  ! grep $WORD "$File"  ; then
      echo  "$WORD not fond in $File"
    else
      echo  "${WORD} in $File"
    fi

判断文件是否存在
-----------------

实现代码一
~~~~~~~~~~

.. code-block:: sh

        #!/bin/sh
         
        myPath="/var/log/httpd/"
        myFile="/var /log/httpd/access.log"
        fsda1="/dev/sda1"
         
        # 这里的-x 参数判断$myPath是否存在并且是否具有可执行权限
        if [ ! -x "$myPath"]; then
         mkdir "$myPath"
        fi

        # 这里的-d 参数判断$myPath是否存在
        if [ ! -d "$myPath"]; then
         mkdir "$myPath"
        fi

        # 这里的-b 参数判磁盘块设备是否存在
        if [ -b "$fsda1" ]; then
                echo  "Fond $fsda1"
        else
                echo  "Not fond $fsda1"
        fi
         
        # 这里的-f参数判断$myFile是否存在
        if [ ! -f "$myFile" ]; then
         touch "$myFile"
        fi

        # 其他参数还有-n,-n是判断一个变量是否是否有值
        if [ ! -n "$myVar" ]; then
         echo "$myVar is empty"
         exit 0
        fi
         
        # 两个变量判断是否相等
        if [ "$var1" = "$var2" ]; then
         echo '$var1 eq $var2'
        else
         echo '$var1 not eq $var2'
        fi


实现代码二
~~~~~~~~~~

.. code-block:: sh

         
        #如果文件夹不存在，创建文件夹
        if [ ! -d "/myfolder" ]; then
         mkdir /myfolder
        fi
         
        #shell判断文件,目录是否存在或者具有权限
         
        folder="/var/www/"
        file="/var/www/log"
         
        # -x 参数判断 $folder 是否存在并且是否具有可执行权限
        if [ ! -x "$folder"]; then
         mkdir "$folder"
        fi
         
        # -d 参数判断 $folder 是否存在
        if [ ! -d "$folder"]; then
         mkdir "$folder"
        fi
         
        # -f 参数判断 $file 是否存在
        if [ ! -f "$file" ]; then
         touch "$file"
        fi
         
        # -n 判断一个变量是否有值
        if [ ! -n "$var" ]; then
         echo "$var is empty"
         exit 0
        fi
         
        # 判断两个变量是否相等
        if [ "$var1" = "$var2" ]; then
         echo '$var1 eq $var2'
        else
         echo '$var1 not eq $var2'
        fi

* -f 和-e的区别  Conditional Logic on Files
* -a file exists.
* -b file exists and is a block special file.
* -c file exists and is a character special file.
* -d file exists and is a directory.
* -e file exists (just the same as -a).
* -f file exists and is a regular file.
* -g file exists and has its setgid(2) bit set.
* -G file exists and has the same group ID as this process.
* -k file exists and has its sticky bit set.
* -L file exists and is a symbolic link.
* -n string length is not zero.
* -o Named option is set on.
* -O file exists and is owned by the user ID of this process.
* -p file exists and is a first in, first out (FIFO) special file or named pipe.
* -r file exists and is readable by the current process.
* -s file exists and has a size greater than zero.
* -S file exists and is a socket.
* -t file descriptor number fildes is open and associated with a  terminal device.
* -u file exists and has its setuid(2) bit set.
* -w file exists and is writable by the current process.
* -x file exists and is executable by the current process.
* -z string length is zero.

是用 -s 还是用 -f 这个区别是很大的！


gdialog
~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

C
    http://blog.csdn.net/gobitan/article/details/5903342
python
    http://blog.csdn.net/philip502/article/details/13511625
    https://stackoverflow.com/questions/4705564/python-script-as-linux-service-daemon


磁盘IO 查看
~~~~~~~~~~~~~~~

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

**************************
Ubuntu 修改 启动时间等待  
**************************

.. code-block:: sh

    # Ubuntu14.04 , Ubuntu18.04
    
    sed -i 's/^.*GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=0/' /etc/default/grub
    sed -i 's/timeout=10/timeout=0/' /etc/grub.d/30_os-prober
    update-grub

**********************************
禁止ubuntu 18.04更新内核 (待验证)  
**********************************

* https://blog.csdn.net/weixin_40522162/article/details/80302735



*********
Systemd  
*********

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


********
Service 
********

* `Ubuntu Service说明与使用方法 <http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html>`_


********
乱码 
********
.. code-block:: sh

    # 解决解压Windos 压缩包文件名，乱码
    unzip -O cp936 a.zip
    
    # convmv 待验证
    sudo apt-get install convmv





