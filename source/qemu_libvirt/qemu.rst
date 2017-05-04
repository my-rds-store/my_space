qemu命令总结
===================


**spice端口**

.. code-block:: sh
        
        netstat -ntpl | grep qemu
        virsh domdisplay --type spice {Id or Name}


**创建镜像**

.. code-block:: sh

        qemu-img create -f qcow2 ubuntu-14.04.qcow2 20G
        qemu-img info ubuntu-14.04.qcow2


**镜像压缩**

.. code-block:: sh

        qemu-img convert -p -c -O qcow2 source.img destination.qcow2

**创建快照**

.. code-block:: sh

        qemu-img create -f qcow2 -b base.qcow2 snapshot.qcow2

**resize**

.. code-block:: sh

        qemu-img resize source.qcow2 +10G




