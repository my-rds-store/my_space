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

