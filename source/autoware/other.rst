Other
=======

GPS
-------

gpsd
``````

gpsd是一个GPS的守护进程，用以侦听来自GPS接收器的位置信息，并将这些位置信息转换成一种简化的格式。这样就可以使用其他程序对这些数据进行分析并制作图表等。该软件包中有一个客户端，用以显示当前可见GPS卫星（如果有的话）的位置和速度。它也可以使用差分全球定位系统/ IP协议。

.. code-block:: sh

    sudo apt-get install gpsd gpsd-clients

 
* `Python gpsd bindings <https://www.perrygeo.com/python-gpsd-bindings.html>`_

----

* `How to use Android phone as GPS sensor in Linux <https://miloserdov.org/?p=3762>`_

  .. code-block:: sh
    
    systemctl stop    gpsd
    systemctl disable gpsd
    sudo shutdown -r now   # 需要关机重启，启动 启动 gpad -N .... 会报错。


    sudo apt-get install adb

    ###########
    cgps
    gpsmon

* `Warwalking With Linux and Android <https://pentasticweb.wordpress.com/2016/05/27/warwalking-with-linux-and-android/>`_
    * https://www.jillybunch.com/sharegps/nmea-usb-linux.html


gpsfake
``````````

* 使用gpsfake模拟GPS数据

    .. code:: 

        1. 将假的gps数据存到文件中，命名为test.log.

               nc localhost 20175  >> test.log
               或者
               curl <phone ip>:port >> test.log

        2. ls /dev/pts,查看现在有什么设备。我的有三个，分别是0，1，ptmx。

        3. gpsfake -c 0.2 test.log  #  0.2秒 发送一条数据

        4. ls /dev/pts再次查看。这时候有四个了，分别是0,1,2,ptmx.

        5. cat /dev/pts/2. 就可以看到假的gps数据了。

        6. gpsd -F -D3 -N /dev/pts/2

        7 cgps 或者 gpsmon


    * `gpsd_client-Tutorials <http://wiki.ros.org/gpsd_client/Tutorials/Getting%20Started%20with%20gpsd_client>`_

    .. code-block:: sh 

        # 8. 
        rosrun gpsd_client gpsd_client _host:=localhost _port:=2947

        #9. 
        rostopic echo /fix
        
 `nmea_navsat_driver <https://wiki.ros.org/nmea_navsat_driver>`_
    * `run nmea_serial_driver <https://autoware.readthedocs.io/en/feature-documentation_rtd/DevelopersGuide/PackagesAPI/sensing/scripts.html>`_

    .. code-block:: sh 

       gpsfake -c 0.2 test.log  #  0.2秒 发送一条数据

       rosrun nmea_navsat_driver nmea_serial_driver _port:=/dev/pts/7 _baud:=4800

       rostopic list
       rostopic echo /fix
       rostopic echo /vel 
       rostopic echo /time_reference



Jetson Tx2 
-------------------

刷机 sdkmanager_1.1.0-6343
     jetpack 4.3  

* `arm64架构安装vscode——tx2安装vscode  <https://packagecloud.io/headmelted/codebuilds>`_

* `tx2 ubuntu18安装中文输入法，并解决无候选框的问题 <https://blog.csdn.net/xunchou/article/details/93754697>`_

---------------

* `Stop Chromium asking for keyring unlock <https://voltaicforge.com/games/chromium-gnome-keyring/>`_

.. code-block:: bash

    chromium --password-store=basic 

Jetson AGX Xavier
-------------------

刷机 sdkmanager_1.1.0-6343
     jetpack 4.3  


.. raw:: html
   :file: ./jetson_nvpmodel.html


.. code-block:: sh

    tegrastats

    sudo nvpmodel --query
    sudo nvpmodel -q --verbose

    sudo nvpmodel -p --verbose
    sudo nvpmodel -m 0  # 0 - MAXN ; 
                        # 1 - MODE_10W ;  默认
                        # 2 - MODE_15W ; 
                        # 3 - MODE_30W_ALL ; 
                        # 4 - MODE_30W_6CORE ; 
                        # 5 - MODE_30W_4CORE ; 
                        # 6 - MODE_30W_2CORE ; 


    sudo jetson_clocks --show

    echo 255 > target_pwm
    sudo cp -vf target_pwm /sys/devices/pwm-fan/target_pwm  # 风扇开到最大

