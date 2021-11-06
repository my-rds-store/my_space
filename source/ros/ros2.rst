#############
ROS2
#############

* Galactic
    * `Tutorials <https://docs.ros.org/en/galactic/Tutorials.html>`_
    * `API <https://docs.ros2.org/galactic/api/rclcpp/index.html>`_

* Foxy 
    * `Tutorials  <https://docs.ros.org/en/foxy/Tutorials.html>`_
    * `API <https://docs.ros2.org/foxy/api/rclcpp/index.html>`_

* Dashing 
    * `Tutorials <https://docs.ros.org/en/dashing/Tutorials.html>`_
    * `API <https://docs.ros2.org/dashing/api/rclcpp/index.html>`_


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


