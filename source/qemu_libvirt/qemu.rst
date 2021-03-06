qemu命令总结
===================

* https://medium.com/@calerogers/gpu-virtualization-with-kvm-qemu-63ca98a6a172

.. image:: ./Qemu-logo-small.png
   :scale: 60%
   :target: https://libvirt.org

---------

.. image:: ./apple-touch-icon.png
   :scale: 60%
   :target: https://www.qemu.org

---------

.. |LibvirtLink| image:: ./Qemu-logo-small.png
   :scale: 60%
   
.. _LibvirtLink: https://libvirt.org


* `Hooks for specific system management <https://libvirt.org/hooks.html>`_
* `Libvirt和QEMU Hook机制介绍 <http://www.just4coding.com/blog/2017/11/25/qemu-hook/>`_


kvmgt 
---------------

* `Igvtg-qemu <https://github.com/intel/Igvtg-qemu/tree/2016q4-2.3.0>`_
* `Igvtg-kernel <https://github.com/intel/Igvtg-kernel/blob/2016q4-4.3.0/iGVT-g_Setup_Guide.txt>`_

PCI 透传
----------------------

* `使用libvirt和qemu将pci pass through设备添加到虚拟机上 <https://www.chenyudong.com/archives/add-pci-pass-through-device-to-guest-vm-with-libvirt-and-qemu.html>`_
* `PCI PASSTHROUGH <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/virtualization/chap-virtualization-pci_passthrough>`_

.. code-block:: sh

    $ tail -f /var/log/syslog
    $ tail -f /var/log/libvirt/qemu/${domain}.log

.. code-block:: sh

    vim /etc/default/grub

add  " intel_iommu=on vfio_iommu_type1.allow_unsafe_interrupts=1"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

    GRUB_CMDLINE_LINUX="quiet splash loglevel=2 intel_iommu=igfx_off i915.hvm_boot_foreground=1 i915.enable_cmd_parser=0 i915.enable_hangcheck=0 loglvl=all guest_loglvl=all conring_size=4M noreboot intel_iommu=on vfio_iommu_type1.allow_unsafe_interrupts=1"

OR   

.. code-block:: sh

    #add  " intel_iommu=on vfio_iommu_type1.allow_unsafe_interrupts=1"
    $ vim /boot/grub/grub.cfg


.. code-block:: bash

    $ tee hostdev.xml <<-"EOF"
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <driver name='vfio'/>
      <source>
	    <address domain='0x0000' bus='0x00' slot='0x14' function='0x0'/>
      </source>
    </hostdev>
    EOF

    $ sudo virsh nodedev-dettach pci_0000_00_14_0
    $ sudo virsh nodedev-reattach pci_0000_00_14_0

    $ virsh attach-device --config ${domain} ./hostdev.xml
    $ virsh attach-device ${domain} ./hostdev.xml

    $ virsh detach-device ${domain} ./hostdev.xml

virsh 与 qemu-img
----------------------

* `Reference Manual for libvirt <https://libvirt.org/html/index.html>`_
*  https://avdv.github.io/libvirt/index.html
* `Snapshot XML format <https://avdv.github.io/libvirt/formatsnapshot.html>`_

* `libvirt.openAuth  <https://libvirt.org/docs/libvirt-appdev-guide-python/en-US/html/libvirt_application_development_guide_using_python-Connections.html>`_
* `Python libvirt.openAuth() Examples <https://www.programcreek.com/python/example/77115/libvirt.openAuth>`_
* `Libvirt Remote URIs <https://libvirt.org/docs/libvirt-appdev-guide-python/en-US/html/libvirt_application_development_guide_using_python-Connections-Remote_URIs.html>`_


* `Adding Storage Devices To Guests <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/sect-virtualization-virtualized_block_devices-adding_storage_devices_to_guests>`_

* https://www.thegeekstuff.com/2015/02/add-memory-cpu-disk-to-kvm-vm/

常用命令
-------------------

* `列出 CPU Models <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-kvm_guest_virtual_machine_compatibility-supported_cpu_models>`_

