###################
X11 and openbox    
###################

**************************************
Install and Start  
**************************************

.. code-block:: bash

    sudo apt-get install -y xorg openbox
    export DISPLAY=:0.0
    sudo xhost +local:root
    sudo sartx /usr/bin/openbox

* `使用SSH的X11特性远程运行X界面程序 <https://blog.csdn.net/gothicane/article/details/1669978>`_

* `窗口管理器 Openbox 入门指南 <https://linuxtoy.org/archives/openbox-getting-started-guide.html#reasons>`_


**********************
安装资源监视器
**********************

.. code-block:: bash

    $ apt-get install xfce4-taskmanager
    $ apt-get install gnome-system-monitor


********************************************
安装chrominum-browser和googlepinyin
********************************************

1. Install
============

主要安装如下几个包，以及其所依赖的包。

* adobe-flashplugin
* chromium-browser 
* ibus
* ibus-gtk
* ibus-gtk3
* ibus-pinyin
* ibus-googlepinyin
* ibus-clutter
* im-config
* dbus-x11

.. code:: sh

   $ sudo tar xzvf  chrome_and_pinyin.tgz 
   $ sudo cd  pack
   $ sudo dpkg -i *.deb
    

.. image:: ./images/install_deb.gif
       :scale: 100%
       :alt: alternate text
       :align: center

2. Config
============

.. code:: sh

   $ ibus  engine  googlepinyin 

.. image:: ./images/ibus_config.gif
       :scale: 100%
       :alt: alternate text
       :align: center


3. How to use
================

.. code:: sh

    $ chromium-browser --user-data-dir=/tmp www.baidu.com

.. image:: ./images/chrome_and_ping.gif
       :scale: 100%
       :alt: alternate text
       :align: center

.. seealso::

    `Centos7 安装lightdm openbox tint2配置最简单桌面 <http://blog.csdn.net/shile/article/details/53809365>`_

