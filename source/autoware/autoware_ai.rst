Autoware.AI
============

.. image:: https://pic2.zhimg.com/80/v2-f36c99478ce4d0b7ecd8b8ad61a9ed95_720w.jpg
        :scale: 60%


.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=298 height=52 src="https://music.163.com/outchain/player?type=2&id=31445772&auto=1&height=32"></iframe>


* `Wiki <https://github.com/Autoware-AI/autoware.ai/wiki>`_


MapToolbox
-------------------

* `MapToolbox <https://github.com/autocore-ai/MapToolbox/tree/lanelet2>`_
    * https://github.com/autocore-ai/MapToolbox.git 
    * https://github.com/tier4/MapToolbox




.. raw:: html

    <iframe width="560" height="315" src="https://www.youtube.com/embed/WTRHPs8pN04" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


* `矢量地图 <https://account.tier4.jp/accounts/login/>`_
* `ASSURE mapping tools <https://github.com/hatem-darweesh/assuremappingtools>`_

--------------

一 环境搭建
------------


1 安装 CUDA 10.0
```````````````````

* Step 1 : revmoe nvidia

    .. code-block:: sh

        sudo apt-get remove --purge nvidia*

* Step 2 : Install cuda 10.0

    `下载链接: cuda-repo-ubuntu1804_10.0.130-1_amd64.deb <https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb>`_

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


2 安装 ROS melodic
````````````````````

2.1 更新 ROS源地址
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

2.2 安装 ROS
:::::::::::::::::::

* 执行安装脚本

.. code-block:: sh
    
    # 按照提示输入,当前用户密码
    # x86_64
    wget -qO - https://raw.githubusercontent.com/my-rds-store/my_space/master/source/autoware/src/ros_instal.sh | bash
    wget -qO - https://raw.fastgit.org/my-rds-store/my_space/master/source/autoware/src/ros_instal.sh | bash 

    # Arm - Nvidia Jetson AGX
    wget -qO - https://github.com/my-rds-store/my_space/raw/master/source/autoware/src/ros_install_agx.sh | bash
    wget -qO - https://raw.fastgit.org/my-rds-store/my_space/master/source/autoware/src/ros_install_agx.sh


* x86_64安装脚本的源码如下:

  .. literalinclude:: ./src/ros_instal.sh
     :language: bash


3 源码编译 Autoware
````````````````````````````````

* step 1 : Install Eigen (线性算术的C++模板库) 

* `主页 <http://eigen.tuxfamily.org/index.php?title=Main_Page>`_

.. code-block:: sh

    #wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz #Download Eigen 失效
    wget -O 3.3.7.tar.gz https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz

    mkdir eigen && tar --strip-components=1 -xzvf 3.3.7.tar.gz -C eigen #Decompress

    cd eigen && mkdir build && cd build && cmake .. && make && sudo make install #Build and install

    cd ../../ && rm -rf 3.3.7.tar.gz && rm -rf eigen #Remove downloaded and temporary files

* step 2 : Build Autoware

**注意**

    .. code::

        NVIDIA Jetson AGX Xavier 
            需要 将libopencv-dev 版本 
            由 4.1.1-2-gd5a58aa75 降为 3.2.0+dfsg-4ubuntu0.1

            sudo apt-get install libopencv-dev=3.2.0+dfsg-4ubuntu0.1

    **build autoware 1.13.0 on  NVIDIA Jetson AGX Xavier**
        * `autoware master branch build on nvidia Jetson AGX Xavier <https://gitlab.com/autowarefoundation/autoware.ai/autoware/-/merge_requests/25/diffs?commit_id=4706665ce4366f66034ecd089902f57426b5a728>`_ 
        * https://www.ncnynl.com/archives/201911/3482.html

    .. code-block:: sh

            cd vendor/mrt_cmake_modules
            git checkout 9ddefc0


.. code-block:: sh

    mkdir -p autoware.ai/src
    cd autoware.ai


    # Download 1.14.0
    wget https://raw.fastgit.org/Autoware-AI/autoware.ai/1.14.0/autoware.ai.repos
    sed -i "s/github.com/hub.fastgit.org/" autoware.ai.repos

    #　使用官方 lanelet2
    # sudo apt-get install  ros-melodic-lanelet2

    # Download master
    wget -O autoware.ai.repos "https://raw.githubusercontent.com/Autoware-AI/autoware.ai/master/autoware.ai.repos"

    vcs import src < autoware.ai.repos

    ## Install dependencies using rosdep.
    rosdep update # 如遇失败, 需登梯子,原因不解释

    # 或者执行,也可以
    wget -qO - https://raw.fastgit.org/my-rds-store/my_space/master/source/ros/shell/rosdep_repair.sh | bash

    rosdep update


    rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

    # Without CUDA Support
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

    # With CUDA support
    AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

    # With CUDA support build gnss_localizer only
    # AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --packages-up-to gnss_localizer \
    #                                --cmake-args -DCMAKE_BUILD_TYPE=Release  

