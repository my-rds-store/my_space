ROS 2 Galactic / Foxy 旧内容
============================

.. warning::

   Galactic、Foxy 已停止维护，以下内容仅作历史记录。

Docker 镜像
-----------

* Galactic
    * `Galactic Tutorials <https://docs.ros.org/en/galactic/Tutorials.html>`_
    * `Galactic API <https://docs.ros2.org/galactic/api/rclcpp/index.html>`_

    .. code-block:: bash

        docker pull osrf/ros:galactic-desktop

    * doTransform
        * cpp
            * `tf2::doTransform <https://docs.ros2.org/galactic/api/tf2/namespacetf2.html#a622f40738a6bae9f13f8495f93613a4b>`_
            * `tier4_autoware_utils::transformPose <https://github.com/autowarefoundation/autoware.universe/blob/333044b455ade3c702e5560ae398cf28b15aabeb/common/tier4_autoware_utils/include/tier4_autoware_utils/geometry/geometry.hpp#L520>`_

        * python
            * https://answers.ros.org/question/222306/transform-a-pose-to-another-frame-with-tf2-in-python/
            * `do_transform_pose_stamped <https://github.com/ros2/geometry2/blob/1186ee1e1be1dfe3691f31ba7f13662b1f1e1b91/tf2_geometry_msgs/src/tf2_geometry_msgs/tf2_geometry_msgs.py#L363>`_
            * https://github.com/ros2/geometry2/blob/1186ee1e1be1dfe3691f31ba7f13662b1f1e1b91/tf2_geometry_msgs/test/test_tf2_geometry_msgs.py#L152

* Foxy
    * `Foxy Tutorials <https://docs.ros.org/en/foxy/Tutorials.html>`_
    * `Foxy API <https://docs.ros2.org/foxy/api/rclcpp/index.html>`_

    .. code-block:: bash

        docker pull osrf/ros:foxy-desktop
