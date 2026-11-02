ROS 2
===============

**适用版本**：Humble 仍可用；新项目建议 Jazzy/Lyrical。

navigation2
------------------

.. code-block:: bash

   sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup
   sudo apt install python3-rosdep2 python3-colcon-common-extensions python3-vcstool

   rosdep init
   rosdep update
   rosdep install --from-paths src --ignore-src -r -y

Docker 镜像
-----------

* L4T
    * `L4T Containers <https://catalog.ngc.nvidia.com/containers?filters=&orderBy=scoreDESC&query=l4t>`_
        * `l4t cuda <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-cuda>`_
        * `l4t-tensorrt <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorrt>`_
        * `l4t-jetpack <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-jetpack>`_
    * `l4t-ros <https://hub.docker.com/r/dustynv/ros>`_
        * `l4t-humble <https://hub.docker.com/r/dustynv/ros/tags?page=1&name=humble>`_

    .. code-block:: bash

        docker pull dustynv/ros:humble-desktop-l4t-r36.2.0

* Amd64
    * `CUDA <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda>`_
    * `TensorRT <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorrt>`_

常用命令
--------

节点与话题
~~~~~~~~~~

.. code-block:: bash

   ros2 node list
   ros2 node info <node_name>
   ros2 topic list -t
   ros2 topic echo /turtle1/cmd_vel
   ros2 topic hz /turtle1/pose
   ros2 interface show std_msgs/msg/String
   ros2 run <package> <executable>

参数与 bag
~~~~~~~~~~

.. code-block:: bash

   ros2 param list
   ros2 param get <node> <param>
   ros2 param set <node> <param> <value>
   ros2 bag record <topic>
   ros2 bag info <bag>
   ros2 bag play <bag>

常用包与工具
------------

* CAN
    * `ros_canopen <https://github.com/ros-industrial/ros_canopen>`_
    * `can_dbc_parser <https://github.com/NewEagleRaptor/raptor-dbw-ros2>`_

  .. code-block:: bash

     colcon build --symlink-install --packages-select socketcan_bridge

* PCL

  .. code-block:: bash

     pcl_voxel_grid input.pcd output.pcd -leaf 0.5,0.5,0.5
     pcl_convert_pcd_ascii_binary in.pcd out.pcd 1

* CyberDog DDS
    * `本地及多播设置 <https://github.com/MiRoboticsLab/cyberdog_ros2/wiki/CyberDog-DDS本地及多播设置>`_

* 打包

  .. code-block:: bash

     sudo apt install python3-catkin-pkg python3-bloom fakeroot debhelper
     bloom-generate rosdebian --os-name ubuntu --os-version $(lsb_release -cs) --ros-distro ${ROS_DISTRO}
     fakeroot debian/rules binary

学习资料
--------

* `ROS 2 中文指南 <https://doc.bwbot.org/zh-cn/books-online/ros2/tourial/tourial/ament.html>`_
* `ROS 2 入门教程 <https://www.ncnynl.com/archives/201801/2250.html>`_
* `ros2/examples <https://github.com/ros2/examples>`_

过时内容
--------

* Galactic / Foxy 的 Docker 与 tf2 示例
  :doc:`/legacy/ros2-galactic-foxy`
* LGSVL 仿真与旧教程链接
  :doc:`/legacy/ros2-links`
