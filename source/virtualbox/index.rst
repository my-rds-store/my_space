###########
Virtualbox 
###########


************************
Install Virtualbox_
************************

.. _Virtualbox: https://www.virtualbox.org/wiki/Linux_Downloads

* `install virtual from from command line <https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/>`_

        .. code-block:: sh

            sudo apt-add-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
            wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
            sudo apt-get update
            sudo apt-get install virtualbox-5.x dkms 

------------------

* `Manual <https://www.virtualbox.org/manual/>`_
    * `Chapter 8. VBoxManage <https://www.virtualbox.org/manual/ch08.html#vboxmanage-clonevm>`_

-------------

*  `VBoxManage命令详解 <https://www.cnblogs.com/pbss/articles/1987361.html>`_

--------------

* `Linux命令行下使用VBoxManage安装Linux系统  <https://www.linuxidc.com/Linux/2016-04/129728.htm>`_
* `VirtualBox命令行VBoxManage创建与管理虚拟机教程 <https://blog.csdn.net/shennongminblog/article/details/78858639>`_

------------




****************************************************
Virtualbox enable hardware virtualization technology
****************************************************

.. code-block:: sh

    $ vboxmanage list vms
    "bionic-server-cloudimg-amd64" {39f472bf-1d9c-4e6a-a11f-fbfccb2f3171}

    # 修改
    $ vboxmanage  modifyvm  bionic-server-cloudimg-amd64 --hwvirtex on
    $ vboxmanage  modifyvm  bionic-server-cloudimg-amd64 --hwvirtex on
    # 查看
    $ vboxmanage showvminfo bionic-server-cloudimg-amd64 |grep -i hardw 


****************************************************
VirtualBox修改现有虚拟磁盘大小
****************************************************

* `VirtualBox修改现有虚拟磁盘大小 <https://blog.csdn.net/weiguang1017/article/details/52252448>`_




