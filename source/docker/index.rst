###############
Docker
###############

**********************
Repositories
**********************

* `DaoCloud <https://dashboard.daocloud.io/>`_
* `Docker Hub <https://hub.docker.com/explore/>`_
* `Docker store [已收费]<https://store.docker.com>`_
* `QUAY <https://quay.io>`_
* `阿里云 [已收费]<https://dev.aliyun.com/search.html>`_

.. code-block:: sh

    $ sudo docker login --username=jiang_xmin -e sample.aliyun.com registry.aliyuncs.com  # 登录阿里云

************
安装与配置
************

安装与启动 
============

* `Instal Docker <https://docs.docker.com/engine/installation/>`_
.. code-block:: sh

    ##################################### 
    # 官方安装，速度慢
    ##################################### 
    curl -sSL https://get.docker.com/ | sh

    ##################################### 
    # 基于国内源,速度快
    ##################################### 

    # fedora/centos 
    curl -sSL https://gitee.com/my_shell/linux_install_shell/raw/master/docker/docker_centos7.sh | bash

    # debian/ubuntu 
    curl -sSL https://gitee.com/my_shell/linux_install_shell/raw/master/docker/docker_ubuntu14.04.sh | bash
    wget -qO - https://gitee.com/my_shell/linux_install_shell/raw/master/docker/docker_ubuntu14.04.sh | bash

    # centos 6 安装老版本,docker
    sudo yum install -y docker.io


.. code-block:: sh
    
     #  启动docker server

     # ubuntu
     sudo service docker start

     # centos
     sudo systemctl enable docker 
     sudo systemctl start  docker

配置 
========

.. code-block:: sh

    sudo mkdir -p /etc/docker

    # 1. 指定 镜像加速地址
    #    https://docker.mirrors.ustc.edu.cn     # 中科大
    #    https://hub-mirror.c.163.com           # 163
    #    https://4lmb1y64.mirror.aliyuncs.com

    # 2. 指定 Docker root dir 
    # 3. 指定 DNS 

    sudo tee -a /etc/docker/daemon.json <<-'EOF'
    {
        "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"],
        "graph": "/home/docker/docker_image",
        "dns": ["114.114.114.114","8.8.8.8"]
    }
    EOF
  
    # 重启
    sudo systemctl daemon-reload
    sudo systemctl restart docker

    sudo service  docker restart   # ubuntu

    # 查看
    docker info

去掉sudo权限 
================

.. code-block:: sh

    #可以添加docker组
    sudo groupadd docker

    #添加用户到docker组 
    sudo gpasswd -a $USER docker

    # docker服务重启 (CentOS7的場合)
    sudo systemctl restart docker

Nvidia Docker 
================

* `installing-on-ubuntu-and-debian <https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-on-ubuntu-and-debian>`_


.. code-block:: sh

    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
       && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
       && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list


    sudo apt-get update 

    sudo apt-get install -y nvidia-docker2

    sudo systemctl restart docker

******************
代理
******************

* `HTTP/HTTPS proxy <https://docs.docker.com/config/daemon/systemd/#httphttps-proxy>`_


.. code-block:: sh

    sudo mkdir -p /etc/systemd/system/docker.service.d

    sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf <<-'EOF'
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80/"
    EOF

    sudo tee /etc/systemd/system/docker.service.d/https-proxy.conf <<-'EOF'
    [Service]
    Environment="HTTPS_PROXY=https://proxy.example.com:443/"
    EOF

    # Flush changes:
    sudo systemctl daemon-reload

    # Restart Docker:
    sudo systemctl restart docker

    # Verify that the configuration has been loaded:
    systemctl show --property=Environment docker
    Environment=HTTP_PROXY=http://proxy.example.com:80/

    # Or, if you are behind an HTTPS proxy server:
    
    systemctl show --property=Environment docker
    Environment=HTTPS_PROXY=https://proxy.example.com:443/

    # test 
    sudo docker pull k8s.gcr.io/kube-apiserver-amd64:v1.11.0

***********
常用镜像   
***********

* `nimmis/alpine-apache <https://hub.docker.com/r/nimmis/alpine-apache/>`_

**********
常用命令
**********

`Docker Commandlind <https://docs.docker.com/engine/reference/commandline/docker/>`_

* `docker 资源限制   <https://docs.docker.com/config/containers/resource_constraints/#limit-a-containers-access-to-memory>`_


镜像
===================

.. code-block:: sh

    docker images --help

    sudo docker images      # 列出本地镜像

    sudo docker commit -m "do something" -a "do something ..." {CONTAINER ID} {REPOSITORY:TAG}  # 镜像commit
    sudo docker commit -m "add start.sh" -a "add start.sh ..." e0dfc0f706ce   jxm/my_space:v3  # 镜像commit

    sudo docker rmi {REPOSITORY:TAG}  # 删除本地镜像
    
    # 本地镜像重命名 
    sudo docker tag  {ORIGIN_REPOSITORY:TAG} {NEW_NAME:TAG} 
    sudo docker tag  {IMAGE_ID}              {NEW_NAME:TAG} 
    sudo docker rmi  {ORIGIN_REPOSITORY:TAG}   


    # 从docker hub 搜索镜像
    sudo docker search centos  

容器
============

容器-create/run/rm 
-----------------------

