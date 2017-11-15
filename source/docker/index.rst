Docker 学习
===================


安装docker  
------------

.. code-block:: bash

     $ sudo apt-get install -y docker.io


`Installation  <https://docs.docker.com/engine/installation/>`_

`Docker Commandlind <https://docs.docker.com/engine/reference/commandline/docker/>`_

镜像加速地址 
------------------

.. code-block:: bash

    $ sudo vim /etc/docker/daemon.json

::

  {
      "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]  
  }

  https://docker.mirrors.ustc.edu.cn     # 中科大
  https://hub-mirror.c.163.com           # 163
  https://4lmb1y64.mirror.aliyuncs.com


常用命令 
------------------


启动docker
^^^^^^^^^^^^^^^^^

    .. code-block:: bash
        
         # ubuntu
         $ sudo service docker start

         # centos
         $ sudo systemctl enable docker 
         $ sudo systemctl start  docker

镜像
^^^^^^
    .. code-block:: bash

        $ sudo docker images  # 列出本地镜像

        $ sudo docker commit -m "add start.sh" -a "add start.sh ..." e0dfc0f706ce jxm/my_space:v3  # 镜像commit

        $ sudo docker rmi training/sinatra  # 删除本地镜像

``本地镜像重命名``
""""""""""""""""""

    .. code-block:: bash

        $ sudo docker tag  oldname:tag newname:tag 
        $ sudo docker tag  image_id    newname:tag 
        
        $ sudo docker rmi oldname:tag

阿里云
^^^^^^^^^

https://dev.aliyun.com/search.html

``登陆``
"""""""""

配置信息: **$HOME/.dockercfg**

    .. code-block::  bash
        
        $ sudo docker login  -e sample.aliyun.com registry.aliyuncs.com

``搜索``
"""""""""""""""

    .. code-block:: bash

        $ sudo docker search centos

容器
^^^^^^^^

    .. code-block:: bash

       $ sudo docker create -i -t --name=apache  ubuntu:14.04  /bin/bash  #  创建容器

       $ sudo docker start apache  # 启动容器

       $ sudo docker attach apach  # 进入容器
       
       $ sudo docker rm  name/ID                # 删除一个容器
       $ sudo docker rm `sudo docker ps -a -q`  # 删除全部容器



``守护态运行``
""""""""""""""

    .. code-block:: bash

        $ sudo docker run -d -p 3080:80 --name=myspace_test  jxm/my_space:v3  /bin/bash -c " while true; do echo hello world; sleep 1; done"
 
        $ sudo docker run -d -p 3080:80 --name=myspace_test_v4  jxm/my_space:v4 /root/start.sh

        $ sudo docker run -d --restart=always -p 3080:80 --name=myspace_test_v4  jxm/my_space:v4 /root/start.sh  #开机自启动

        $ sudo docker run exec -it myspace_test_v4 /bin/bash

    .. code-block:: bash

        sudo docker logs -f       {CONTAINER ID}       # 日志
        sudo docker logs --follow {CONTAINER ID}
    

``容器重命名``
""""""""""""""""""

    .. code-block:: bash

        $ sudo docker rename  oldname    newname 
        $ sudo docker rename  image_id   newname 

``查询``
""""""""""""""
        
    .. code-block:: bash

        $ sudo docker ps      # 查看UP状态的容器
        $ sudo docker ps  -a  # 查看所有容器
        $ sudo docker ps  -as # 查看所有容器,显示容器大小


``导出导入``
""""""""""""""

    .. code-block:: bash

        $ sudo docker export {CONTAINER ID}  > ubuntu.tar # 导出容器
    
        $ cat ubuntu.tar | sudo docker import - test/ubuntu:v1.0  # 导入容器快照 

        # 通过指定 URL 或者某个目录来导入容器
        $ sudo docker import http://example.com/exampleimage.tgz example/imagerepo

    .. code-block:: bash

         $ sudo docker save -o nextcloud.tar nextcloud  # 导出镜像
         $ sudo docker load -i nextcloud.tar            # 导入镜像


使用外部网络
---------------
    
    查看端口

    .. code-block:: bash

        $ sudo docker port {CONTAINER ID}
        $ sudo docker port {CONTAINER ID}  80

数据卷
-------------

`数据卷容器 <http://wiki.jikexueyuan.com/project/docker-technology-and-combat/datacontainer.html>`_

``数据卷``
^^^^^^^^^^

    .. code-block:: bash

        $ sudo docker run -i -i --name=web -v /src/webapp:/opt/webapp  ubuntu:14.04

``查看数据卷``
^^^^^^^^^^^^^^^^^

    .. code-block:: bash
        
        $ sudo docker inspect {NAMES}


``数据卷容器``
^^^^^^^^^^^^^^^^

    .. code-block:: bash
        
        $ sudo docker run -d --volumes-from={NAME/ID} --name=my_space_build  alpine/my_space_build:v1

``权限``
---------------

.. code-block:: bash

    $ sudo docker run -d --privileged myimage

    #  参数privileged ，container内的root拥有真正的root权限。
    #  否则，container内的root只是外部的一个普通用户权限。
    #  privileged启动的容器，可以看到很多host上的设备，并且可以执行mount。
    #  甚至允许你在docker容器中启动docker容器。

    $ sudo docker run -d --cap-add SYS_NET_ADMIN myimage

    # 让容器拥有除了MKNOD之外的所有内核权限 
    $ sudo docker run --cap-add=ALL --cap-drop=MKNOD ...

Dockerfile
-----------

#. EXPOSE

    格式为 EXPOSE <port> [<port>...] 。
    告诉Docker服务端容器暴露的端口号



* `阿里云Docker <https://dev.aliyun.com/search.html>`_
* `把镜像推送到阿里云 <https://ninghao.net/video/3780>`_
* `Running GUI apps with Docker <http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/?utm_source=tuicool&utm_medium=referral>`_ 



Other
-----------

* `使用官方 docker registry 搭建私有镜像仓库及部署 web ui <http://blog.csdn.net/mideagroup/article/details/52052618>`_

* https://hub.docker.com/r/hyper/docker-registry-web
* https://github.com/kwk/docker-registry-frontend

