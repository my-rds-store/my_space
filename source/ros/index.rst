#############
ROS
#############


***********
环境搭建
***********

.. code-block:: sh

        # 更换阿里源
        sed -i 's/cn.archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
        sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

        #  添加 ROS源
        sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

        #apt-cache search ros-kinetic
        sudo apt-get install ros-kinetic-desktop-full --yes --allow-unauthenticated

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
        apt-cache search ros-melodic

.. code-block:: sh

        # 小乌龟
        source /opt/ros/melodic/setup.sh
        rosrun turtlesim turtlesim_node
        rosrun turtlesim turtle_teleop_key

* `《ROS机器人开发实践》源码 <https://github.com/huchunxu/ros_exploring>`_

***********
常用命令
***********

.. code-block:: sh
        
        roscore
        rqt_graph   #  查看节点关系

        echo $ROS_PACKAGE_PATH

        catkin_init_workspace

        catkin_create_pkg <package_name> [depend1] [depend2] ... [dependn]
        #catkin_create_pkg learning_communication std_msgs rospy roscpp
        catkin_make

        rosrun [package_name] [node_name]
        
        ###########
        # rosnode
        ###########
        rosnode list                  获得运行节点列表
        rosnode info node-name        获得特定节点的信息
        rosnode ping  node-name       测试节点是否连通
        rosnode kill node-name        终止节点

        ###########
        # rospack
        ###########

        rospack -h

        ###########
        # rostopic
        ###########

        rostopic -h

        ############
        # rosbag
        ############

        rosbag -h

        rosdep install AMAZING_PACKAGE
        rosdep install --from-paths src --ignore-src -r -y # 用于安装工作空间中所有包的依赖项


* 安装peak can

.. code-block:: sh

       $ tar –xzf peak-linux-driver-X.Y.Z.tar.gz
       $ cd peak-linux-driver-X.Y.Z 
       $ make -C driver NET=NETDEV_SUPPORT
       $ sudo make install
       $ sudo modprobe peak_usb # 卸载 sudo modprobe -r peak_usb
       $ ip l | grpe can

       $ sudo apt-get install ros-kinetic-socketcan-interface \
                               ros-melodic-ros-canopen

       $ sudo apt-get install can-utils
       $ sudo ifconfig can0

       $ sudo ip link set can0 up type can bitrate 500000
       $ ip -details -statistics link show can0

       $ rosrun socketcan_interface socketcan_dump can0 # dump
       $ rosrun socketcan_interface socketcan_bcm can0 0.5 12#12345678 # id=12 周期0.5s

       $ cansend can0 123#0102030405060708
        
       #######################
       ## create vcan
       #######################
       sudo modprobe vcan
       sudo ip link add dev vcan0 type vcan
       sudo ip link set vcan0 up
       sudo ip link add dev vcan1 type vcan
       sudo ip link set vcan1 up
       ip l
        
       ## connect  vcan0 vcan1
       sudo modprobe can-gw
       sudo cangw -A -s vcan0 -d vcan1 -e 
       sudo cangw -A -s vcan1 -d vcan0 -e

* `socketcan_interface <http://wiki.ros.org/socketcan_interface?distro=melodic>`_
* `CAN BUS tools <https://cantools.readthedocs.io/en/latest/#>`_
        
------

* `研华can卡驱动 下载地址  <https://support.advantech.com/support/DownloadSRDetail_New.aspx?SR_ID=GF-GRSC&Doc_Source=Download>`_

