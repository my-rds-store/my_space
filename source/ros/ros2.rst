#############
ROS2
#############

* Galactic
    * `Tutorials <https://docs.ros.org/en/galactic/Tutorials.html>`_
    * `API <https://docs.ros2.org/galactic/api/rclcpp/index.html>`_


    .. code-block:: bash

        docker pull osrf/ros:galactic-desktop


* Foxy 
    * `Tutorials  <https://docs.ros.org/en/foxy/Tutorials.html>`_
    * `API <https://docs.ros2.org/foxy/api/rclcpp/index.html>`_


    .. code-block:: bash

        docker pull osrf/ros:foxy-desktop

* Dashing 
    * `Tutorials <https://docs.ros.org/en/dashing/Tutorials.html>`_
    * `API <https://docs.ros2.org/dashing/api/rclcpp/index.html>`_

    .. code-block:: bash

        docker pull osrf/ros:dashing-desktop


--------------------------

* Packages
    * `ros_canopen <https://github.com/ros-industrial/ros_canopen/tree/dashing>`_
    * `can_dbc_parser <https://github.com/NewEagleRaptor/raptor-dbw-ros2>`_
    * http://docs.ros.org/en/melodic/api/can_dbc_parser/html/annotated.html
      

* Node

.. code:: bash
     
    # 检查 turtlesim 是否已经安装
    ros2 pkg executables turtlesim

    ros2 node list
    ros2 topic list
    ros2 service list
    ros2 action list


    ros2 run <package_name> <executable_name>

    ros2 node list

    ros2 node info <node_name>

    # 重映射
    ros2 run turtlesim turtlesim_node --ros-args --remap __node:=my_turtle

    ros2 lifecycle set <nodename> shutdown  # kill node 有待验证

* Topic

.. code:: bash

    ros2 topic list 

    ros2 topic list -t

    ros2 topic echo /turtle1/cmd_vel

    # 主题信息
    # ros2 topic info /turtle1/cmd_vel

    # 消息类型
    ros2 msg show std_msgs/String       # dashing
    ros2 interface show std_msgs/String # galactic

    # 消息频率
    ros2 topic hz /turtle1/pose    

    # 消息发布
    ros2 topic pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"
    ros2 topic pub --rate 1 /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}" # 1 Hz


* Services 

* Parameters

.. code:: bash

        ros2 param list
        ros2 param get <node_name> <parameter_name>
        ros2 param set <node_name> <parameter_name> <value>

        ros2 param dump <node_name>
        ros2 param load <node_name> <parameter_file>

        ros2 run <package_name> <executable_name> --ros-args --params-file <file_name>

* Actions


* Recording adn playing back data

.. code:: bash

          ros2 bag record <topic_name>

          ros2 bag record /turtle1/cmd_vel

          ros2 bag record -o subset /turtle1/cmd_vel /turtle1/pose


          ros2 bag info <bag_file_name>

          ros2 bag play subset

----

* ROS2 中文指南
    * `gitbook <https://doc.bwbot.org/zh-cn/books-online/ros2/tourial/tourial/ament.html>`_
    * `pdf <https://doc.bwbot.org/media/books/ros2.pdf>`_

.. code-block:: bash

    git clone https://github.com/ros2/examples.git 

    git clone https://hub.fastgit.org/ros2/examples.git 

----

* `ROS2入门教程-创客制造 <https://www.ncnynl.com/archives/201801/2250.html>`_

----

