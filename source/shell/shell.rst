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



********
乱码 
********
.. code-block:: sh

    # 解决解压Windos 压缩包文件名，乱码
    unzip -O cp936 a.zip
    
    # convmv 待验证
    sudo apt-get install convmv





