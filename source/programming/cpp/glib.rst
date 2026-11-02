############
Glib/GTK  
############

* `GIO Reference Manual <https://developer.gnome.org/gio/stable/>`_

* `浅析GLib <https://www.ibm.com/developerworks/cn/linux/l-glib/>`_
* `GTK+编程入门(1)—简介与glib库 <https://blog.csdn.net/lazybone1994/article/details/47206345>`_
* `GTK+编程入门(2)—GTK+程序结构 <https://blog.csdn.net/lazybone1994/article/details/47206353>`_
* `GTK+编程入门(3)—响应GKT+的信号  <https://blog.csdn.net/lazybone1994/article/details/47209807>`_
* `g_main_loop_new (NULL, FALSE) 原理分析 <https://blog.csdn.net/arag2009/article/details/17095361>`_
* `GTK+浅谈之总结 <https://blog.csdn.net/taiyang1987912/article/details/48174563>`_

------

* `C语言也能做界面：踏上GTK+学习之旅 <https://blog.csdn.net/tennysonsky/article/details/42740865>`_

Book   
=======

    链接: https://pan.baidu.com/s/1B6xkYFYPWEJy2EccRaFkYQ 密码: m3q6



.. code-block:: sh

        # 1、安装gcc/g++/gdb/make 等基本编程工具
        sudo apt-get install build-essential

        # 2、安装 libgtk2.0-dev libglib2.0-dev 等开发相关的库文件
        sudo apt-get install gnome-core-devel

        # 3、用于在编译GTK程序时自动找出头文件及库文件位置
        sudo apt-get install pkg-config

        # 4、安装 devhelp GTK文档查看程序
        sudo apt-get install devhelp

        # 5、安装 gtk/glib 的API参考手册及其它帮助文档
        sudo apt-get install libglib2.0-doc libgtk2.0-doc

        # 6、安装基于GTK的界面GTK是开发Gnome窗口的c/c++语言图形库
        sudo apt-get install glade libglade2-dev

        # 7、安装gtk2.0 或者 将gtk+2.0所需的所有文件统通下载安装完毕
        sudo apt-get install libgtk2.0-dev

        # 查看GTK库版本

        # 1.查看 2.x 版本
        pkg-config --modversion gtk+-2.0

        # 2.查看pkg-config的版本
        pkg-config --version

        # 3.查看是否安装了gtk
        pkg-config --list-all grep gtk

