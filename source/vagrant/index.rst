#######
Vagrant
#######

************
INSTALL_
************

.. _INSTALL: https://www.virtualbox.org/wiki/Linux_Downloads

* `install virtual from from command line <https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/>`_

        .. code-block:: sh

            sudo apt-add-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
            wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
            sudo apt-get update
            sudo apt-get install virtualbox-5.x dkms 

.. code-block:: sh

    #  查看 插件
    $ vagrant plugin list

    $ vagrant plugin install vagrant-share --plugin-clean-source --plugin-source https://gems.hashicorp.com

*************
Vagrant cmd  
*************

* `基于Virtual box 创建Vagrant box <http://ebarnouflant.com/posts/7-convert-a-virtualbox-ova-vm-into-a-vagrant-box>`_


.. code-block:: sh

    # virtualBox 导入虚拟机
    $ VBoxManage import ./UCS-Virtualbox-Demo-Image.ova --vsys 0 --eula accept                                                                                                                                   
    # 查看虚拟机 id
    $ vboxmanage lisb vms

    "UCS 4.1" {acef4c0a-35be-4640-a214-be135417f04d}
    You can now package that VM as a Vagrant box:

    # 基于虚拟机 id 生成 vagrant box
    $ vagrant package --base acef4c0a-35be-4640-a214-be135417f04d --output UCS.box   


.. code-block:: sh
    
    # 打包成box
    $ vagrant package  --output newBox.box          
    # 重新打包 box
    $ vagrant box repackage <name>          <provider> <version>
    $ vagrant box repackage ubuntu/trusty64 virtualbox 20180330.0.0

    $ vagrant box add        mybox http://someurl.com/mybox.box
    $ vagrant box add --name mybox http://someurl.com/mybox.box
    $ vagrant init mybox https://boxes.company.com/mybox.box

    # 基于VirtualBox虚拟机打包 box


**provison并不会每次都执行，只有在这三种情况下provision才会运行：**

* 首次执行vagrant up
* 执行vagrant provision
* 执行vagrant reload --provision

*************
Vagrantfile  
*************


.. code:: 
    
    config.vm.box = "mc_termian_test"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.

    config.vm.box_url = "../boxs/mc_termianl.box"
    config.ssh.username = 'root'
    config.ssh.password = 'rootroot'

    # 挂在目录
    config.vm.synced_folder "../data", "/vagrant_data"

    config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      vb.name = "vagrent_ubuntu14"
      # Customize the amount of memory on the VM:
      vb.memory = "1024"
      vb.cpus = 4
    end

    #  网络
    # config.vm.network "public_network", ip: "192.168.2.176" , bridge: "en0"



********************
about mc_termianl   
********************

.. code-block:: sh

    # Install VirtualBox Guest Additions
    wget -O /etc/apt/sources.list  http://mirrors.163.com/.help/sources.list.trusty
    apt-get install -y gcc make perl
    apt-get clean
    mount /dev/cdrom /media/cdrom
    cd /media/cdrom
    ./VBoxLinuxAdditions.run 

*******
Docs   
*******

* `vagrant docs <https://www.vagrantup.com/docs/index.html>`_
* `gitbook vagrant  <https://ninghao.gitbooks.io/vagrant/content/>`_
* `Ansible中文权威指南 <http://www.ansible.com.cn/index.html>`_
    

Vagrantbox.ex
=================

http://www.vagrantbox.es/

 * `vagrant box cloud <https://app.vagrantup.com/boxes/search>`_

 * `vagrantmanager <http://vagrantmanager.com/>`_


参考
====

* `vagrant with guis and windows <https://www.phparch.com/2015/01/vagrant-with-guis-and-windows/>`_
* `Vagrant 入门 <https://www.cnblogs.com/davenkin/p/vagrant-virtualbox.html>`_

* http://blog.csdn.net/hel12he/article/details/51069269

----

* https://code-maven.com/xforwarding-from-vagrant-box
* https://coderwall.com/p/ozhfva/run-graphical-programs-within-vagrantboxes


