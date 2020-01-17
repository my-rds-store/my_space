Autoware
===========

* ubuntu18.04 LTS
* 32G RAM
* GPU 1050Ti

环境搭建
------------

安装 ROS melodic
```````````````````

ROS源地址
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

安装ROS
:::::::::::::::::::

.. code-block:: sh
    
    sudo apt-get install curl --yes --allow-unauthenticated


.. literalinclude:: ./src/ros_instal.sh
   :language: bash




安装ROS CUDA 10.0
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


    `先下载,cuDNN v7.5.0 (Feb 21, 2019), for CUDA 10.0 <https://developer.nvidia.com/rdp/cudnn-archive>`_ ;
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



源码编译Autoware
```````````````````

Docker 安装Autoware
```````````````````




--------------

*  `How to configure and use CAN bus <https://developer.ridgerun.com/wiki/index.php/How_to_configure_and_use_CAN_bus>`_

.. code::

    auto can0
    iface can0 inet manual
            #pre-up ip link set $IFACE type can bitrate 125000 listen-only off
            pre-up /sbin/ip link set $IFACE type can bitrate 125000 triple-sampling on
            up /sbin/ifconfig $IFACE up
            down /sbin/ifconfig $IFACE down


    auto vcan0
    iface vcan0 can static
        bitrate 0  # NEEDED but not supported
        pre-up /sbin/ip link add dev $IFACE type vcan
        up /sbin/ip link set $IFACE up
        down /sbin/ip link set $IFACE down


* `vcan <https://python-can.readthedocs.io/en/master/interfaces/socketcan.html#the-virtual-can-driver-vcan>`_

.. code-block:: sh 

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


       rosrun socketcan_bridge socketcan_bridge_node _can_device:=vcan0
       rostopic pub  /sent_messages can_msgs/Frame  -r 1 --  \
       '{header: auto,id: 15, is_rtr: 0,is_extended: 0,is_error: 0,dlc: 8,data: [1,2,3,4,5,6,7,9]}'

       rosrun socketcan_bridge socketcan_to_topic_node _can_device:=vcan0
       rosrun socketcan_bridge topic_to_socketcan_node _can_device:=vcan0


* `socketcan_interface <http://wiki.ros.org/socketcan_interface?distro=melodic>`_

* `CAN BUS tools <https://cantools.readthedocs.io/en/latest/#>`_
* `Can Dbc Editor : SavvyCAN <https://github.com/collin80/SavvyCAN/releases>`_
        
* `PID <http://wiki.ros.org/pid>`_

------

* `研华can卡驱动 下载地址  <https://support.advantech.com/support/DownloadSRDetail_New.aspx?SR_ID=GF-GRSC&Doc_Source=Download>`_

----------

* `使用socat实现Linux虚拟串口 <https://blog.csdn.net/rainertop/article/details/26706847>`_





.. code-block:: sh 

        sudo apt-get install -y socat
        socat -d -d pty,raw,echo=0 pty,raw,echo=0


* `摄像头 <https://blog.csdn.net/qq_43433255/article/details/89332667>`_

.. code-block:: sh 

  sudo apt-get install ros-melodic-uvc-camera
  sudo apt-get install "ros-melodic-image-*"
  sudo apt-get install ros-melodic-rqt-image-view

  rosrun uvc_camera uvc_camera_node
  rosrun image_view image_view image:=/image_raw

***********
环境搭建
***********

.. code::

    ###############################
    ## NVIDIA Geforce GTX 1060 Ti
    ###############################
    #
    # SYS : Windows 10
    # Python : 3.6.8 、3.7.3
    #
    # cuda 10.0
    #  
    #    	https://developer.nvidia.com/cuda-toolkit-archive
    #
    #    	cuda_10.0.130_411.31_win10.exe
    #
    # cudnn 7.5.0.56
    #
    #	https://developer.nvidia.com/rdp/cudnn-archive
    #
    #  	Download cuDNN v7.5.0 (Feb 21, 2019), for CUDA 10.0
    #
    #   CUDA_PATH:  C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0
    #   CUDA_PATH_9.0:  C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0
    #   CUDNN:  C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin
    #   path: C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin
    #
    #   #CUDNN bin include lib 分别拷贝到CUDA中相同名称的文件
    ###############################

    numpy==1.16.3 
    tensorflow-gpu==1.13.1 
    keras==2.2.4
    opencv-python==3.4.3.18 

    Pillow==5.1.0
    matplotlib==2.2.2  

*************
Autoware
*************

* `Wiki <https://gitlab.com/autowarefoundation/autoware.ai/autoware/-/wikis/home>`_

.. code-block:: sh

    # Build Eigen Requre add  CPLUS_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=/usr/local/include/eigen3:${CPLUS_INCLUDE_PATH}

docker 
========

需要 在 autoware 用户下操作

.. code-block:: sh

     git clone https://gitlab.com/autowarefoundation/autoware.ai/docker.git

     cd docker/generic

     mkdir ~/Autoware
    ./run.sh --ros-distro melodic 
    ./run.sh --ros-distro melodic --cuda off # 无cuda

-------

新建 autoware 用户

.. code::

    #/etc/sudoers 添加
    autoware      ALL=NOPASSWD:ALL
    
* `问题: No protocol specified  <https://blog.csdn.net/Niction69/article/details/78480675>`_

.. code-block:: sh
    
    #　root 用户下
    xhost +