----

* QT5

.. code-block:: sh

    sudo apt-get install qt5-default qtcreator -y
    sudo  apt isntall libqt5charts5 libqt5charts5-dev

----

* ubuntu sudo 免密码 

.. code-block:: sh

    sudo tee /etc/sudoers.d/nopasswd4sudo <<- 'EOF'
    nvidia ALL=(ALL) NOPASSWD : ALL  
    EOF

    ########################################

    sudo cat <<EOF > /tmp/nopasswd4sudo
    ${USER} ALL=(ALL) NOPASSWD : ALL
    EOF
    sudo chown root:root /tmp/nopasswd4sudo
    sudo mv /tmp/nopasswd4sudo  /etc/sudoers.d/nopasswd4sudo





----

* `NVIDIA Xavier CAN <https://blog.csdn.net/weifengdq/article/details/103093111#JetsonAGX_Xavier_CAN_17>`_

* `can_xavier <https://github.com/hmxf/can_xavier>`_

----

* `Enabling CAN on Nvidia Jetson Xavier <https://medium.com/@ramin.nabati/enabling-can-on-nvidia-jetson-xavier-developer-kit-aaaa3c4d99c9>`_

.. code-block:: sh

    # 开机自启动
    sudo tee -a /etc/rc.local <<- 'EOF'
    #!/bin/bash
    bash /enable_CAN.sh &
    exit 0
    EOF

    sudo chmod a+x /etc/rc.local 


.. code-block:: sh

    ######################
    # enable_CAN.sh
    ######################
    
    sudo modprobe can
    sudo modprobe can_raw
    sudo modprobe mttcan

    #############################
    # 用devmem修改寄存器
    #############################
    sudo busybox devmem 0x0c303000 32 0x0000C400
    sudo busybox devmem 0x0c303008 32 0x0000C458
    sudo busybox devmem 0x0c303010 32 0x0000C400
    sudo busybox devmem 0x0c303018 32 0x0000C458

    # # 检查寄存器
    # sudo busybox devmem 0x0c303000	# 0x0000C055
    # sudo busybox devmem 0x0c303008	# 0x0000C055
    # sudo busybox devmem 0x0c303010	# 0x0000C059
    # sudo busybox devmem 0x0c303018	# 0x0000C059

    # 配置标准CAN  500k
    sudo ip link set can0 type can bitrate 500000
    sudo ip link set can1 type can bitrate 500000

    # 配置为仲裁段500k, 数据段2M的的CANFD:
    #sudo ip link set can0 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on
    #sudo ip link set can1 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on

    # 设置本地回环
    #sudo ip link set can0 type can bitrate 500000 loopback on
    #sudo ip link set can1 type can bitrate 500000 loopback on


    #sudo ip link set down can0
    #sudo ip link set down can1

    sudo ip link set up can0
    sudo ip link set up can1

    # 
    cansend can0 "601#b110ff"
    cansend can1 "601#b110ff"


    #sudo nvpmodel -m 0

    sudo echo 255 > target_pwm
    sudo cp -vf target_pwm /sys/devices/pwm-fan/target_pwm  # 风扇开到最大

    # 禁用串行控制台
    #sudo systemctl stop nvgetty
    #sudo systemctl disable nvgetty
    #udevadm trigger  # 串口 /dev/ttyTHS0

---------

* Jetson TX2——CAN口的使用 `<https://blog.csdn.net/xuezhunzhen9743/article/details/81877757>`_

.. code-block:: sh

    modprobe can        // 插入 can 总线子系统
    modprobe can-raw    // 插入can 协议模块
    modprobe can-bcm
    modprobe can-gw  
    modprobe can-dev
    modprobe mttcan      //真正的can口支持

---------

* `NVIDIA Xavier UART <https://blog.csdn.net/weifengdq/article/details/103071182>`_
* `jetson-nano-uart <https://www.jetsonhacks.com/2019/10/10/jetson-nano-uart/>`_

.. code-block:: sh

    # 禁用串行控制台 ttyTHS*
    sudo systemctl stop nvgetty
    sudo systemctl disable nvgetty
    udevadm trigger  # 串口 /dev/ttyTHS0

    # sudo usermod -a -G dialout $USER
    ## sudo chmod a+wrx /dev/ttyTHS0