* `新一代机器人操作系统ROS 2技术文档 <https://www.zhihu.com/column/c_1348897856313581568>`_

    * `为什么选用ROS 2?（Why ROS 2?） <https://zhuanlan.zhihu.com/p/358573978>`_

    * `Ubuntu 20.04中从源代码编译安装ROS 2相关软件包的通用步骤 <https://zhuanlan.zhihu.com/p/387307493>`_
    * `在Ubuntu 20.04上从源代码构建ROS 2最新发行版Galactic过程中遇到的问题及解决办法 <https://zhuanlan.zhihu.com/p/388338751>`_

    * `ROS 2概念 <https://zhuanlan.zhihu.com/p/378758732>`_
        * 一、概念概述——介绍了ROS 2关键概念的一般背景信息，包括以下内容：
            * `十七. 关于ROS_DOMAIN_ID <https://zhuanlan.zhihu.com/p/378752082>`_
            * `一. 关于 ROS2 的不同DDS/RTPS供应商 <https://zhuanlan.zhihu.com/p/353268445>`_
            * `二. 关于日志记录和日志记录器的配置 <https://zhuanlan.zhihu.com/p/353268585>`_
            * `三. 关于服务质量 QoS的设置 <https://zhuanlan.zhihu.com/p/353268703>`_
            * `四. 关于 ROS2 的客户端库 <https://zhuanlan.zhihu.com/p/353268758>`_
            * `五. 关于 ROS2 中的接口 <https://zhuanlan.zhihu.com/p/353268822>`_
            * `六. 关于ROS 2中的参数 <https://zhuanlan.zhihu.com/p/353268908>`_
            * `七. 关于话题统计 <https://zhuanlan.zhihu.com/p/353269019>`_
            * `八. 关于命令行工具 <https://zhuanlan.zhihu.com/p/355187359>`_
            * `九. 关于RQt <https://zhuanlan.zhihu.com/p/355187531>`_
            * `十. 关于多节点组合运行 <https://zhuanlan.zhihu.com/p/355187545>`_
            * `十一. 关于ament和catkin的混合（catment） <https://zhuanlan.zhihu.com/p/355489256>`_
            * `十二. 关于交叉编译 <https://zhuanlan.zhihu.com/p/355503001>`_
        * 二、核心堆栈开发人员概念——是一些更为详细的概念文章，适用于计划修改ROS 2核心或为ROS 2核心做出贡献的开发人员，包括以下内容：
            * `十三. 关于构建系统 <https://zhuanlan.zhihu.com/p/355511940>`_
            * `十四. 关于ROS 2的内部接口 <https://zhuanlan.zhihu.com/p/356079313>`_
            * `十五. 关于ROS 2的中间件实现 <https://zhuanlan.zhihu.com/p/356200042>`_
            * `十六. 关于ROS 2的客户端接口（客户端库） <https://zhuanlan.zhihu.com/p/356219683>`_

    * `ROS 2教程目录及各教程文章的知乎链接 <https://zhuanlan.zhihu.com/p/378772863>`_
        * 入门教程
            * 入门教程一：命令行界面CLI工具
                * `1.1.  配置 ROS2 环境 <https://zhuanlan.zhihu.com/p/353375675>`_
                * `1.2.  turtlesim和rqt简介 <https://zhuanlan.zhihu.com/p/353452379>`_
                * `1.3.  理解ROS 2的节点 <https://zhuanlan.zhihu.com/p/353453119>`_
                * `1.4.  理解ROS 2的话题 <https://zhuanlan.zhihu.com/p/353453770>`_
                * `1.5.  理解ROS 2的服务 <https://zhuanlan.zhihu.com/p/353634237>`_
                * `1.6.  理解ROS 2的参数 <https://zhuanlan.zhihu.com/p/353634676>`_
                * `1.7.  理解ROS 2的动作 <https://zhuanlan.zhihu.com/p/353667611>`_
                * `1.8.  使用rqt_console <https://zhuanlan.zhihu.com/p/353719440>`_
                * `1.9.  创建launch文件 <https://zhuanlan.zhihu.com/p/353729661>`_
                * `1.10. 记录和回放数据 <https://zhuanlan.zhihu.com/p/353740886>`_
            * 入门教程二：客户端库
                * `2.1.  创建工作空间 <https://zhuanlan.zhihu.com/p/353759935>`_
                * `2.2.  创建您的第一个ROS 2软件包 <https://zhuanlan.zhihu.com/p/353772574>`_
                * `2.3.  编写一个简单的发布者和订阅者(C++) <https://zhuanlan.zhihu.com/p/353892419>`_
                * `2.4.  编写一个简单的发布者和订阅者(Python) <https://zhuanlan.zhihu.com/p/353896706>`_
                * `2.5.  编写一个简单的服务器和客户端（C++） <https://zhuanlan.zhihu.com/p/353900264>`_
                * `2.6.  编写一个简单的服务器和客户端（Python） <https://zhuanlan.zhihu.com/p/353973863>`_
                * `2.7.  创建ROS 2 自定义msg和srv接口文件 <https://zhuanlan.zhihu.com/p/354024005>`_
                * `2.8.  扩展ROS 2的接口 <https://zhuanlan.zhihu.com/p/354036018>`_
                * `2.9.  在类中使用参数（C++） <https://zhuanlan.zhihu.com/p/354043265>`_
                * `2.10. 在类中使用参数（Python） <https://zhuanlan.zhihu.com/p/354048987>`_
                * `2.11. ros2doctor入门 <https://zhuanlan.zhihu.com/p/354055291>`_
        * 中级教程
            * `3. 创建动作（action） <https://zhuanlan.zhihu.com/p/354161951>`_
            * `4. 编写动作服务器和客户端（C++） <https://zhuanlan.zhihu.com/p/354161972>`_
            * `5. 编写动作服务器和客户端（Python） <https://zhuanlan.zhihu.com/p/354162024>`_
            * `6. 用Launch启动/监视多个节点 <https://zhuanlan.zhihu.com/p/354478039>`_
            * `7. 在单个进程中组合运行多个节点 <https://zhuanlan.zhihu.com/p/354595031>`_
            * `8. 使用colcon构建软件包 <https://zhuanlan.zhihu.com/p/354346029>`_

        * 高级教程
            * `9.  ROS 2话题统计教程（C ++） <https://zhuanlan.zhihu.com/p/354845583>`_
            * `10. 使用快速DDS发现服务器作为发现协议[社区提供] <https://zhuanlan.zhihu.com/p/354992306>`_
            * `11. 实现自定义内存分配器 <https://zhuanlan.zhihu.com/p/355083258>`_

        * 杂项教程
            * `12. IBM Cloud Kubernetes上的ROS2 [社区贡献] <https://zhuanlan.zhihu.com/p/357014145>`_
            * `13. 具有ROS 2和rviz2的Eclipse Oxygen[社区贡献] <https://zhuanlan.zhihu.com/p/357260279>`_
            * `14. 用Eclipse Oxygen在Linux上构建ROS 2 [社区贡献] <https://zhuanlan.zhihu.com/p/357679895>`_
            * `15. 为ROS 2构建实时Linux系统 [社区贡献] <https://zhuanlan.zhihu.com/p/358232180>`_

        * 演示教程    
            * `（一）——使用服务质量设置来处理有损网络 <https://zhuanlan.zhihu.com/p/358380700>`_
            * `（二）——具有管理生命周期的节点管理 <https://zhuanlan.zhihu.com/p/358514160>`_
            * `（三）——高效的进程内通信 <https://zhuanlan.zhihu.com/p/359166616>`_
            *  ROS1 和 ROS2之间的桥接通信
            *  使用 ROS1 桥接器的rosbag记录和回放话题数据
            *  使用ROS 2的Turtlebot 2演示
            *  使用ROS 2的TurtleBot 3演示[社区贡献]
            *  MoveIt 2机械臂移动规划演示
            * `（四）——在ROS 2上仿真TurtleBot 3机器人[社区贡献] <https://zhuanlan.zhihu.com/p/359570430>`_
            * `（五）——在robot_state_publisher 节点中使用URDF <https://zhuanlan.zhihu.com/p/377641684>`_
            * `（六）——尝试虚拟机器人演示 <https://zhuanlan.zhihu.com/p/377774108>`_
            * `（七）——在ROS 2中使用tf2 <https://zhuanlan.zhihu.com/p/377800997>`_
            * `（八）——TurtleBot 3导航仿真[社区贡献] <https://zhuanlan.zhihu.com/p/377806991>`_
            * `（九）——TurtleBot 3 SLAM仿真[社区贡献] <https://zhuanlan.zhihu.com/p/377887295>`_
            * `（十）——使用DDS-Security <https://zhuanlan.zhihu.com/p/378174340>`_
            * `（十一）——日志记录和日志记录器配置演示 <https://zhuanlan.zhihu.com/p/378175365>`_
            * `（十二）——使用ROS 2 API编写实时安全代码 <https://zhuanlan.zhihu.com/p/378550872>`_

    * `ROS 2指南 <https://zhuanlan.zhihu.com/p/380548322>`_
        * `（一）——安装故障排除 <https://zhuanlan.zhihu.com/p/379061409>`_
        * `（二）——开发ROS 2软件包 <https://zhuanlan.zhihu.com/p/354345169>`_
        * `（三）——ament_cmake用户文档 <https://zhuanlan.zhihu.com/p/354346905>`_
        * `（四）——将ROS 1启动文件迁移到ROS 2 <https://zhuanlan.zhihu.com/p/379373548>`_
        * `（五）——将YAML参数文件从ROS 1迁移到ROS 2 <https://zhuanlan.zhihu.com/p/379375549>`_
        * `（六）——通过命令行将ROS参数传递给节点 <https://zhuanlan.zhihu.com/p/354479100>`_
        * `（七）——同步与异步服务端/客户端的对比 <https://zhuanlan.zhihu.com/p/379420051>`_
        * `（八）——DDS调优信息 <https://zhuanlan.zhihu.com/p/379592378>`_
        * `（九）——rosbag2：覆写QoS策略 <https://zhuanlan.zhihu.com/p/379747222>`_
        * `（十）——使用多个ROS 2中间件实现 <https://zhuanlan.zhihu.com/p/379788194>`_
        * `（十一）——交叉编译 <https://zhuanlan.zhihu.com/p/380174726>`_
        * `（十二）——用bloom发布ROS 2软件包 <https://zhuanlan.zhihu.com/p/380175211>`_
        * `（十三）——在ROS 2中使用Python软件包 <https://zhuanlan.zhihu.com/p/380176255>`_
        * `（十四）——将RQt插件移植到Windows系统上 <https://zhuanlan.zhihu.com/p/380275022>`_
        * `（十五）——在Docker中运行ROS 2节点[社区贡献] <https://zhuanlan.zhihu.com/p/380275209>`_
        * `（十六）——ROS 2软件包维护者指南 <https://zhuanlan.zhihu.com/p/380545352>`_
        * `（十七）——构建自定义Debian软件包 <https://zhuanlan.zhihu.com/p/380545893>`_
        * `（十八）——从源代码构建RQt <https://zhuanlan.zhihu.com/p/380546122>`_


    * tf2系列教程
        * `tf2系列教程（一）：tf2简介 <https://zhuanlan.zhihu.com/p/394333473>`_
        * `tf2系列教程（二）：在ROS 2中进行tf2简介演示 <https://zhuanlan.zhihu.com/p/394512099>`_
        * `tf2系列教程（三）：在ROS 2中编写tf2静态广播者节点（Python） <https://zhuanlan.zhihu.com/p/395173818>`_
        * `tf2系列教程（四）：在ROS 2中编写tf2广播者节点（Python） <https://zhuanlan.zhihu.com/p/395178873>`_
        * `tf2系列教程（五）：编写tf2侦听者节点（Python） <https://zhuanlan.zhihu.com/p/395196168>`_
        * `tf2系列教程（六）：添加固定坐标系（Python） <https://zhuanlan.zhihu.com/p/395314257>`_
        * `tf2系列教程（七）：添加移动坐标系（Python） <https://zhuanlan.zhihu.com/p/395315804>`_
        * `tf2系列教程（八）：了解ROS 2中的tf2和时间（Python） <https://zhuanlan.zhihu.com/p/396131083>`_
        * `tf2系列教程（十）：四元数基础 <https://zhuanlan.zhihu.com/p/396147677>`_
        * `tf2系列教程（十一）：在ROS 2中编写tf2静态广播者节点（C++） <https://zhuanlan.zhihu.com/p/396636257>`_
        * `tf2系列教程（十二）：在ROS 2中编写tf2广播者节点（C++） <https://zhuanlan.zhihu.com/p/396642014>`_
        * `tf2系列教程（十三）：在ROS 2中编写tf2侦听者节点（C++） <https://zhuanlan.zhihu.com/p/397223244>`_
        * `tf2系列教程（十四）：在ROS 2中添加固定坐标系（C++） <https://zhuanlan.zhihu.com/p/397564441>`_
        * `tf2系列教程（十五）：在ROS 2中添加移动坐标系（C++） <https://zhuanlan.zhihu.com/p/398507856>`_
        * `tf2系列教程（十六）：了解ROS 2中的tf2和时间（C++） <https://zhuanlan.zhihu.com/p/398861005>`_
        * `tf2系列教程（十七）：ROS 2中使用tf2进行时间旅行（C++） <https://zhuanlan.zhihu.com/p/399384891>`_
        * `tf2系列教程（九）：ROS 2中使用tf2进行时间旅行（Python） <https://zhuanlan.zhihu.com/p/399646584>`_
        * `tf2系列教程（十八）：在ROS 2中调试tf2的问题 <https://zhuanlan.zhihu.com/p/400006099>`_
        * `tf2系列教程（十九）： 在ROS 2中使用tf2_ros::MessageFilter处理Stamped数据类型（之一）——发布相机的PointStamped消息 <https://zhuanlan.zhihu.com/p/405591719>`_
        * `tf2系列教程（十九）：在ROS 2中使用tf2_ros::MessageFilter处理Stamped数据类型（之二）——侦听和使用PointStamped消息 <https://zhuanlan.zhihu.com/p/405592440>`_
        * `在ROS 2中从零开始编写相机位置消息发布与订阅节点（Python） <https://zhuanlan.zhihu.com/p/401812290">`_
        * `关于在Github上完成拉取请求（PR）后对两篇“tf2系列教程（十九）”文章中的代码进行更新的说明 <https://zhuanlan.zhihu.com/p/417512933>`_

    * `ROS2 中使用RViz2显示数据 <https://zhuanlan.zhihu.com/p/400012642>`_
    * `ROS2 中用RViz 2可视化PointCloud2数据（一） <https://zhuanlan.zhihu.com/p/406955122>`_
    * `ROS 2中用RViz 2可视化PointCloud2数据（二） <https://zhuanlan.zhihu.com/p/407352357>`_
    * `ROS 2中用RViz 2可视化PointCloud2数据（三） <https://zhuanlan.zhihu.com/p/407353375>`_
    * `ROS 2中用RViz 2仿真机械臂 <https://zhuanlan.zhihu.com/p/408268548>`_

    * MoveIt2教程
        * `在Ubuntu 20.04系统中从源代码构建MoveIt 2 <https://zhuanlan.zhihu.com/p/395200092>`_
        * `MoveIt2教程（一）：MoveIt2简介 <https://zhuanlan.zhihu.com/p/419100453>`_
        * `MoveIt2教程（二）：MoveIt2软件安装 <https://zhuanlan.zhihu.com/p/419103308>`_
        * `MoveIt2教程（三）：MoveIt2基本概念 <https://zhuanlan.zhihu.com/p/420179147>`_
        * `MoveIt2教程（四）：MoveIt2中可用的规划器 <https://zhuanlan.zhihu.com/p/420183051>`_
        * `MoveIt2教程（五）：插件接口 <https://zhuanlan.zhihu.com/p/420635435>`_
        * `MoveIt2教程（六）：在RViz中快速上手MoveIt2 <https://zhuanlan.zhihu.com/p/421013286>`_
        * `MoveIt2教程（七）：Move Group C++接口 <https://zhuanlan.zhihu.com/p/421789271>`_
        * `MoveIt2教程（八）：机器人模型和机器人状态 <https://zhuanlan.zhihu.com/p/422465822>`_
        * `MoveIt2教程（九）：规划场景 <https://zhuanlan.zhihu.com/p/422795015>`_
        * `MoveIt2教程（十）：规划场景监视器 <https://zhuanlan.zhihu.com/p/423206799>`_
        * `MoveIt2教程（十一）：规划场景ROS API <https://zhuanlan.zhihu.com/p/423617672>`_
        * `MoveIt2教程（十二）：MoveItCpp教程 <https://zhuanlan.zhihu.com/p/424035190>`_
        * `MoveIt2教程（十三）：URDF与SRDF <https://zhuanlan.zhihu.com/p/424534509>`_
        * `MoveIt2教程（十四）：实时机械臂伺服 <https://zhuanlan.zhihu.com/p/425022240>`_

    * ROS2中的URDF系列教程
        * `ROS2中的URDF系列教程（一）：从零开始用URDF构建视觉机器人模型 <https://zhuanlan.zhihu.com/p/425517594>`_
        * `ROS2中的URDF系列教程（二）：用URDF构建移动机器人模型 <https://zhuanlan.zhihu.com/p/425888759>`_
        * `ROS2中的URDF系列教程（三）：向URDF模型添加物理和碰撞属性 <https://zhuanlan.zhihu.com/p/426301144>`_
        * `ROS2中的URDF系列教程（四）：使用Xacro整理URDF文件 <https://zhuanlan.zhihu.com/p/426313459>`_
        * `ROS2中的URDF系列教程（五）：如何在ROS 2中使用URDF创建仿真移动机器人（之一） <https://zhuanlan.zhihu.com/p/427197786>`_
        * `ROS2中的URDF系列教程（五）：如何在ROS 2中使用URDF创建仿真移动机器人（之二） <https://zhuanlan.zhihu.com/p/427201074>`_
        * `ROS2中的URDF系列教程（六）：ROS 2中如何将URDF加载到RViz <https://zhuanlan.zhihu.com/p/427770915>`_
        * `ROS2中的URDF系列教程（七）：ROS 2中如何将URDF加载到Gazebo <https://zhuanlan.zhihu.com/p/427772561>`_
        * `ROS2中的URDF系列教程（八）：如何将包含Xacro的URDF文件转换成SDF文件 <https://zhuanlan.zhihu.com/p/427773504>`_
        * `ROS2中的URDF系列教程（九）：理解PR2机器人的URDF描述 <https://zhuanlan.zhihu.com/p/428525808>`_
        * `ROS2中的URDF系列教程（十）：URDF XML规程（之一） <https://zhuanlan.zhihu.com/p/429351348>`_
        * `ROS2中的URDF系列教程（十）：URDF XML规程（之二） <https://zhuanlan.zhihu.com/p/429356596>`_
        * `ROS2中的URDF系列教程（十）：URDF XML规程（之三） <https://zhuanlan.zhihu.com/p/429806845>`_
        * `ROS2中的URDF系列教程（十）：URDF XML规程（之四） <https://zhuanlan.zhihu.com/p/429807694>`_
        * `ROS2中的URDF系列教程（十）：URDF XML规程（之五） <https://zhuanlan.zhihu.com/p/430462317>`_

    * SDF规程系列
        * `SDF规程系列（一） <https://zhuanlan.zhihu.com/p/432517795>`_
        * `SDF规程系列（二） <https://zhuanlan.zhihu.com/p/432546954>`_
        * `SDF规程系列（三） <https://zhuanlan.zhihu.com/p/432551144>`_
        * `SDF规程系列（四） <https://zhuanlan.zhihu.com/p/432559971>`_
        * `SDF规程系列（五） <https://zhuanlan.zhihu.com/p/432887077>`_
        * `SDF规程系列（六） <https://zhuanlan.zhihu.com/p/433121783>`_
        * `SDF规程系列（七） <https://zhuanlan.zhihu.com/p/433522920>`_
        * `SDF规程系列（八） <https://zhuanlan.zhihu.com/p/433970186>`_
        * `SDF规程系列（九） <https://zhuanlan.zhihu.com/p/434430342>`_
        * `SDF规程系列（十） <https://zhuanlan.zhihu.com/p/434847335>`_
        * `SDF规程系列（十一） <https://zhuanlan.zhihu.com/p/435323836>`_
        * `SDF规程系列（十二） <https://zhuanlan.zhihu.com/p/435904928>`_
        * `SDF规程系列（十三） <https://zhuanlan.zhihu.com/p/436271023>`_
        * `SDF规程系列（十四） <https://zhuanlan.zhihu.com/p/436745697>`_
        * `SDF规程系列（十五）——传感器之一 <https://zhuanlan.zhihu.com/p/437702957>`_
        * `SDF规程系列（十五）——传感器之二 <https://zhuanlan.zhihu.com/p/437704085>`_
        * `SDF规程系列（十五）——传感器之三 <https://zhuanlan.zhihu.com/p/437704597>`_
        * `SDF规程系列（十五）——传感器之四 <https://zhuanlan.zhihu.com/p/437705167>`_

    * `ROS 2 Foxy发行版官方文档体系结构发生了变化 <https://zhuanlan.zhihu.com/p/354814098>`_
    * `ROS 2文档中的术语词汇表 <https://zhuanlan.zhihu.com/p/355749867>`_
    * `机器人操作系统ROS 2系列文档中译版即将陆续发布 <https://zhuanlan.zhihu.com/p/353262749>`_

    * `对第二代机器人操作系统ROS 2 的一些理解小结——五问ROS 2 <https://zhuanlan.zhihu.com/p/358978439>`_

    * Gazebo 11新手课程指南——初级教程
        * `Gazebo 11新手课程指南——初级教程（一） <https://zhuanlan.zhihu.com/p/361850080>`_
        * `Gazebo 11新手课程指南——初级教程（二） <https://zhuanlan.zhihu.com/p/361857768>`_
        * `Gazebo 11新手课程指南——初级教程（三） <https://zhuanlan.zhihu.com/p/361860161>`_
        * `Gazebo 11新手课程指南——初级教程（四） <https://zhuanlan.zhihu.com/p/361870838>`_
        * `Gazebo 11新手课程指南——初级教程（五） <https://zhuanlan.zhihu.com/p/361874511>`_
        * `Gazebo 11新手课程指南——初级教程（六） <https://zhuanlan.zhihu.com/p/362010342>`_
        * `Gazebo 11新手课程指南——中级教程（一） <https://zhuanlan.zhihu.com/p/362413058>`_
        * `Gazebo 11新手课程指南——中级教程（二） <https://zhuanlan.zhihu.com/p/362504048>`_
        * `Gazebo 11新手课程指南——中级教程（三） <https://zhuanlan.zhihu.com/p/362504469>`_
        * `Gazebo 11新手课程指南——中级教程（四） <https://zhuanlan.zhihu.com/p/362819467>`_
        * `Gazebo 11新手课程指南——中级教程（五） <https://zhuanlan.zhihu.com/p/362931510>`_
        * `开源机器人：上手Gazebo和ROS 2 <https://zhuanlan.zhihu.com/p/363385205>`_
        * `机器人仿真实战——使用Gazebo11和ROS2进行仓库移动机器人仿真（一） <https://zhuanlan.zhihu.com/p/363760883>`_
        * `机器人仿真实战——使用Gazebo 11和ROS 2进行仓库移动机器人仿真（二） <https://zhuanlan.zhihu.com/p/363764086>`_
        * `机器人仿真实战——使用Gazebo 11和ROS 2进行仓库移动机器人仿真（三） <https://zhuanlan.zhihu.com/p/364059860>`_
        * `机器人仿真实战——使用Gazebo 11和ROS 2进行仓库移动机器人仿真（四） <https://zhuanlan.zhihu.com/p/364061266>`_
        * `机器人仿真实战——使用Gazebo 11和ROS 2进行仓库移动机器人仿真（五） <https://zhuanlan.zhihu.com/p/364351796>`_
        * `Gazebo 11分类教程——开始使用Gazebo（一） <https://zhuanlan.zhihu.com/p/365232932>`_
        * `Gazebo 11分类教程——开始使用Gazebo（二） <https://zhuanlan.zhihu.com/p/365254619>`_
        * `Gazebo 11分类教程——开始使用Gazebo（三） <https://zhuanlan.zhihu.com/p/365394088>`_
        * `Gazebo 11分类教程——构建机器人（一） <https://zhuanlan.zhihu.com/p/366203597>`_
        * `Gazebo 11分类教程——构建机器人（二） <https://zhuanlan.zhihu.com/p/366203793>`_
        * `Gazebo 11分类教程——构建机器人（三） <https://zhuanlan.zhihu.com/p/366204153>`_
        * `Gazebo 11分类教程——构建机器人（四） <https://zhuanlan.zhihu.com/p/366500489>`_
        * `Gazebo 11分类教程——构建机器人（五） <https://zhuanlan.zhihu.com/p/366500622>`_
        * `Gazebo 11分类教程——构建机器人（六） <https://zhuanlan.zhihu.com/p/366500856>`_
        * `Gazebo 11分类教程——构建机器人（七） <https://zhuanlan.zhihu.com/p/367376124>`_
        * `Gazebo 11分类教程——构建机器人（八） <https://zhuanlan.zhihu.com/p/367376171>`_
        * `Gazebo 11分类教程——构建机器人（九） <https://zhuanlan.zhihu.com/p/367929833>`_
        * `Gazebo 11分类教程——构建机器人（十） <https://zhuanlan.zhihu.com/p/367930669>`_
        * `Gazebo 11分类教程——构建机器人（十一） <https://zhuanlan.zhihu.com/p/367931359>`_
        * `Gazebo 11分类教程——构建机器人（十二） <https://zhuanlan.zhihu.com/p/367932310>`_
        * `Gazebo 11分类教程——构建机器人（十三） <https://zhuanlan.zhihu.com/p/367933557>`_
        * `Gazebo 11分类教程——构建机器人（十四） <https://zhuanlan.zhihu.com/p/367935450>`_
        * `Gazebo 11分类教程——构建机器人（十五） <https://zhuanlan.zhihu.com/p/368212737>`_
        * `Gazebo 11分类教程——构建仿真世界（一） <https://zhuanlan.zhihu.com/p/368388026>`_
        * `Gazebo 11分类教程——构建仿真世界（二） <https://zhuanlan.zhihu.com/p/368390485>`_
        * `Gazebo 11分类教程——构建仿真世界（三） <https://zhuanlan.zhihu.com/p/368711095>`_
        * `Gazebo 11分类教程——构建仿真世界（四） <https://zhuanlan.zhihu.com/p/368724669>`_
        * `Gazebo 11分类教程——构建仿真世界（五） <https://zhuanlan.zhihu.com/p/369219895>`_
        * `Gazebo 11分类教程——编写插件（一） <https://zhuanlan.zhihu.com/p/369220308>`_
        * `Gazebo 11分类教程——编写插件（二） <https://zhuanlan.zhihu.com/p/369220512>`_
        * `Gazebo 11分类教程——编写插件（三） <https://zhuanlan.zhihu.com/p/369220860>`_
        * `Gazebo 11分类教程——编写插件（四） <https://zhuanlan.zhihu.com/p/369521607>`_
        * `Gazebo 11分类教程——编写插件（五） <https://zhuanlan.zhihu.com/p/369521801>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（一） <https://zhuanlan.zhihu.com/p/369534239>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（二） <https://zhuanlan.zhihu.com/p/369534450>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（三） <https://zhuanlan.zhihu.com/p/369820757>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（四） <https://zhuanlan.zhihu.com/p/369876897>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（五） <https://zhuanlan.zhihu.com/p/370098254>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（六） <https://zhuanlan.zhihu.com/p/370541436>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（七） <https://zhuanlan.zhihu.com/p/370541476>`_
        * `Gazebo 11分类教程——Gazebo中自带的插件（八） <https://zhuanlan.zhihu.com/p/370541518>`_
        * `Gazebo 11分类教程——传感器（一） <https://zhuanlan.zhihu.com/p/371098556>`_
        * `Gazebo 11分类教程——传感器（二） <https://zhuanlan.zhihu.com/p/371099920>`_
        * `Gazebo 11分类教程——传感器（三） <https://zhuanlan.zhihu.com/p/371100550>`_
        * `Gazebo 11分类教程——传感器（四） <https://zhuanlan.zhihu.com/p/371409208>`_
        * `Gazebo 11分类教程——传感器（五） <https://zhuanlan.zhihu.com/p/371409733>`_
        * `Gazebo 11分类教程——传感器（六） <https://zhuanlan.zhihu.com/p/371410516>`_
        * `Gazebo 11分类教程——传感器（七） <https://zhuanlan.zhihu.com/p/371411564>`_
        * `Gazebo 11分类教程——工具与实用程序（一） <https://zhuanlan.zhihu.com/p/372310952>`_
        * `Gazebo 11分类教程——工具与实用程序（二） <https://zhuanlan.zhihu.com/p/372311645>`_
        * `Gazebo 11分类教程——工具与实用程序（三） <https://zhuanlan.zhihu.com/p/372312642>`_
        * `Gazebo 11分类教程——工具与实用程序（四） <https://zhuanlan.zhihu.com/p/372482558>`_
        * `Gazebo 11分类教程——工具与实用程序（五） <https://zhuanlan.zhihu.com/p/372482861>`_
        * `Gazebo 11分类教程——工具与实用程序（六） <https://zhuanlan.zhihu.com/p/372483338>`_
        * `Gazebo 11分类教程——使用数学库&amp;模型编辑器 <https://zhuanlan.zhihu.com/p/372484454>`_
        * `Gazebo 11分类教程——传输库（一） <https://zhuanlan.zhihu.com/p/372963932>`_
        * `Gazebo 11分类教程——传输库（二） <https://zhuanlan.zhihu.com/p/373544113>`_
        * `Gazebo 11分类教程——物理库Physics Library（一） <https://zhuanlan.zhihu.com/p/373544715>`_
        * `Gazebo 11分类教程——物理库Physics Library（二） <https://zhuanlan.zhihu.com/p/373545782>`_
        * `Gazebo 11分类教程——物理库Physics Library（三） <https://zhuanlan.zhihu.com/p/374384079>`_
        * `Gazebo 11分类教程——物理库Physics Library（四） <https://zhuanlan.zhihu.com/p/374384587>`_
        * `Gazebo 11分类教程——物理库Physics Library（五） <https://zhuanlan.zhihu.com/p/374385269>`_
        * `Gazebo 11分类教程——物理库Physics Library（六） <https://zhuanlan.zhihu.com/p/374825137>`_
        * `Gazebo 11分类教程——物理库Physics Library（七） <https://zhuanlan.zhihu.com/p/375022363>`_
        * `Gazebo 11分类教程——物理库Physics Library（八） <https://zhuanlan.zhihu.com/p/375023390>`_
        * `Gazebo 11分类教程——渲染库（一） <https://zhuanlan.zhihu.com/p/375402420>`_
        * `Gazebo 11分类教程——渲染库（二） <https://zhuanlan.zhihu.com/p/375403547>`_
        * `Gazebo 11分类教程——渲染库（三） <https://zhuanlan.zhihu.com/p/375404007>`_
        * `Gazebo 11分类教程——连接至ROS 2（一） <https://zhuanlan.zhihu.com/p/376034973>`_
        * `Gazebo 11分类教程——连接至ROS 2（二） <https://zhuanlan.zhihu.com/p/376035760>`_
        * `Gazebo 11分类教程——连接至ROS 2（三） <https://zhuanlan.zhihu.com/p/377001338>`_

    * Navigation 2系列教程
        * `（一）——Navigation 2概述 <https://zhuanlan.zhihu.com/p/384099348>`_
        * `（二）——开始使用Nav2 <https://zhuanlan.zhihu.com/p/384185319>`_
        * `（三）——构建和安装Nav2 <https://zhuanlan.zhihu.com/p/384186443>`_
        * `（四）——移动机器人导航概念 <https://zhuanlan.zhihu.com/p/384353397>`_
        * `（五）——机器人首次设置Nav2指南之一：设置TF <https://zhuanlan.zhihu.com/p/384353648>`_
        * `（五）——机器人首次设置Nav2指南之二：设置URDF <https://zhuanlan.zhihu.com/p/384353735>`_
        * `（五）——机器人首次设置Nav2指南之三：设置里程计（Odometry） <https://zhuanlan.zhihu.com/p/384354342>`_
        * `（六）——普通教程之一：使用ROS 2进行相机标定 <https://zhuanlan.zhihu.com/p/384890854>`_
        * `（六）——普通教程之二：在ROS 2/Nav2中获取错误回溯信息 <https://zhuanlan.zhihu.com/p/385012759>`_
        * `（六）——普通教程之三：使用Turtlebot3物理机器人进行导航 <https://zhuanlan.zhihu.com/p/385042614>`_
        * `（六）——普通教程之四：使用SLAM制图的同时进行导航 <https://zhuanlan.zhihu.com/p/386440766>`_
        * `（六）——普通教程之五：使用外部的STVL成本地图插件进行导航 <https://zhuanlan.zhihu.com/p/387778543>`_
        * `（六）——普通教程之六：动态物体跟随 <https://zhuanlan.zhihu.com/p/387791574>`_
        * `（六）——普通教程之七： 使用禁区进行导航 <https://zhuanlan.zhihu.com/p/388327604>`_
        * `（六）——普通教程之八：使用速度限制进行导航 <https://zhuanlan.zhihu.com/p/388327855>`_
        * `（七）——插件教程之一：编写新的Costmap2D插件 <https://zhuanlan.zhihu.com/p/388924908>`_
        * `（七）——插件教程之二：编写新的规划器（Planner）插件 <https://zhuanlan.zhihu.com/p/389125444>`_
        * `（七）——插件教程之三：编写新的控制器（Controller）插件 <https://zhuanlan.zhihu.com/p/389168892>`_
        * `（七）——插件教程之四：编写新的行为树（Behavior Tree）插件 <https://zhuanlan.zhihu.com/p/389458841>`_
        * `（七）——插件教程之五：编写新的恢复器（Recovery）插件 <https://zhuanlan.zhihu.com/p/389470354>`_
        * `（八）——配置指南之一：配置航点跟随者（Waypoint Follower） <https://zhuanlan.zhihu.com/p/389619634>`_
        * `（八）——配置指南之二：配置行为树导航仪（Behavior-Tree Navigator） <https://zhuanlan.zhihu.com/p/389805562>`_
        * `（八）——配置指南之三：配置行为树XML节点（Behavior Tree XML Nodes） <https://zhuanlan.zhihu.com/p/389946398>`_
        * `（八）——配置指南之四：配置Costmap 2D <https://zhuanlan.zhihu.com/p/390201366>`_
        * `（八）——配置指南之五：配置生命周期管理器（Lifecycle Manager） <https://zhuanlan.zhihu.com/p/390220304>`_
        * `（八）——配置指南之六：配置规划器服务器（Planner Server） <https://zhuanlan.zhihu.com/p/390229971>`_
        * `（八）——配置指南之七：配置NavFn规划器 <https://zhuanlan.zhihu.com/p/390288448>`_
        * `（八）——配置指南之八：配置Smac规划器 <https://zhuanlan.zhihu.com/p/390339668>`_
        * `（八）——配置指南之九：配置Theta*规划器（Theta Star Planner） <https://zhuanlan.zhihu.com/p/390481412>`_
        * `（八）——配置指南之十：配置控制器服务器（Controller Server） <https://zhuanlan.zhihu.com/p/390519137>`_
        * `（八）——配置指南之十一：配置DWB控制器（DWB Controller）  <https://zhuanlan.zhihu.com/p/390806060>`_
        * `（八）——配置指南之十二：配置地图服务器/保存器（Map Server/Saver） <https://zhuanlan.zhihu.com/p/390556416>`_
        * `（八）——配置指南之十三：配置AMCL <https://zhuanlan.zhihu.com/p/391111295>`_
        * `（八）——配置指南之十四：配置恢复器服务器（Recovery Server） <https://zhuanlan.zhihu.com/p/391113570>`_
        * `（八）——配置指南之十五：配置受管制纯追踪（Regulated Pure Pursuit）控制器 <https://zhuanlan.zhihu.com/p/391114807>`_
        * `（九）——行为树XMLs之一：概述 <https://zhuanlan.zhihu.com/p/391621166>`_
        * `（九）——行为树XMLs之二：导航至某个位姿（Navigate To Pose）行为树 <https://zhuanlan.zhihu.com/p/391621431>`_
        * `（九）——行为树XMLs之三：通过多个位姿导航（Navigate Through Poses）行为树 <https://zhuanlan.zhihu.com/p/391621754>`_
        * `（九）——行为树XMLs之四：跟随动态点（Follow Dynamic Point）行为树 <https://zhuanlan.zhihu.com/p/391967738>`_
        * `（十）——导航插件（Navigation Plugins） <https://zhuanlan.zhihu.com/p/392661491>`_
        * `（十一）——简单指挥官（Simple Commander）API <https://zhuanlan.zhihu.com/p/392662454>`_
