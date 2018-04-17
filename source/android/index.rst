##############
Android      
##############

************
学习资料    
************

* `Android官方培训课程中文版 <http://hukai.me/android-training-course-in-chinese/index.html>`_ 
* `ANDROID学习之路 <http://stormzhang.com/android/2014/07/07/learn-android-from-rookie/>`_

* `adbshell <http://adbshell.com/commands>`_
* `adb命令 <https://zmywly8866.github.io/2015/01/24/all-adb-command.html>`_

* `connect to android emulator from virtualbox <https://nftb.saturdaymp.com/connect-to-android-emulator-from-virtualbox/>`_
* `VirtualBox中安装Android-x86 <https://www.cnblogs.com/wynn0123/p/6288344.html>`_

remote-debugging-with-android-emulator
    * https://stackoverflow.com/questions/1754162/remote-debugging-with-android-emulator
    * http://delphi.org/2013/09/debugging-against-a-remote-android-emulator/

--------

**********
搭建环境  
**********


Android studio gradle 无法获取 pom文件
-------------------------------------

* 1. 改maven 为国内地址
    * https://blog.csdn.net/zengmingen/article/details/79877676
* 2. 取消国外代理,改为国内
    * `gradle 设置代理 <https://blog.csdn.net/cheng545/article/details/72868781>`_

Download
========

官方下载地址
    https://developer.android.com/studio/index.html

androiddevtools
    http://www.androiddevtools.cn/

google developers
    https://developers.google.cn/

api doc
    http://www.embeddedlinux.org.cn/androidapi/



required
--------

.. code:: sh

    $ sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6
    $ sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

gradle
------

    https://services.gradle.org/
    https://services.gradle.org/distributions/gradle-4.0-milestone-1-all.zip

.. image:: ./images/set_gradle.png
       :scale: 90%
       :alt: alternate text
       :align: center

https://jcenter.bintray.com/com/android/tools/build/


`Android studio 关闭 初次启动更新 <http://blog.csdn.net/wyl_1994/article/details/52353647>`_


Android SDK 在线更新镜像服务器资源
-----------------------------------

大连东软信息学院镜像服务器地址:
    http://mirrors.neusoft.edu.cn 端口：80

北京化工大学镜像服务器地址:
    IPv4: http://ubuntu.buct.edu.cn/ 端口：80
    IPv4: http://ubuntu.buct.cn/ 端口：80
    IPv6: http://ubuntu.buct6.edu.cn/ 端口：80

上海GDG镜像服务器地址:
    http://sdk.gdgshanghai.com 端口：8000
中国科学院开源协会镜像站地址:
    IPV4/IPV6: http://mirrors.opencas.cn 端口：80
    IPV4/IPV6: http://mirrors.opencas.org 端口：80
    IPV4/IPV6: http://mirrors.opencas.ac.cn 端口：80
    
.. image:: ./images/proxy.png
       :scale: 90%
       :alt: alternate text
       :align: center

.. code:: sh

    $HOME/.gradle/wrapper/dists/gradle-4.0-milestone-1-all/2rnr7rhi2zsmkxo9re7615fy6/gradle-4.0-milestone-1
    /home/jxm/.gradle/wrapper/dists/gradle-4.0-milestone-1-all/2rnr7rhi2zsmkxo9re7615fy6/gradle-4.0-milestone-1-all.zip



修改vim快捷键
-------------

File->Settings->Other Settings->Vim Emulation

.. image:: ./images/overrideMethod.png 
       :scale: 100%
       :alt: alternate text
       :align: center

Select Methods to Override/Implement



