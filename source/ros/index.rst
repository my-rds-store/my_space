#############
ROS
#############

.. code-block:: sh

        # 更换阿里源
        sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
        sed -i 's/cn.archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

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

