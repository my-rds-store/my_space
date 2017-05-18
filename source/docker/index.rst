Docker 学习
===================

安装docker  
------------

.. code-block:: sh

     $ sudo apt-get install -y docker.io


docker 命令总结 
------------------


启动docker
^^^^^^^^^^^^^^^^^

    .. code-block:: sh

         $ sudo service docker start

镜像
^^^^^^^^^^

``列出本地镜像``
""""""""""""""""""

    .. code-block:: sh

        $ sudo docker images


``创建镜像``
""""""""""""""""""

    .. code-block:: sh

        $ sudo docker commit -m "add start.sh" -a "add start.sh ..." e0dfc0f706ce jxm/my_space:v3

``删除本地镜像``
""""""""""""""""""

    .. code-block:: sh

        $ sudo docker rmi training/sinatra


阿里云
^^^^^^^^^

https://dev.aliyun.com/search.html

``登陆``
"""""""""

配置信息: **$HOME/.dockercfg**

    .. code-block::  sh
        
        $ sudo docker login  -e sample.aliyun.com registry.aliyuncs.com

``搜索``
""""""""""""""""""""

    .. code-block:: sh

        $ sudo docker search centos

容器
^^^^^^^^^^

``创建容器``
""""""""""""""

    .. code-block:: sh

       $ sudo docker create -i -t --name=apache  ubuntu:14.04  /bin/bash


``启动容器``
""""""""""""""

    .. code-block:: sh

        $ sudo docker start apache


``进入容器``
""""""""""""""

    .. code-block:: sh

        $ sudo docker attach apach


``守护态运行``
""""""""""""""

    .. code-block:: sh

        $ sudo docker run -d -p 3080:80 --name=myspace_test  jxm/my_space:v3  /bin/bash -c " while true; do echo hello world; sleep 1; done"
 
        $ sudo docker run -d -p 3080:80 --name=myspace_test_v4  jxm/my_space:v4 /root/start.sh

``守护态运行``
""""""""""""""

    .. code-block:: sh

        sudo docker logs -f  {CONTAINER ID}
        sudo docker logs --follow  {CONTAINER ID}


``导出导入``
""""""""""""""

    导出容器

    .. code-block:: sh

        $ sudo docker export {CONTAINER ID}  > ubuntu.tar

    导入容器快照
    
    .. code-block:: sh

        $ cat ubuntu.tar | sudo docker import - test/ubuntu:v1.0

    通过指定 URL 或者某个目录来导入，例如

    .. code-block:: sh

        $ sudo docker import http://example.com/exampleimage.tgz example/imagerepo




``删除容器``
""""""""""""""

    .. code-block:: sh

        $ sudo docker rm  name/ID
        $ sudo docker rm `sudo docker ps -a -q`  #  删除全部容器

使用外部网络
---------------
    
    查看端口

    .. code-block:: sh

        $ sudo docker port {CONTAINER ID}
        $ sudo docker port {CONTAINER ID}  80

数据管理
----------

``数据卷``


    .. code-block:: sh

        sudo docker run -i -i --name=web -v /src/webapp:/opt/webapp  ubuntu:14.04




* `阿里云Docker <https://dev.aliyun.com/search.html>`_
* `把镜像推送到阿里云 <https://ninghao.net/video/3780>`_
* `Running GUI apps with Docker <http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/?utm_source=tuicool&utm_medium=referral>`_ 