* `cuda 10.2 安装 autoware  <https://blog.csdn.net/qq_43509129/article/details/109224071>`_

------

* step 2 : Run Autoware

.. code-block:: sh

    cd autoware.ai
    source install/setup.bash
    roslaunch runtime_manager runtime_manager.launch


* lidar_apollo_cnn_seg_detect

.. code-block:: sh


  #参考: https://www.cnblogs.com/hgl0417/p/12114955.html
  
  sudo apt install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
  sudo apt install -y --no-install-recommends libboost-all-dev
  sudo apt install -y libopenblas-dev #libatlas-base-dev
  sudo apt install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
  
  git clone --depth 1 https://hub.fastgit.org/BVLC/caffe.git $HOME/caffe
  
  URL_PATH=https://raw.fastgit.org/my-rds-store/my_space/master/source/autoware/src/caffe
  wget -O $HOME/caffe/Makefile.config  $URL_PATH/Makefile.config
 
  # for arm  plantform
  set -i "s/x86_64/aarch64/" $HOME/caffe/Makefile.config
  
  cd  $HOME/caffe; make &&  make distribute
  
  
  tee ${HOME}/.bash_aliases <<-'EOF'
  export LD_LIBRARY_PATH=$HOME/caffe/distribute/lib:$LD_LIBRARY_PATH
  export APOLLO_CNNSEG=/home/promote/Autoware/APOLLO_CNNSEG
  EOF
  
  # lidar_apollo_cnn_seg_detect patch
  cd ${HOME}/Autoware/src/autoware/core_perception/lidar_apollo_cnn_seg_detect
  wget -O lidar_apollo_cnn_seg_detect.patch ${URL_PATH}/lidar_apollo_cnn_seg_detect.patch
  git apply lidar_apollo_cnn_seg_detect.patch

  #下载 APOLLO_CNNSEG
  #https://github.com/ApolloAuto/apollo/tree/master/modules/perception/production/data/perception/lidar/models/cnnseg
  #https://hub.fastgit.org/ApolloAuto/apollo/tree/master/modules/perception/production/data/perception/lidar/models/cnnseg


4. Autoware Docker 镜像
``````````````````````````

.. code-block:: sh

     git clone -b 1.14.0 https://github.com/Autoware-AI/docker.git

     cd docker/generic

     mkdir ${HOME}/shared_dir

    ./run.sh --ros-distro melodic            # 有 nvidia cuda支持  
    ./run.sh --ros-distro melodic --cuda off # 无 nvidia cuda支持


   
* `问题: No protocol specified  <https://blog.csdn.net/Niction69/article/details/78480675>`_

.. code-block:: sh
    
    #　root 用户下
    xhost +



.. code-block:: sh

        # for armv8
        docker pull autoware/arm64v8:1.14.0-melodic


5. 学习资料
`````````````

* `autoware入门教程 <https://www.ncnynl.com/archives/201910/3402.html>`_



二 Gazebo Simulation
-------------------------------------------------------------------

* https://github.com/Autoware-AI/autoware.ai/wiki/Gazebo-Simulation-Start

* Example :
    * `如何在Gazebo仿真环境配置自动驾驶汽车 <https://blog.csdn.net/Travis_X/article/details/105418119>`_
    * `使用NDT构建点云地图  <https://blog.csdn.net/Travis_X/article/details/105455195>`_
    * `使用Hybrid a*进行路径规划 <https://blog.csdn.net/Travis_X/article/details/105949471>`_
    * `使用Pure Pursuit和MPC进行路径追踪 <https://blog.csdn.net/Travis_X/article/details/106116998>`_
    * `给仿真环境中的自动驾驶汽车更换或添加传感器  <https://blog.csdn.net/Travis_X/article/details/105418550>`_
    * https://blog.csdn.net/Travis_X/article/details/115000150 
    * https://blog.csdn.net/qq_31815513/article/details/88709640
        * https://blog.csdn.net/qq_15569561/article/details/88853807
        * https://blog.csdn.net/robinvista/article/details/95137143

