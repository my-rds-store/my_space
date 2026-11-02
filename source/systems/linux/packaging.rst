Ubuntu 编译源码包
=================

.. warning::

   以下示例基于 Ubuntu 14.04，现代系统请勿直接替换 sources.list；
   应使用当前发行版的软件源，并参考 Debian 维护者手册。

http://blog.sina.com.cn/s/blog_476d8cf30100lnd4.html

* `Debian 维护者指导 <https://www.debian.org/doc/manuals/debmake-doc/>`_
* `Debian 管理员手册 <https://www.debian.org/doc/manuals/debian-handbook/index.zh-cn.html>`_

.. code-block:: bash

    $ sudo apt-get source tree

    $ sudo apt-get build-dep tree

    $ cd tree-1.5.1.2
    $ sudo dpkg-buildpackage

    # 构建 vlc 打包环境
    apt-get update
    apt-get install curl -y
    curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty
    apt-get update
    sudo apt-get build-dep vlc -y
    #sudo apt-get source vlc
