#############
Kubernetes   
#############

* `Kubernetes中文手册 <https://www.kubernetes.org.cn/docs>`_

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
* `119. 部署 k8s Cluster（下） <https://blog.csdn.net/cloudman6/article/details/79055050>`_
* `120. Kubernetes 架构（上） <https://blog.csdn.net/cloudman6/article/details/79070461>`_
* `121. Kubernetes 架构（下） <https://blog.csdn.net/cloudman6/article/details/79091574>`_
* `122. 通过例子理解 k8s 架构 <https://blog.csdn.net/cloudman6/article/details/79118086>`_
  

  

.. code-block:: sh


    kubeadm token list 

    # get --discovery-token-ca-cert-hash
    openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'





************
搭建
************

* `googlecontainer <https://hub.docker.com/u/googlecontainer/>`_

---------------------------------

* `install-kubeadm <https://kubernetes.io/docs/setup/independent/install-kubeadm/>`_

* `kubeadm安装kubernetes集群 <http://blog.51cto.com/lullaby/2150610>`_

* `通过docker hub 下载 <https://mritd.me/2016/10/29/set-up-kubernetes-cluster-by-kubeadm/>`_

------------

* `安装部署 Kubernetes 集群  <https://www.cnblogs.com/Leo_wl/p/8511902.html>`_
* `kubeadm安装kubernetes集群 <http://blog.51cto.com/lullaby/2150610>`_

* `使用Kubeadm快速搭建Kubernetes(docker) <https://blog.csdn.net/CSDN_duomaomao/article/details/73825839>`_
* `使用kubeadm安装Kubernetes v1.10以及常见问题解答 <https://www.kubernetes.org.cn/3805.html>`_

* `Kubernetes in Vagrant with kubeadm <https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63>`_

* `k8s学习笔记（一） <https://www.cnblogs.com/silvermagic/p/9110882.html>`_

测试
=======

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

******
FAQ   
******


问题:

.. code-block:: sh

    ########################3
    # Centos7
    ########################3

    #sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml
    $ sudo kubectl apply -f ./kube-flannel.yml
    unable to recognize "./kube-flannel.yml": Get http://localhost:8080/api?timeout=32s: dial tcp [::1]:8080: connect: connection refused
    unable to recognize "./kube-flannel.yml": Get http://localhost:8080/api?timeout=32s: dial tcp [::1]:8080: connect: connection refused
    unable to recognize "./kube-flannel.yml": Get http://localhost:8080/api?timeout=32s: dial tcp [::1]:8080: connect: connection refused
    unable to recognize "./kube-flannel.yml": Get http://localhost:8080/api?timeout=32s: dial tcp [::1]:8080: connect: connection refused
    unable to recognize "./kube-flannel.yml": Get http://localhost:8080/api?timeout=32s: dial tcp [::1]:8080: connect: connection refused
    The connection to the server localhost:8080 was refused - did you specify the right host or port

解决: 需要开启 api server 代理端口：

* https://www.oschina.net/question/574036_2271046
* `Kubernetes核心原理（一）之API Server <https://yq.aliyun.com/articles/149595>`_

.. code-block:: sh

    # 查看端口是否代理：
    $ curl localhost:8080/api

    # 开启端口代理：
    $ kubectl proxy --port=8080 &

-----------------------------------