`三 CARLA Simulator <https://carla.readthedocs.io/en/0.9.10/>`_
-------------------------------------------------------------------

* 待研究
    * https://www.bilibili.com/video/BV1ZB4y1u7ZV?from=search&seid=12311616562034216922&spm_id_from=333.337.0.0
    * https://blog.csdn.net/qq_39537898/article/details/118436448


.. code-block:: sh

 # 0.9.10 depends
 pip install --user pygame numpy

 python -m pip install pygame==2.0.1 # 0.9.10.1


`ros-bridge <https://carla.readthedocs.io/projects/ros-bridge/en/latest/>`_
`````````````````````````````````````````````````````````````````````````````


.. code-block:: sh

        roslaunch carla_ros_bridge carla_ros_bridge_with_example_ego_vehicle.launch \
            host:=192.168.8.6 town:=Town03 vehicle_filter:=vehicle.toyota.prius  \
            spawn_point:="0.700499,-189.727951,0.2,0,0.000000,-91.413536"

`carla-autoware <https://hub.fastgit.org/carla-simulator/carla-autoware>`_
`````````````````````````````````````````````````````````````````````````````

.. code-block:: sh

    SDL_VIDEODRIVER=offscreen ./CarlaUE4.sh -opengl

    roslaunch carla_autoware_agent carla_autoware_agent.launch town:=Town03 host:=192.168.8.6


* `Carla教程-叶小飞 <https://www.zhihu.com/people/xie-xiao-fei-78-24/posts>`_


`四 LGSVL Simulator <https://www.lgsvlsimulator.com/docs/>`_
-------------------------------------------------------------------------

.. code-block:: sh
 
    # ubuntu18.04 Install lgsvls imulator
    sudo apt install libcanberra-gtk-module libcanberra-gtk3-module # Failed to load module "canberra-gtk-module"
    sudo apt-get install libgtk2.0-0:i386 libglib2.0-0:i386 libgdk-pixbuf2.0-0:i386 # 待验证
    sudo apt-get install vulkan-utils # 解决: No supported renderes found, exiting 

.. code-block:: sh

    ## 
    ${HOME}/.config/unity3d/LG\ Silicon\ Valley\ Lab/LGSVL\ Simulator

.. code::

   Windows LGSVL地图及配置文件，下载保存路径为

   2020早期版本 
           %userprofile%\AppData\Locallow\LG Silicon Valley Lab\LGSVL Simulator\

   2021版本 
           %userprofile%\AppData\locallow\LGElectronics



