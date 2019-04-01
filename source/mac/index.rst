######
Mac   
######


* `Homebrew <https://brew.sh/index_zh-cn>`_

.. code-block:: bash

      # 1. set proxy
      $ export ALL_PROXY=socks5://127.0.0.1:1080
      # or
      # sudo git config --global http.proxy  socks5://127.0.0.1:1080
      # sudo git config --global https.proxy socks5://127.0.0.1:1080

      # 2. install Homebrew
      $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

*  `Git命令自动补全(mac)  <https://www.jianshu.com/p/7130a5c11d42>`_

* `Mac 下制作U盘启动 <http://blog.jeswang.org/blog/2012/02/13/burn-iso-to-usb-on-mac/>`_
  
.. code-block:: sh

    $ diskutil list ＃显示当前所有得磁盘情况
    $ diskutil unmountDisk /dev/disk1 ＃卸载U盘上的所有磁盘
    $ dd if={ISO_IMAGE_HERE_} of=/dev/disk1 bs=1m #拷贝磁盘

    # 显示进度
    $ brew install pv
    $ pv -petr ubuntu-11.10-desktop-i386.iso | sudo dd of=/dev/disk2 bs=1m` 
    
    # For Ubuntu
    $ suod apt-get install pv
    $ sudo tee /usr/local/bin/pvdd <<-'EOF'
    pv -petr $1 | sudo dd of=$2 bs=4096
    EOF
    $ sudo chmod a+x /usr/local/bin/pvdd


    # or 
    $ sudo dd if=ubuntu.iso of=/dev/sdb  bs=4M 
    $ watch  -n 5 "sudo pkill -USR1 ^dd$"

.. code-block:: sh

    $ open -a appname args...



* `Mounty for NTFS <http://enjoygineering.com/mounty/>`_
  
  .. code-block:: sh
    
    $ brew cask install mounty
  

* 安装串口驱动 CH341, 调试助手CoolTerm
    * https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver
    * http://freeware.the-meiers.org/


