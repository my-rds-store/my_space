#######
Vagrant
#######

************
INSTALL
************

    ubuntu
        .. code-block:: sh
        
            # 1. install virtualbox

            # 2. install  vagrant
            $ sudo apt-get install vagrant  vagrant-lxc

.. code-block:: sh

    #  查看 插件
    $ vagrant plugin list

*************
Vagrant cmd  
*************

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

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.name = "vagrent_ubuntu14"
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.cpus = 4
  end



*******
Docs   
*******

* `vagrant docs <https://www.vagrantup.com/docs/index.html>`_
* `gitbook vagrant  <https://ninghao.gitbooks.io/vagrant/content/>`_
* `Ansible中文权威指南 <http://www.ansible.com.cn/index.html>`_
    
---

* `Convert a VirtualBox .ova VM into a Vagrant box <http://ebarnouflant.com/posts/7-convert-a-virtualbox-ova-vm-into-a-vagrant-box>`_

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


