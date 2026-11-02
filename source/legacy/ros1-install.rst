ROS 1 Melodic 安装（归档）
==========================

.. warning::

   ROS 1 已于 2025 年停止维护；以下步骤仅作历史记录。

***********
环境搭建
***********

.. code-block:: sh

        # 更换阿里源
        sed -i 's/cn.archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
        sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
        sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list # arm

        #  添加 ROS源
        sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654
        sudo apt-get update

        #apt-cache search ros-kinetic
        sudo apt-get install ros-melodic-desktop-full --yes --allow-unauthenticated

        # sudo apt-get install ros-kinetic-slam-gmapping -y # 地图建模

        sudo rosdep init
        rosdep update
        sudo apt-get install python-rosinstall \
                             python-rosinstall-generator \
                             python-wstool \
                             build-essential --yes --allow-unauthenticated
        source /opt/ros/kinetic/setup.sh

        ########################################
        # install  ros melodic  on ubuntu 18.04  
        ########################################
        sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
        rosdep update

        sudo apt install ros-melodic-desktop-full
        # sudo apt-get install rosbash 
        # sudo apt-get install ros-melodic-rosbash ros-melodic-rosbash-params # install and reboot , roscd 
        sudo apt-get install ros-${ROS_DISTRO}-rosbash ros-${ROS_DISTRO}-rosbash-params

        apt-cache search ros-melodic

.. code-block:: sh

        # 小乌龟
        source /opt/ros/melodic/setup.sh
        rosrun turtlesim turtlesim_node
        rosrun turtlesim turtle_teleop_key

* `《ROS机器人开发实践》源码 <https://github.com/huchunxu/ros_exploring>`_

* `LIO-SAM <https://github.com/TixiaoShan/LIO-SAM>`_
    * `LIO-SAM运行自己数据包遇到的问题解决--SLAM不学无数术小问题 <https://blog.csdn.net/weixin_42141088/article/details/118000544>`_
    * `LIO-SAM源码阅读分析（1）--配置文件Tips <https://zhuanlan.zhihu.com/p/171589473>`_
    * https://zhuanlan.zhihu.com/p/352039509
    * https://blog.csdn.net/heirenlop/article/details/115216476
* `imu ch110 <https://github.com/hipnuc/products>`_

