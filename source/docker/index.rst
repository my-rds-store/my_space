###############
Docker 笔记
###############

**********************
Docker Hub 与阿里云  
**********************

* `Docker Hub <https://hub.docker.com/explore/>`_
* `阿里云 <https://dev.aliyun.com/search.html>`_

.. code-block:: sh

    $ sudo docker login --username=jiang_xmin -e sample.aliyun.com registry.aliyuncs.com  # 登录阿里云

************
安装与配置
************

安装  
============

* `Instal Docker <https://docs.docker.com/engine/installation/>`_

.. code-block:: sh
  
  # 官方安装，速度慢
  curl -sSL https://get.docker.com/ | sh

* `安装docker(基于阿里源,速度快) <https://yq.aliyun.com/articles/110806?spm=5176.8351553.0.0.6a7c1991Uq3rD1>`_

.. code-block:: sh

    # fedora/centos 
    curl -sSL https://gitee.com/my_shell/linux_install_shell/raw/master/docker/docker_centos7.sh | bash

    # debian/ubuntu 
    curl -sSL https://gitee.com/my_shell/linux_install_shell/raw/master/docker/docker_ubuntu14.04.sh | bash

.. code-block:: sh

     # centos 6 安装老版本
     $ sudo apt-get install -y docker.io

配置 
========

.. code-block:: sh

    $ sudo mkdir -p /etc/docker

    # 1. 指定 镜像加速地址
    #    https://docker.mirrors.ustc.edu.cn     # 中科大
    #    https://hub-mirror.c.163.com           # 163
    #    https://4lmb1y64.mirror.aliyuncs.com

    # 2. 指定 Docker root dir 
    # 3. 指定 DNS 

    $ sudo tee -a /etc/docker/daemon.json <<-'EOF'
    {
        "registry-mirrors": ["https://4lmb1y64.mirror.aliyuncs.com"],
        "graph": "/home/docker/docker_image",
        "dns": ["180.76.76.76", "114.114.114.114"]
    }
    EOF
  
    # 重启
    $ sudo systemctl daemon-reload
    $ sudo systemctl restart docker

    $ sudo service  docker restart   # ubuntu

    # 查看
    $ docker info


KUBERNETES
------------------

    * https://www.kubernetes.org.cn/docs


***********
常用镜像   
***********

* `nimmis/alpine-apache <https://hub.docker.com/r/nimmis/alpine-apache/>`_


**********
常用命令
**********

`Docker Commandlind <https://docs.docker.com/engine/reference/commandline/docker/>`_

* `docker 资源限制   <https://docs.docker.com/config/containers/resource_constraints/#limit-a-containers-access-to-memory>`_

启动docker server
===================

    .. code-block:: sh
        
         #  启动docker server

         # ubuntu
         $ sudo service docker start

         # centos
         $ sudo systemctl enable docker 
         $ sudo systemctl start  docker


镜像
===================

    .. code-block:: sh

        $ sudo docker images      # 列出本地镜像
        $ sudo docker commit -m "add start.sh" -a "add start.sh ..." e0dfc0f706ce jxm/my_space:v3  # 镜像commit

        $ sudo docker rmi training/sinatra  # 删除本地镜像


        #  本地镜像重命名 
        $ sudo docker tag  oldname:tag newname:tag 
        $ sudo docker tag  image_id    newname:tag 
        
        $ sudo docker rmi oldname:tag   # 删除镜像


        $ sudo docker search centos  # 搜索

