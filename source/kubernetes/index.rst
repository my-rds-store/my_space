#############
Kubernetes   
#############

KUBERNETES
------------------

    * https://www.kubernetes.org.cn/docs


***********************
每天5分钟玩转容器技术  
***********************


* `1. 写在最前面 <https://blog.csdn.net/CloudMan6/article/details/70054393>`_
* `2. 容器生态系统  <https://blog.csdn.net/cloudman6/article/details/70162855>`_
* `3. 容器生态系统 (续) <https://blog.csdn.net/cloudman6/article/details/70194931>`_  
* `4. 运行第一个容器 <https://blog.csdn.net/cloudman6/article/details/70227455>`_
* `5. 视频 <https://blog.csdn.net/cloudman6/article/details/70296388>`_
* `6. 容器 What, Why, How  <https://blog.csdn.net/cloudman6/article/details/70482298>`_
* `7. Docker 架构详解 <https://blog.csdn.net/cloudman6/article/details/70763952>`_
* `8. Docker 组件如何协作 <https://blog.csdn.net/cloudman6/article/details/70857585>`_
* `9. 最小的镜像 <https://blog.csdn.net/cloudman6/article/details/70992337>`_
* `10. base镜像 <https://blog.csdn.net/cloudman6/article/details/71105101>`_

-----

* `114. 学习 Kubernetes 的 Why 和 How  <https://blog.csdn.net/CloudMan6/article/details/78954441>`_
* `115. 五秒创建 k8s 集群 <https://blog.csdn.net/cloudman6/article/details/78973949>`_
* `116. k8s 核心功能 <https://blog.csdn.net/cloudman6/article/details/78997613>`_
* `117. k8s 重要概念  <https://blog.csdn.net/cloudman6/article/details/79014649>`_
* `118. 部署 k8s Cluster（上） <https://blog.csdn.net/cloudman6/article/details/79036876>`_


************
搭建
************


* `googlecontainer <https://hub.docker.com/u/googlecontainer/>`_

---------------------------------


* `install-kubeadm <https://kubernetes.io/docs/setup/independent/install-kubeadm/>`_

* `kubeadm安装kubernetes集群 <http://blog.51cto.com/lullaby/2150610>`_

------------

* `安装部署 Kubernetes 集群  <https://www.cnblogs.com/Leo_wl/p/8511902.html>`_
* `kubeadm安装kubernetes集群 <http://blog.51cto.com/lullaby/2150610>`_

* `使用Kubeadm快速搭建Kubernetes(docker) <https://blog.csdn.net/CSDN_duomaomao/article/details/73825839>`_
* `使用kubeadm安装Kubernetes v1.10以及常见问题解答 <https://www.kubernetes.org.cn/3805.html>`_

* `Kubernetes in Vagrant with kubeadm <https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63>`_

* `k8s学习笔记（一） <https://www.cnblogs.com/silvermagic/p/9110882.html>`_




测试
=====================

.. code-block:: yaml

    #################
    # busybox.yaml
    #################
    apiVersion: v1
    kind: Pod
    metadata:
      name: busybox
      namespace: default
    spec:
      containers:
      - image: busybox
	command:
	  - sleep
	  - "3600"
	imagePullPolicy: IfNotPresent
	name: busybox
      restartPolicy: Always


.. code-block:: sh

   sudo kubectl create -f ./busybox.yaml
   sudo kubectl get rc 
   sudo kubectl get pods 
   sudo kubectl describe pod mysql


