######
Mac   
######


* `Mac 下制作U盘启动 <http://blog.jeswang.org/blog/2012/02/13/burn-iso-to-usb-on-mac/>`_
  
.. code-block:: sh

    $ diskutil list ＃显示当前所有得磁盘情况
    $ diskutil unmountDisk /dev/disk1 ＃卸载U盘上的所有磁盘
    $ dd if={ISO_IMAGE_HERE_} of=/dev/disk1 bs=1m #拷贝磁盘

    # 显示进度
    $ brew install pv
    $ pv -petr ubuntu-11.10-desktop-i386.iso | sudo dd of=/dev/disk2 bs=1m` 