容器
============

    .. code-block:: sh

       $ sudo docker create -i -t --name=apache  ubuntu:14.04  /bin/bash  #  创建容器

       $ sudo docker start apache  # 启动容器
       $ sudo docker attach apach  # 进入容器
       
       $ sudo docker rm  name/ID                # 删除一个容器
       $ sudo docker rm `sudo docker ps -a -q`  # 删除全部容器



       # 守护态运行``
       $ sudo docker run -d -p 3080:80 --name=myspace_test_v3 jxm/my_space:v3  /bin/bash -c " while true; do echo hello world; sleep 1; done"
       $ sudo docker run -d -p 3080:80 --name=myspace_test_v4 jxm/my_space:v4  /root/start.sh

       $ sudo docker run -d --restart=always -p 3080:80 --name=myspace_test_v4  jxm/my_space:v4 /root/start.sh  #开机自启动

       $ sudo docker run exec -it myspace_test_v4 /bin/bash

       # 查看日志
       $ sudo docker logs -f       {CONTAINER ID}       # 日志
       $ sudo docker logs --follow {CONTAINER ID}

       #  容器重命名
       $ sudo docker rename  oldname    newname 
       $ sudo docker rename  image_id   newname 

       #``查询``
       $ sudo docker ps      # 查看UP状态的容器
       $ sudo docker ps  -a  # 查看所有容器
       $ sudo docker ps  -as # 查看所有容器,显示容器大小


       # 导出导入
       $ sudo docker export {CONTAINER ID}  > ubuntu.tar # 导出容器
    
       $ cat ubuntu.tar | sudo docker import - test/ubuntu:v1.0  # 导入容器快照 

       # 通过指定 URL 或者某个目录来导入容器
       $ sudo docker import http://example.com/exampleimage.tgz example/imagerepo

       $ sudo docker save -o nextcloud.tar nextcloud  # 导出镜像
       $ sudo docker load -i nextcloud.tar            # 导入镜像


使用外部网络
============


.. code-block:: sh

    # 查看端口
    $ sudo docker port {CONTAINER ID}
    $ sudo docker port {CONTAINER ID}  80


数据卷
============

`数据卷容器 <http://wiki.jikexueyuan.com/project/docker-technology-and-combat/datacontainer.html>`_


    .. code-block:: sh

        # 指定数据卷
        $ sudo docker run -i -i --name=web -v /src/webapp:/opt/webapp  ubuntu:14.04

        # 查看数据卷
        $ sudo docker inspect {NAMES}
        
        # 数据卷容器
        $ sudo docker run -d --volumes-from={NAME/ID} --name=my_space_build  alpine/my_space_build:v1

权限
============

.. code-block:: sh

    $ sudo docker run -d --privileged myimage

    #  参数privileged ，container内的root拥有真正的root权限。
    #  否则，container内的root只是外部的一个普通用户权限。
    #  privileged启动的容器，可以看到很多host上的设备，并且可以执行mount。
    #  甚至允许你在docker容器中启动docker容器。

    $ sudo docker run -d --cap-add SYS_NET_ADMIN myimage

    # 让容器拥有除了MKNOD之外的所有内核权限 
    $ sudo docker run --cap-add=ALL --cap-drop=MKNOD ...


**********
Dockerfile
**********

* https://code.aliyun.com/


.. code-block:: dockerfile

    # This is a comment
    FROM ubuntu:14.04

    MAINTAINER Jiangxumin <cjaingxumin@gmail.com>

    USER    root
    WORKDIR /root

    # ENV TEST  123

    COPY install.sh ./
    COPY run.sh ./

    RUN ./install.sh

    VOLUME ["/data1","/data2"]
    EXPOSE 22
    EXPOSE 80
    EXPOSE 443

    CMD ["/bin/bash","/root/run.sh"]

.. code-block:: sh

    $ sudo docker build . -t  ${image name}

.. code-block:: sh

    $ sudo docker run -d --restart=always -p 8901:8080 -v $HOEM/Video:/mediadrop/data/media --name=mediadrop acaranta/mediadrop

#. EXPOSE

    格式为 EXPOSE <port> [<port>...] 。
    告诉Docker服务端容器暴露的端口


* `阿里云Docker <https://dev.aliyun.com/search.html>`_
* `把镜像推送到阿里云 <https://ninghao.net/video/3780>`_
* `Running GUI apps with Docker <http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/?utm_source=tuicool&utm_medium=referral>`_ 


*****
Other
*****


* `Docker私有仓库搭建  <http://www.jianshu.com/p/00ac18fce367>`_

**http: server gave HTTP response to HTTPS client** , 解决,添加如下:

.. code-block:: json

    {
       "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"],
       "insecure-registries": ["192.168.8.204:5000"]
    }



* `使用官方 docker registry 搭建私有镜像仓库及部署 web ui <http://blog.csdn.net/mideagroup/article/details/52052618>`_

* https://hub.docker.com/r/hyper/docker-registry-web
* https://github.com/kwk/docker-registry-frontend

