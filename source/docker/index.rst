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

<<<<<<< HEAD
``删除本地镜像``
^^^^^^^^^^^^^^^^^^^^
=======
``创建镜像``
""""""""""""""""""

    $ sudo docker commit -m "add start.sh" -a "add start.sh ..." e0dfc0f706ce jxm/my_space:v3

``删除本地镜像``
""""""""""""""""""
>>>>>>> 87dd10fba509c31f16f132e85facb7cee00605c3

    .. code-block:: sh

        $ sudo docker rmi training/sinatra


<<<<<<< HEAD


``登录阿里云``
^^^^^^^^^^^^^^^^^^^^
=======
阿里云
^^^^^^^^^

``登陆``
"""""""""

配置信息: **$HOME/.dockercfg**
>>>>>>> 87dd10fba509c31f16f132e85facb7cee00605c3

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
<<<<<<< HEAD
^^^^^^^^^^^^^^
=======
""""""""""""""
>>>>>>> 87dd10fba509c31f16f132e85facb7cee00605c3

    .. code-block:: sh

        $ sudo docker attach apach


<<<<<<< HEAD
``删除镜像/容器``
^^^^^^^^^^^^^^^^^^^
=======
``进入容器``
""""""""""""""
>>>>>>> 87dd10fba509c31f16f132e85facb7cee00605c3

    $ sudo docker run -d -p 3080:80 --name=myspace_test  jxm/my_space:v3  /bin/bash -c "start.sh; while true; do echo hello world; sleep 1; done"

``删除容器``
""""""""""""""

<<<<<<< HEAD
        $ sudo docker rm  `docker ps -a -q` # 删除所有镜像
=======
    .. code-block:: sh

        $ sudo docker rm  name/ID
        $ sudo docker rm `sudo docker ps -a -q`  #  删除全部容器

>>>>>>> 87dd10fba509c31f16f132e85facb7cee00605c3


* `阿里云Docker <https://dev.aliyun.com/search.html>`_
* `把镜像推送到阿里云 <https://ninghao.net/video/3780>`_
* `Running GUI apps with Docker <http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/?utm_source=tuicool&utm_medium=referral>`_ 

