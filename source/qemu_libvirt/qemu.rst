qemu命令总结
===================

.. image:: ./Qemu-logo-small.png
   :scale: 60%
   
virsh 与 qemu-img
----------------------

#. **spice端口**

        .. code-block:: sh
                
           netstat -ntpl | grep qemu
           virsh domdisplay --type spice {Id or Name}


#. **创建镜像**

        .. code-block:: sh

            qemu-img create -f qcow2 ubuntu-14.04.qcow2 20G
            qemu-img info ubuntu-14.04.qcow2


#. **镜像压缩**

        .. code-block:: sh

            qemu-img convert -p -c -O qcow2 source.img destination.qcow2

#. **创建快照**

        .. code-block:: sh

            qemu-img create -f qcow2 -b base.qcow2 snapshot.qcow2

#. **resize**

        .. code-block:: sh

            qemu-img resize source.qcow2 +10G


磁盘
------

.. code-block:: bash

    # ubuntu 14
    $ sudo apt-get install libguestfs-tools
 
    # centos 7
    $ yum install libguestfs-winsupport  # ntfs
    $ yum install libguestfs-tools       # virt-format

.. code-block:: bash

    $ sudo qemu-img create -f qcow2 disk 20G
    $ sudo virt-format --filesystem ntfs -a disk.qcow2



声卡
------

#. 查询支持的声卡

        .. code-block:: sh

            [localhost ~] $ sudo /usr/libexec/qemu-kvm --soundhw ?
            Valid sound card names (comma separated):
            ac97        Intel 82801AA AC97 Audio
            hda         Intel HD Audio
            pcspk       PC speaker

            -soundhw all will enable all of the above

2 增加声卡

        .. code-block:: sh

            [localhost ~] $ sudo /usr/libexec/qemu-kvm --soundhw all

`Creating Guests with PXE <https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Virtualization_Host_Configuration_and_Guest_Installation_Guide/sect-Virtualization_Host_Configuration_and_Guest_Installation_Guide-Guest_Installation-Installing_guests_with_PXE.html>`_


`Red Hat Enterprise Linux 6 Virtualization Host Configuration and Guest Installation Guide <https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Virtualization_Host_Configuration_and_Guest_Installation_Guide/index.html>`_



.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=295 src="https://music.163.com/outchain/player?type=0&id=728498061&auto=1&height=430"></iframe>
     
