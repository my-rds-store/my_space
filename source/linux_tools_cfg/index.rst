常用工具安装极其配置
=========================


网络文件系统
-------------------------

NFS (for ubuntu14.04)
``````````````````````` 

1).  NFS Server 
:::::::::::::::::::::::::::::::::

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
:::::::::::::::::::::::::::::

.. code-block:: sh
    
    # 安装NFS Client
    $ sudo apt-get install  nfs-common
    
    # 查看服务器共享文件
    $ showmount -e 192.168.1.122

    # 挂载
    $ sudo mount -t nfs 192.168.1.122:/home/jxm/workspace /mnt
    $ sudo mount.nfs  192.168.1.122:/home/jxm/workspace /mnt



CIFS (Ubuntu 14.04)
```````````````````````````

1). 设置共享
::::::::::::::::::::::::::

在要挂载的windows系统中找到需要挂载的硬盘或者文件夹，把它设置为共享，　如：在D盘下建立文件夹**cifs_shared**, 设为共享．

2). 安装与配置
:::::::::::::::::::::::::::::

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


FTP服务 (Centos 7)
```````````````````````````````

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
::::::::::::::::::::::::::::;

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


挂载Ftp目录(Ubuntu 14.04)
::::::::::::::::::::::::::::::::::::::


.. code-block:: sh

    # 1). 安装curlftpfs
    $ sudo apt-get install  curlftpfs  

    # 2). 挂载
    $ sudo curlftpfs -o codepage=gbk  ftp://username:password@192.168.8.25   /mnt  
    $ sudo curlftpfs -o codepage=utf-8 ftp://username:password@192.168.8.25/public /mnt


x11vnc
---------------------------

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



安装WPS for Linux 
---------------------------

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

  

Barrier 一套键鼠同时控制多台电脑
---------------------------------------------

* `[ 下载地址 ] <https://github.com/debauchee/barrier/releases>`_
* `[ 下载地址2 ] <https://sourceforge.net/projects/barrier.mirror/files/>`_

.. code-block:: sh 

        sudo apt-get install barrier

        sudo snap install barrier

-----

FSearch : Linux 版本的 Everything
--------------------------------------


* `FSearch  <https://launchpad.net/~christian-boxdoerfer/+archive/ubuntu/fsearch-daily?field.series_filter>`_

.. code-block:: bash

    sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
    sudo apt-get update
    sudo apt install fsearch-trunk

--------



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


.. raw:: html

	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="https://music.163.com/outchain/player?type=2&id=413961293&auto=1&height=66"></iframe>


