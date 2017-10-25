##############
Shell 实用技巧
##############

ssh 无密码登录
--------------------

http://blog.csdn.net/zhaihaifei/article/details/50523576


常用命令
--------

    http://blog.csdn.net/jxm_csdn/article/details/52234267

    `我使用过的Linux命令之trap - 在脚本中处理信号 <http://blog.csdn.net/world_hello_100/article/details/18049599>`_


修改文件名 rename
-----------------

http://man.linuxde.net/rename


split分割文件
-------------

http://blog.csdn.net/whu_zhangmin/article/details/45870077

.. code-block:: bash

    $ split -b 4000M -d -a 1 cm-11.tar.gz cm-11.tar.gz.

    # 使用split命令，-b 4000M 表示设置每个分割包的大小，单位还是可以k
    #  -d "参数指定生成的分割包后缀为数字的形式
    # -a x来设定序列的长度(默认值是2)，这里设定序列的长度为1



执行命令后，生成压缩包如下：

.. code:: 

    -rw-r--r--  1 root     root      4194304000 May 20 14:00 cm-11.tar.gz.0
    -rw-r--r--  1 root     root      4194304000 May 20 14:02 cm-11.tar.gz.1
    -rw-r--r--  1 root     root      4194304000 May 20 14:03 cm-11.tar.gz.2
    -rw-r--r--  1 root     root      4194304000 May 20 14:05 cm-11.tar.gz.3
    -rw-r--r--  1 root     root      4194304000 May 20 14:06 cm-11.tar.gz.4
    -rw-r--r--  1 root     root      4194304000 May 20 14:08 cm-11.tar.gz.5
    -rw-r--r--  1 root     root      4194304000 May 20 14:09 cm-11.tar.gz.6
    -rw-r--r--  1 root     root      2256379886 May 20 14:10 cm-11.tar.gz.7


合并文件
--------


.. code-block:: bash




tar 打包
---------------

.. code-block:: bash

    $ tar czvf test.tar.gz *         # 压缩当前文件夹下非隐藏文件的文件
    $ tar czvf ../abc.tgz  .[!.]* *  # 压缩当前文件夹下所有文件,排除两个隐藏文件夹"."和“..”

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

.. code-block:: bash
    
     $ iostat -d -x -k 1   


