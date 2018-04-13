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
    
    $ vagrant box add --name new_name {url}

    $ vagrant box repackage <name>          <provider> <version>
    $ vagrant box repackage ubuntu/trusty64 virtualbox 20180330.0.0


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


