Autoware
===========

* MIC-7700
    * ubuntu18.04 LTS
    * 32G RAM
    * GPU 1050Ti

一 环境搭建
------------

* `Wiki <https://gitlab.com/autowarefoundation/autoware.ai/autoware/-/wikis/home>`_


1 安装 ROS melodic
````````````````````

1.1 更新 ROS源地址
:::::::::::::::::::

.. code-block:: sh

        # # 更换阿里源, 网速快; 缺点, 当碰巧,阿里源正在和官方源同步的时段，会无法安装
        # sed -i 's/cn.archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list # X86 中文
        # sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list    # X86 英文
        # sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list      # arm 

        #  添加 科大ROS源
        sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654
        sudo apt-get update

1.2 安装 ROS
:::::::::::::::::::

* 执行安装脚本

.. code-block:: sh
    
    sudo apt-get install curl --yes --allow-unauthenticated
    
    # 按照提示输入,当前用户密码
    curl -sSL https://raw.githubusercontent.com/my-rds-store/my_space/master/source/autoware/src/ros_instal.sh | bash


* 安装脚本的源码如下:

  .. literalinclude:: ./src/ros_instal.sh
     :language: bash



2 安装 CUDA 10.0
```````````````````

* Step 1 : revmoe nvidia

    .. code-block:: sh

        sudo apt-get remove --purge nvidia*

* Step 2 : Install cuda 10.0

    `下载链接: cuda-repo-ubuntu1804_10.0.130-1_amd64.deb <https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.105-1_amd64.deb>`_

    .. code-block:: sh

        ## Install cuda
        ## https://developer.nvidia.com/cuda-toolkit-archive
        sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
        sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
        sudo apt-get update
        sudo apt-get install cuda-10-0

* Step 3 :  Install cuDNN 


    `先下载 cuDNN v7.5.0 (Feb 21, 2019), for CUDA 10.0 <https://developer.nvidia.com/rdp/cudnn-archive>`_ ;
    需要注册账号登录才能下载.

    .. code-block:: sh

        ## https://developer.nvidia.com/rdp/cudnn-archive
        ## cuDNN v7.5.0 (Feb 21, 2019), for CUDA 10.0

        sudo dpkg -i libcudnn7_7.5.0.56-1+cuda10.0_amd64.deb


* Step 4 :  添加环境变量 

    在 ${HOME}/.bash_aliases 添加

    .. code:: 

        ##################################
        #  CUDA
        ##################################
        export CUDA_HOME=/usr/local/cuda-10.0
        export PATH=$PATH:$CUDA_HOME/bin
        export LD_LIBRARY_PATH=${CUDA_HOME}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


    .. code-block:: sh

        source ${HOME}/.bash_aliases
        # 查看 CUDA 版本
        nvcc -V


* Step 5 : 重启系统 

    .. code-block:: sh

        sudo shutdown -r now



3 源码编译 Autoware
````````````````````````````````

* step 1 : Install Eigen

.. code-block:: sh

    wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz #Download Eigen

    mkdir eigen && tar --strip-components=1 -xzvf 3.3.7.tar.gz -C eigen #Decompress

    cd eigen && mkdir build && cd build && cmake .. && make && make install #Build and install

    cd && rm -rf 3.3.7.tar.gz && rm -rf eigen #Remove downloaded and temporary files

* step 2 : Build Autoware

.. code-block:: sh

    mkdir -p autoware.ai/src
    cd autoware.ai

    # Download
    wget -O autoware.ai.repos "https://gitlab.com/autowarefoundation/autoware.ai/autoware/raw/master/autoware.ai.repos?inline=false"

    vcs import src < autoware.ai.repos

    ## Install dependencies using rosdep.
    rosdep update
    rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

    # With CUDA support
    AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

    # Without CUDA Support
    # colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

* step 2 : Run Autoware

.. code-block:: sh

    cd autoware.ai
    source install/setup.bash
    roslaunch runtime_manager runtime_manager.launch


4. Docker 安装Autoware(整理中....)
`````````````````````````````````````

* 需要 在 autoware 用户下操作. 新建 autoware 用户

.. code::

    #/etc/sudoers 添加
    autoware      ALL=NOPASSWD:ALL
 

.. code-block:: sh

     git clone https://gitlab.com/autowarefoundation/autoware.ai/docker.git

     cd docker/generic

     mkdir ~/Autoware
    ./run.sh --ros-distro melodic 
    ./run.sh --ros-distro melodic --cuda off # 无cuda


   
* `问题: No protocol specified  <https://blog.csdn.net/Niction69/article/details/78480675>`_

.. code-block:: sh
    
    #　root 用户下
    xhost +


5. 学习资料
`````````````

* `autoware入门教程 <https://www.ncnynl.com/archives/201910/3402.html>`_

二 LGSVL
------------

* `lgsvl documentation <https://www.lgsvlsimulator.com/docs/>`_

.. code-block:: sh

    cp -rvf  ./src/autoware/simulation/lgsvl_simulator_bridge/*  \
             ./install/lgsvl_simulator_bridge/share/lgsvl_simulator_bridge/
    source install/setup.bash
    roslaunch runtime_manager runtime_manager.launch
   
三 问题整理
------------

（ 空 )

三 学习笔记
------------

使用YOLOv3进行检测
``````````````````

* `Running yolov3 detection in autoware <https://youtu.be/M5K2xc6ndtA>`_

.. raw:: html

    <iframe width="560" height="315" src="https://www.youtube.com/embed/M5K2xc6ndtA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Step 1: 安装Yolo3
::::::::::::::::::

* `安装Yolo  <https://www.ncnynl.com/archives/201911/3439.html>`_

Step 2: usb_cam
::::::::::::::::

.. code-block:: bash

    mkdir -p usb_cam 
    cd myros 

    #git clone https://github.com/bosch-ros-pkg/usb_cam src
    git clone https://github.com/ros-drivers/usb_cam.git src

    catkin_make 
    source devel/setup.bash 

    roscore  &
    source devel/setup.bash 
    roslaunch usb_cam usb_cam-test.launch

Step 3
::::::::::::::::



* Computing->Detection->vision_detector->vision_darknet_yolo3/[app]

.. image:: ./img/vision_darknet_yolo3/01.png
        :scale: 80%

.. image:: ./img/vision_darknet_yolo3/02.png
        :scale: 80%

* 打卡 Rviz

.. image:: ./img/vision_darknet_yolo3/03.png
        :scale: 80%

.. image:: ./img/vision_darknet_yolo3/04.png
        :scale: 100%

.. image:: ./img/vision_darknet_yolo3/6.png
        :scale: 60%