------------------




* `nvida agx vnc 屏幕共享 <https://medium.com/@bharathsudharsan023/jetson-nano-remote-vnc-access-d1e71c82492b>`_

**1**

.. code-block:: sh

    sudo vim /usr/share/glib-2.0/schemas/org.gnome.Vino.gschema.xml
 
.. code-block:: xml

   <!-- and go ahead and add the following key into the XML file. -->

    <key name='enabled' type='b'>
       <summary>Enable remote access to the desktop</summary>
       <description>
       If true, allows remote access to the desktop via the RFB
       protocol. Users on remote machines may then connect to the
       desktop using a VNC viewer.
       </description>
       <default>false</default>
    </key>

.. code-block:: sh

     # 更新
    # Then compile the Gnome schemas with the glib-compile-schemas command. 

    sudo glib-compile-schemas /usr/share/glib-2.0/schemas

    # 关闭 encryption of the VNC
    #  或者使用图形界面配置工具 dconf editor 'sudo apt-get install dconf-editor'

    gsettings set org.gnome.Vino require-encryption false
    gsettings set org.gnome.Vino prompt-enabled false


**2**

 
    打开 `startup applications` .
    
    添加 command `/usr/lib/vino/vino-server`. 

    然后，重启系统

.. image:: img/startup_applications.png


**3**

.. code-block:: sh

    vncviewer 192.168.2.105:5900




惠普暗影精灵5 Plus
-------------------

惠普暗影精灵5 Plus 装　ubuntu 18.04 踩到的坑.

* 结合这两篇Blog , 解决ubuntu 18.04 安装问题

    * http://keyblog.cn/article-139.html
    * https://blog.csdn.net/xiaxinkai/article/details/103739698

`ACPI Error: No handler or method for GPE` => kernel 5.5 rc1 已经修正了这个问题。
kernel  >= 5.5 的 Ubutnu  应该不存在这个问题

::

    安装步骤 刻录 Ubuntu 18.04 U盘启动

    装系统-> 选择 UEFI 启动
        当看到“Try Ubuntu", “Install Ubuntu”, “…” 这个黑色界面的时候按"e"，然后可以看到一段英文，把段落中的"quiet splash"修改成"nomodeset"，修改完按F10重启。（重要：不这样操作可能会卡住，无法启动安装器）
        安装器若启动不起来，多尝试几次．

    安装过程，联网更新软件，并且勾选　第三方库安装．

    ===========

    安装完毕,重启
    在ubuntu选项上按e，进入启动命令编辑, 把段落中的"linux"打头的一行，找到quiet splash替换为text acpi=off，然后按F10启动。


    进入桌面，更改为　国内源，然后 软件更新．

    打开software updater，选择additional drivers，点击NVIDIA driver 435，点击Apply Changes。


    安装完驱动，不要重启，打开终端，安装vim，然后sudo vim /etc/default/grub，修改一下两行：

    GRUB_CMDLINE_LINUX_DEFAULT="text"
    GRUB_CMDLINE_LINUX="pci=nommconf"


*  `没有声音问题 <https://www.linuxuprising.com/2018/06/fix-no-sound-dummy-output-issue-in.html>`_

.. code-block:: sh

    echo "options snd-hda-intel model=auto" | sudo tee -a /etc/modprobe.d/alsa-base.conf
    echo "options snd-hda-intel dmic_detect=0" | sudo tee -a /etc/modprobe.d/alsa-base.conf
    echo "blacklist snd_soc_skl" | sudo tee -a /etc/modprobe.d/blacklist.conf
    shutdown -r now




usb无线wifi
-------------------

* (AC1750) Edimax ew-7833uac on 18.04

* `Need rtl8814au driver for kernel 5.3 on Ubuntu 19.10 <https://askubuntu.com/questions/1185952/need-rtl8814au-driver-for-kernel-5-3-on-ubuntu-19-10>`_

.. code-block:: sh

    sudo apt install git dkms
    git clone https://github.com/aircrack-ng/rtl8812au.git
    cd rtl8812au
    sudo ./dkms-install.sh