.. code-block:: sh

    cp -rvf  ./src/autoware/simulation/lgsvl_simulator_bridge/*  \
             ./install/lgsvl_simulator_bridge/share/lgsvl_simulator_bridge/
    source install/setup.bash
    roslaunch runtime_manager runtime_manager.launch
    
    # start
    roslaunch rosbridge_server rosbridge_websocket.launch

    # nvidia  jetson AGX  Xavier  depend
    sudo apt-get install python-bson python-tornado
   
--------

* `LGSVL Simulator python API 整理总结 ------ (待验证) <https://www.jianshu.com/p/9585cb18f0a6>`_
* `罗技 G29 方向盘 ------ (待验证) <https://www.jianshu.com/p/d314f70b26ba>`_

--------



五 学习笔记
------------


使用GNSS进行定位
`````````````````

gnss_localizer 
:::::::::::::::

https://github.com/autowarefoundation/autoware/issues/492


.. code-block:: sh

    find . -name "*.py" -or -name "*.yaml"| xargs grep -in plane
    find . -name "*.c*" -or -name "*.h*" -or -name "*.launch" -or -name "*.py" | xargs grep -in set_plane

    vim ./autoware/utilities/runtime_manager/scripts/computing.yaml +1281
    vim ./autoware/utilities/autoware_launcher/plugins/refs/nmea2tfpose.yaml +11

    vim ./autoware/core_perception/gnss_localizer/launch/fix2tfpose.launch +4
    vim ./autoware/core_perception/gnss_localizer/nodes/nmea2tfpose/nmea2tfpose_core.cpp +46

    vim ./autoware/common/gnss/src/geo_pos_conv.cpp +52



`路径跟踪基本配置 <https://qiita.com/hakuturu583/items/297adfd8ad0fa54d1a24>`_
````````````````````````````````````````````````````````````````````````````````

.. code-block:: xml

    <!-- lgsvl-tf.launch -->

    <launch>
    <node pkg="tf"  type="static_transform_publisher" name="world_to_map" args="0 0 0 0 0 0 /world /map 10" />
    <node pkg="tf"  type="static_transform_publisher" name="map_to_mobility" args="0 0 0 0 0 0 /map /mobility 10" />
    </launch>


Autoware Camera-LiDAR Calibration Package
```````````````````````````````````````````

* `Autoware Camera-LiDAR Calibration <https://gitlab.com/autowarefoundation/autoware.ai/utilities/-/tree/master/autoware_camera_lidar_calibrator>`_

*  节点拓扑图 待整理

.. code-block:: sh

    # calibration_publisher

    CALIBRATION=$(pwd)/calibration/autoware_lidar_camera_calibration.yaml

    roslaunch runtime_manager calibration_publisher.launch target_frame:=velodyne camera_frame:=camera file:=${CALIBRATION} \
    register_lidar2camera_tf:=True publish_extrinsic_mat:=True publish_camera_info:=True \
    camera_info_topic:=/camera_info2  \
    image_topic_src:=/image_raw  \
    projection_matrix_topic:=/projection_matrix  \
    camera_id:=/cv_camera


    # points2image
    roslaunch runtime_manager  points2image.launch  camera_id:=/cv_camera camera_info_src:=/camera_info2

    #######################################################################
    #
    # rosrun topic_tools relay /cv_camera/image_raw /image_raw

    #CALIBRATION=$(pwd)/calibration/autoware_lidar_camera_calibration.yaml
    #roslaunch runtime_manager calibration_publisher.launch target_frame:=velodyne camera_frame:=camera file:=${CALIBRATION}  \
    #        register_lidar2camera_tf:=True publish_extrinsic_mat:=True publish_camera_info:=True \
    #        camera_info_topic:=/camera_info  \
    #        image_topic_src:=/image_raw       \
    #        projection_matrix_topic:=/projection_matrix camera_id:=/

    # #points2image
    #roslaunch runtime_manager  points2image.launch  camera_id:=/ camera_info_src:=camera_info




Traffic Light Recognition
````````````````````````````````````

* `Traffic Light Recognition <https://i.youku.com/i/UNDIxMDQ1MTkzNg==?spm=a2h0j.11185381.module_basic_dayu_sub.DLDDH2~A>`_

.. raw:: html

    <iframe height=650 width=1100 src='https://player.youku.com/embed/XMjg5MzQ0MjEzNg==' frameborder=0 'allowfullscreen'></iframe>

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

.. code-block:: sh

    sudo apt install ros-melodic-cv-camera

    rosparam set cv_camera/device_id 2

    rosrun cv_camera cv_camera_node

    rostopic echo /cv_camera/image_raw

.. code-block:: bash

    mkdir -p usb_cam 
    cd usb_cam 

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

* How to use object detection package in Autoware 

.. raw:: html

  <iframe width="560" height="315" src="https://www.youtube.com/embed/rCSzirRForc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

------------------

* `RoboSense-LiDAR <https://github.com/RoboSense-LiDAR/ros_rslidar.git>`_

.. code:: 

    $ git diff

    diff --git a/rslidar_pointcloud/launch/cloud_nodelet.launch b/rslidar_pointcloud/launch/cloud_nodelet.launch
    index 6f0869a..a3ef4e9 100644
    --- a/rslidar_pointcloud/launch/cloud_nodelet.launch
    +++ b/rslidar_pointcloud/launch/cloud_nodelet.launch
    @@ -15,6 +15,9 @@
         <param name="device_ip" value="$(arg device_ip)" />
         <param name="msop_port" value="$(arg msop_port)" />
         <param name="difop_port" value="$(arg difop_port)"/>
    +
    +    <!-- support autoware  -->
    +    <param name="frame_id" type="string" value="velodyne"/>
       </node>
     
       <node pkg="nodelet" type="nodelet" name="$(arg manager)_cloud"
    @@ -24,5 +27,7 @@
         <param name="angle_path" value="$(find rslidar_pointcloud)/data/rs_lidar_16/angle.csv" />
         <param name="channel_path" value="$(find rslidar_pointcloud)/data/rs_lidar_16/ChannelNum.csv" />
     
    +       <!-- support autoware  -->
    +       <remap from="rslidar_points" to="/points_raw"/>
       </node>
     </launch>

.. code-block:: sh

   rostopic echo /points_raw     | grep frame_id
