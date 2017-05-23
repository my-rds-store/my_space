Shell 实用技巧
===================

apt-get install时如何指定安装版本
-----------------------------------

.. code-block:: sh

    $ sudo apt-get install package=version

拷贝文件并且示进度
---------------------

.. code-block:: sh

    $ rrsync  -a -P  path1   path2
    $ sync


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

