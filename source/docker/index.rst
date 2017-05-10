
Docker 学习
===================

安装docker  
------------

.. code-block:: sh

     $ sudo apt-get install -y docker.io


docker 命令总结 
------------------


``启动docker``
^^^^^^^^^^^^^^^^^

    .. code-block:: sh

     $ sudo service docker start

``列出本地镜像``
^^^^^^^^^^^^^^^^^^^^

    .. code-block:: sh

        $ sudo docker images

``登录阿里云``
^^^^^^^^^^^^^^^^^^^^

    .. code-block::  sh
        
        $ sudo docker login  -e sample.aliyun.com registry.aliyuncs.com

``搜索``
^^^^^^^^^^^^^^^^^^^^

    .. code-block:: sh

        $ sudo docker search centos


``创建容器``
^^^^^^^^^^^^^^^^^^^^


    .. code-block:: sh

       $ sudo docker create -i -t --name=apache  ubuntu:14.04  /bin/bash


``启动容器``
^^^^^^^^^^^^^^^^^^^^

    .. code-block:: sh
         sudo docker start apache



``进入容器``
^^^^^^^^^^^^^^^^^^^^

    sudo docker attach apach



``删除镜像/容器``
^^^^^^^^^^^^^^^^^^^^

    .. code-block:: sh

        $ sudo docker rm  trusting_newton

    .. code-block:: sh

        $ sudo docker rmi training/sinatra


* `阿里云Docker <https://dev.aliyun.com/search.html>`_


* `把镜像推送到阿里云 <https://ninghao.net/video/3780>`_