.. code-block:: sh

    $ cat /usr/share/libvirt/cpu_map.xml
    $ virsh cpu-models x86_64

.. code-block:: sh

    # virsh      
    #  https://wiki.libvirt.org/page/Failed_to_connect_to_the_hypervisor

    virsh --connect qemu+ssh://username@remove.host.com/system list
    virsh --connect qemu+ssh://root@192.168.8.204/system --all

    # spice端口
    netstat -ntpl | grep qemu
    virsh domdisplay --type spice {Id or Name}

    # 创建镜像
    qemu-img create -f qcow2 ubuntu-14.04.qcow2 20G
    qemu-img info ubuntu-14.04.qcow2

    # 镜像压缩
    qemu-img convert -p -c -O qcow2 source.img destination.qcow2

    # resize
    qemu-img resize source.qcow2 +10G

    # 创建外部快照
    qemu-img create -f qcow2 -b base.qcow2 snapshot.qcow2

    # 内部快照
    qemu-img snapshot -l    source.qcow2  # 查看
    qemu-img snapshot -c s1 source.qcow2  # 创建
    qemu-img snapshot -a s1 source.qcow2  # 还原

    # Committing Changes
    # https://dustymabe.com/2015/01/11/qemu-img-backing-files-a-poor-mans-snapshotrollback/
    # 
    $ sudo qemu-img info /guests/F21server.qcow2.snap
    image: /guests/F21server.qcow2.snap
    file format: qcow2
    virtual size: 20G (21474836480 bytes)
    disk size: 15M
    cluster_size: 65536
    backing file: /guests/F21server.img

    $ sudo qemu-img commit /guests/F21server.qcow2.snap
    Image committed.

    # 重改基础镜像
    $ qemu-img rebase [-u] -b /PATH/TO/base.qcow2 linux.qcow2 # -u 指 unsafe 模式,需检验,常用于基础镜像移动位置或重命名之后.


* `How to create Snapshot of Guest machine in Libvirt <http://www.geekpills.com/operating-system/linux/create-snapshot-guest-machine-libvirt>`_

.. code-block:: sh

    virsh snapshot-create-as --domain srv7 --name srv7-snapshot_1  # 创建快照
    virsh snapshot-list srv7                                       #  列出
    virsh snapshot-info srv7 srv7-snapshot_1                       #  info
    virsh snapshot-revert srv7 srv7-snapshot_1                     #  还原
    virsh snapshot-delete srv7 srv7-snapshot_1                     #  删除

串口
-----------

* `libvirt使用虚拟机的串口和控制台 <https://blog.csdn.net/isclouder/article/details/80774592>`_

磁盘
------

.. code-block:: sh

    # ubuntu 14 安装libguestfs
    $ sudo apt-get install libguestfs-tools
 
    # centos 7 安装libguestfs
    $ yum install libguestfs-winsupport  # ntfs
    $ yum install libguestfs-tools       # virt-format

.. code-block:: bash

    $ sudo qemu-img create -f qcow2 disk 20G
    $ sudo virt-format --filesystem ntfs -a disk.qcow2

    $ virt-ls -a  image.qcow2 /
    $ virt-copy-in test.txt -a  image.qcow2 /

CD
------

.. code-block:: xml

    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2' cache='unsafe'/>
      <source file='/data/disk/3601b740-5726-11e8-a561-5254007aa05f_D.qcow2'/>
      <target dev='vdb' bus='virtio'/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <source file='/cdata/isos/Windows-7-Ultimate-SP1-x64-677408.iso'/>
      <target dev='hda' bus='ide'/>
      <readonly/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <source file='/cdata/isos/virtio-win.iso'/>
      <target dev='hdb' bus='ide'/>
      <readonly/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <source file='/cdata/isos/mcos-tools.iso'/>
      <target dev='hdc' bus='ide'/>
      <readonly/>
    </disk>
    <disk type='file' device='floppy'>
      <driver name='qemu' type='raw'/>
      <source file='/cdata/isos/virtio-win.vfd'/>
      <target dev='fda' bus='fdc'/>
      <readonly/>
    </disk>


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
     
