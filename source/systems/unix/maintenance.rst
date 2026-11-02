系统维护与杂项
========================================

常见问题
--------------------

.. code-block:: sh

    # 1. umount.nfs: /mnt: device is busy
    $ fuser -vm /mnt  #  查看挂载点，被那些进程占用



* Linux log日志占用
    * `Linux /var/log/日志文件太大, 清理journal就行 <https://www.uedbox.com/post/58901/>`_



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


Ubuntu 修改 启动时间等待  
-------------------------------

.. code-block:: sh

    # Ubuntu14.04 , Ubuntu18.04
    
    sed -i 's/^.*GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=0/' /etc/default/grub
    sed -i 's/timeout=10/timeout=0/' /etc/grub.d/30_os-prober
    update-grub


禁止ubuntu 更新内核   
--------------------------------------


