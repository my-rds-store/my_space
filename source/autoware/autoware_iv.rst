Autoware
============


`autoware <https://www.autoware.org/autoware>`_
-----------------------------------------------------

------------

* Documentation
    * `Github Page <https://autowarefoundation.github.io/autoware-documentation/main/>`_
    * `Doc Source <https://github.com/autowarefoundation/autoware-documentation>`_

* Autoware Universe
    * `Autoware Universe Documentation <https://autowarefoundation.github.io/autoware.universe/main/>`_
    * `Autoware Universe  <https://github.com/autowarefoundation/autoware.universe>`_


* IDL
    *  http://design.ros2.org/articles/idl_interface_definition.html


安装
----------------

.. code:: bash

    # # 更换阿里源, 网速快; 缺点, 当碰巧,阿里源正在和官方源同步的时段，会无法安装
    # sed -i 's/cn.archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list # X86 中文
    # sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list    # X86 英文
    # sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list      # arm

    sudo apt-get -y update
    sudo apt-get -y install git

    ######################################################
    ### geographiclib-tools
    ######################################################
    sudo apt install geographiclib-tools
    ## sudo geographiclib-get-geoids egm2008-1

    ## http://192.168.2.100:8089/s/kQN2Gme9b5gkeSk?path=%2Fgeographiclib
    tar xofjC egm2008-1.tar.bz2 /usr/share/GeographicLib
    ## tar xofjC egm2008-2_5.tar.bz2 /usr/local/share/GeographicLib

    ######################################################
    ### libtorch  ???/
    ######################################################
    # Download http://192.168.2.100:8089/s/kQN2Gme9b5gkeSk?path=%2F
    sudo unzip libtorch-1.6.0+cu11.1.zip -d /usr/local/

    #
    git clone https://github.com/autowarefoundation/autoware.git
    cd autoware

    ./setup-dev-env.sh


    cd autoware
    mkdir src
    vcs import src < autoware.repos

    sudo apt-get install ros-galactic-pacmod3-msgs

    source /opt/ros/galactic/setup.bash
    rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

----------------

* 链接地址
    https://github.com/tier4/AutowareArchitectureProposal.proj
    https://hub.fastgit.org/tier4/AutowareArchitectureProposal.proj
    https://github.com.cnpmjs.org/tier4/AutowareArchitectureProposal.proj

* 参考
    * `AutowareArchitectureProposal设计和代码结构梳理 <https://blog.csdn.net/moyu123456789/article/details/108584169>`_
    * `tier4 技术博客 <https://tech.tier4.jp/>`_

地图
------------

* `MGRS MAPPER <https://mgrs-mapper.com/app>`_
* `Autoware Toos <https://tools.tier4.jp/>`_



定位
------------


编译
------------


.. code-block:: sh

        ###################################
        # Autoware (install egm2008-1)
        ###################################

        # file: egm2008-1.tar.bz 
        # size: 155M
        # link: https://nchc.dl.sourceforge.net/project/geographiclib/geoids-distrib/egm2008-1.tar.bz
        # 迅雷下载
        sudo tar xofjC  egm2008-1.tar.bz2 /usr/share/GeographicLib

        # https://geographiclib.sourceforge.io/html/geoid.html


        ###################################
        # LibTorch (download)
        ###################################

        # gdown https://drive.google.com/u/0/uc?id=1eNh3F3xCQ4AMJEHtwb1dhshSyzWMjoc8 -O /tmp/libtorch.zip
        # Lantern 下载



.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="http://music.163.com/outchain/player?type=2&id=31445554&auto=1&height=66">
    </iframe>
