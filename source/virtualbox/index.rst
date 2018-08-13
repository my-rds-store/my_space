###########
Virtualbox 
###########


************************
Install Virtualbox_
************************

.. _Virtualbox: https://www.virtualbox.org/wiki/Linux_Downloads


* `Install oracle virtualbox on ubuntu <https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/>`_

        .. code-block:: sh

            sudo apt-add-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
            wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
            sudo apt-get update
            sudo apt-get install virtualbox-5.x dkms 

            # load kernel model
            sudo /sbin/vboxconfig

* `Install oracle virtualbox on centos <https://wiki.centos.org/zh/HowTos/Virtualization/VirtualBox>`_

        .. code-block:: sh

            curl -o /etc/yum.repos.d/virtualbox.repo  http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
            yum makecache
            sudo yum --enablerepo=epel install -y dkms
            sudo yum install -y virtualbox-5.x 

            # load kernel model
            sudo /sbin/vboxconfig

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


***************************************************
Remote display (VRDP support)    
***************************************************
    
* `Chapter7. Remote display (VRDP support) <https://www.virtualbox.org/manual/ch07.html#vrde>`_

.. code-block:: sh

    VBoxManage modifyvm "VM name" --vrde on


****************************************************
Virtual networking
****************************************************


* `Chapter 6. Virtual networking <https://www.virtualbox.org/manual/ch06.html#nat-limitations>`_



.. code-block:: sh

    # The Network Address Translation (NAT) service works in a similar way to a home router, grouping the systems using it into a network and preventing systems outside of this network from directly accessing systems inside it, but letting systems inside communicate with each other and with systems outside using TCP and UDP over IPv4 and IPv6.

    # A NAT service is attached to an internal network. Virtual machines which are to make use of it should be attached to that internal network. The name of internal network is chosen when the NAT service is created and the internal network will be created if it does not already exist. An example command to create a NAT network is:

    VBoxManage natnetwork add --netname natnet1 --network "192.168.15.0/24" --enable

    # Here, "natnet1" is the name of the internal network to be used and "192.168.15.0/24" is the network address and mask of the NAT service interface. By default in this static configuration the gateway will be assigned the address 192.168.15.1 (the address following the interface address), though this is subject to change. To attach a DHCP server to the internal network, we modify the example as follows:

    VBoxManage natnetwork add --netname natnet1 --network "192.168.15.0/24" --enable --dhcp on

    # or to add a DHCP server to the network after creation:

    VBoxManage natnetwork modify --netname natnet1 --dhcp on

    # To disable it again, use:

    VBoxManage natnetwork modify --netname natnet1 --dhcp off

    # DHCP server provides list of registered nameservers, but doesn't map servers from 127/8 network.

    To start the NAT service, use the following command:

    VBoxManage natnetwork start --netname natnet1
    # If the network has a DHCP server attached then it will start together with the NAT network service.

    VBoxManage natnetwork stop --netname natnet1
    # stops the NAT network service, together with DHCP server if any.

    # To delete the NAT network service use:

    VBoxManage natnetwork remove --netname natnet1
    # This command does not remove the DHCP server if one is enabled on the internal network.

    # Port-forwarding is supported (using the --port-forward-4 switch for IPv4 and --port-forward-6 for IPv6):

    VBoxManage natnetwork modify --netname natnet1 --port-forward-4 "ssh:tcp:[]:1022:[192.168.15.5]:22"
    # This adds a port-forwarding rule from the host's TCP 1022 port to the port 22 on the guest with IP address 192.168.15.5. Host port, guest port and guest IP are mandatory. To delete the rule, use:

    VBoxManage natnetwork modify --netname natnet1 --port-forward-4 delete ssh
    # It's possible to bind NAT service to specified interface:

    VBoxManage setextradata global "NAT/win-nat-test-0/SourceIp4" 192.168.1.185
    # To see the list of registered NAT networks, use:

    VBoxManage list natnetworks