.. code-block:: sh

   sudo docker create --help
   sudo docker create -i -t --name=my_test  ubuntu:14.04  /bin/bash  #  创建容器

   docker run --help
   # 守护态运行``
   sudo docker run -d -p 3080:80 --name={CONTAINER_NAME}  {REPOSITORY:TAG}  /bin/bash -c " while true; do echo hello world; sleep 1; done"
   sudo docker run -d --restart=always -p 3080:80 --name={CONTAINER_NAME} {REPOSITORY:TAG}  /root/start.sh  #开机自启动

   # 启动一个容器
   docker start --help
   sudo docker start/stop {CONTAINER_NAME}  # 启动/停止容器

   docker --help
   sudo docker attach {CONTAINER_NAME}  # 进入容器

   docker rm --help
   sudo docker rm  {CONTAINER_NAME}/{CONTAINER_ID}  # 删除一个容器
   sudo docker rm `sudo docker ps -a -q`            # 删除全部容器


容器-exec
-----------------------

.. code-block:: sh

    docker exec  --help
    sudo docker exec -it {CONTAINER_NAME} /bin/bash


容器-root权限
-----------------

.. code-block:: sh

    sudo docker run -d --privileged {REPOSITORY:TAG} 

    #  参数privileged ，container内的root拥有真正的root权限。
    #  否则，container内的root只是外部的一个普通用户权限。
    #  privileged启动的容器，可以看到很多host上的设备，并且可以执行mount。
    #  甚至允许你在docker容器中启动docker容器。

    sudo docker run -d --cap-add SYS_NET_ADMIN {REPOSITORY:TAG} 

    # 让容器拥有除了MKNOD之外的所有内核权限 
    sudo docker run --cap-add=ALL --cap-drop=MKNOD ...

容器-logs
------------------

.. code-block:: sh

   # 查看日志
   docker logs --help       
   sudo docker logs -f       {CONTAINER ID}       # 日志
   sudo docker logs --follow {CONTAINER ID}

容器-ps
----------

.. code-block:: sh

   #``查询``
   docker ps  --help      
   sudo docker ps         # 显示UP状态的容器
   sudo docker ps  -a     # 显示所有容器
   sudo docker ps  -as    # 显示所有容器,显示容器大小

容器-导入导出
---------------

.. code-block:: sh


   # 导出导入
   docker export --help
   sudo docker export {CONTAINER ID}  > ubuntu.tar # 导出容器

   cat ubuntu.tar | sudo docker import - test/ubuntu:v1.0  # 导入容器快照 

   docker import --help
   # 通过指定 URL 或者某个目录来导入容器
   sudo docker import http://example.com/exampleimage.tgz example/imagerepo

   docker save  --help
   sudo docker save -o nextcloud.tar nextcloud  # 导出镜像
   sudo docker load -i nextcloud.tar            # 导入镜像


容器-reame
----------------

.. code-block:: sh

   #  容器重命名
   docker rename  --help 
   sudo docker rename {ORIGIN_NAME}  {NEW_NAME}
   sudo docker rename {CONTAINER ID} {NEW_NAME} 

容器-port
--------------

.. code-block:: sh

    # 查看端口
    docker port --help
    sudo docker port {CONTAINER ID}
    sudo docker port {CONTAINER ID}  80


容器-数据卷
-------------------

* `数据卷容器 <http://wiki.jikexueyuan.com/project/docker-technology-and-combat/datacontainer.html>`_


.. code-block:: sh

    # 指定数据卷
    sudo docker run -i -i --name=web -v /src/webapp:/opt/webapp  ubuntu:14.04

    # 查看数据卷
    sudo docker inspect {NAMES}
    
    # 数据卷容器
    sudo docker run -d --volumes-from={NAME/ID} --name=my_space_build  alpine/my_space_build:v1

********************
docker-compose
********************

* `Doc <https://docs.docker.com/compose/compose-file/compose-file-v3/>`_

.. code-block:: sh

    pip install docker-compose==1.24.0


.. code-block:: yaml

    # docker-compose.yml
    version: "3.0"
    services:
      autoware:
        privileged: true
        image: autoware/autoware:latest-melodic-cuda
        container_name: ros-test
        runtime: nvidia
        user: 'root'
        working_dir: /mnt
        #restart: always
        network_mode: "host"
        #ports:
        #  - "8080:80"
        volumes:
          - /tmp/.X11-unix:/tmp/.X11-unix:rw
          - /home/promote/work/proj:/mnt
        environment:
          - DISPLAY=:1
          #- USER_ID=1000
          #- QT_X11_NO_MITSHM=1
          - QT_LOGGING_RULES="*=false"
        hostname: 'HP-Laptop'
        extra_hosts:
          - "HP-Laptop:127.0.0.1"
        entrypoint: ["/bin/bash", "-c", "while true; do echo hello world; sleep 1; done"]

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


***************
Docker私有仓库
***************

* `harbor <https://github.com/goharbor/harbor>`_


* `harbor搭建与使用 待验证 <https://blog.csdn.net/qq_24095941/article/details/86063684>`_
      * https://www.cnblogs.com/qiuhom-1874/p/13061984.html


* `Docker私有仓库搭建  <http://www.jianshu.com/p/00ac18fce367>`_

**http: server gave HTTP response to HTTPS client** , 解决,添加如下:

.. code-block:: json

    {
       "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"],
       "insecure-registries": ["192.168.8.204:5000"]
    }



* `使用官方 docker registry 搭建私有镜像仓库及部署 web ui <http://blog.csdn.net/mideagroup/article/details/52052618>`_


*****
Other
*****

* https://hub.docker.com/r/hyper/docker-registry-web
* https://github.com/kwk/docker-registry-frontend


