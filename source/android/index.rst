##############
Android      
##############

**************
下载地址      
**************

* `developer android <https://developer.android.google.cn/>`_

* `官方下载地址 <https://developer.android.com/studio/#command-tools>`_

* `ANDROID SDK下载地址列表 <http://pro.sr1.me/post/android-sdk-download-links>`_

* `androiddevtools <http://www.androiddevtools.cn/>`_

************
Gradle
************

    * `Gradle Install <https://gradle.org/install/>`_
    * `Download <https://services.gradle.org/distributions>`_
    * `Gradle 入门 <https://www.jianshu.com/p/001abe1d8e95>`_

************
APK 证书
************

* `给第三方apk进行系统签名的几种方式  <https://blog.csdn.net/luzhenrong45/article/details/47733053>`_

* `生成证书  <http://www.cnblogs.com/littleatp/p/5922362.html>`_

.. code-block:: sh

   keytool -genkeypair -alias serverkey -keypass 111111 -storepass 111111 \
        -dname "C=CN,ST=GD,L=SZ,O=vihoo,OU=dev,CN=vihoo.com" \
        -keyalg RSA -keysize 2048 -validity 3650 -keystore server.keystore 

.. code-block:: sh

    android{
        ...
        ...
       signingConfigs {
             myrelease {
                 storeFile file( System.getProperty("user.home") + "/.android/debug.keystore")
                 keyAlias "AndroidDebugKey"
                 storePassword  "android"
                 keyPassword  "android"
             }
         }
        buildTypes {
            release {
                signingConfig   signingConfigs.myrelease
                minifyEnabled false
                proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            }
            debug {
                signingConfig   signingConfigs.myrelease
                minifyEnabled false
                proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            }
        }
    }


***************
构建 打包环境  
***************

* `Intro to docker: Building Android App  <https://medium.com/@elye.project/intro-to-docker-building-android-app-cb7fb1b97602>`_
* `如何利用 Docker 环境加速 Android 应用的构建 <https://linux.cn/article-6865-1.html>`_

https://github.com/uber-archive/android-build-environment/blob/master/Dockerfile

* `手动编译安卓项目  <http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2016/0603/4331.html>`_
 
************
学习资料    
************

* `Android官方培训课程中文版 <http://hukai.me/android-training-course-in-chinese/index.html>`_
* `ANDROID学习之路 <http://stormzhang.com/android/2014/07/07/learn-android-from-rookie/>`_

sdkmanager   
============

*  `Installing-Android-SDK-Tools  <https://github.com/codepath/android_guides/wiki/Installing-Android-SDK-Tools>`_

.. code-block:: sh

    $ sdkmanager --list 
    $ sdkmanager 'extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-alpha8'

adbshell_   
==========

.. _adbshell: http://adbshell.com/commands

* `adbshell commands <http://adbshell.com/commands>`_
* `adb命令 <https://zmywly8866.github.io/2015/01/24/all-adb-command.html>`_

* `如何让Android设备能使用adb 调试 <http://blog.sina.com.cn/s/blog_540316260101fuho.html>`_
  
.. code-block:: sh

    # 打开Android Terminal Emulatror后，输入如下的内容：
    su  -root # 切换到root
    setprop service.adb.tcp.port 5555
    stop adbd
    start adbd
  
.. code-block:: sh

    $ adb shell pm list package                   # list all installed packages

    $ adb shell am start    com.example.demo/com.example.test.MainActivity  # start 
    $ adb shell am start -n com.example.demo/com.example.test.MainActivity  # restart


* `connect to android emulator from virtualbox <https://nftb.saturdaymp.com/connect-to-android-emulator-from-virtualbox/>`_

* `VirtualBox中安装Android-x86 <https://www.howtogeek.com/164570/how-to-install-android-in-virtualbox/>`_

remote-debugging-with-android-emulator
    * https://stackoverflow.com/questions/1754162/remote-debugging-with-android-emulator
    * http://delphi.org/2013/09/debugging-against-a-remote-android-emulator/

--------

* `第一行代码源代码 <https://github.com/guolindev/booksource>`_

.. code-block:: sh

    $ git clone https://github.com/guolindev/booksource


* `Android 约束布局（ConstraintLayout）详解 <https://blog.csdn.net/airsaid/article/details/79052011>`_



**********
搭建环境  
**********

Android studio gradle 无法获取 pom文件
================================================

* 1. `改maven 为国内地址 <https://blog.csdn.net/zengmingen/article/details/79877676>`_
* 2. 取消国外代理,改为国内 
* `gradle 设置代理 <https://blog.csdn.net/cheng545/article/details/72868781>`_

Download
========

官方下载地址
    https://developer.android.com/studio/index.html

google developers
    https://developers.google.cn/

api doc
    http://www.embeddedlinux.org.cn/androidapi/



required
--------

.. code:: sh

    $ sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6
    $ sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

.. image:: ./images/set_gradle.png
       :scale: 90%
       :alt: alternate text
       :align: center

https://jcenter.bintray.com/com/android/tools/build/


`Android studio 关闭 初次启动更新 <http://blog.csdn.net/wyl_1994/article/details/52353647>`_


Android SDK 在线更新镜像服务器资源
=====================================

中国科学院开源协会镜像站地址:
    * IPV4/IPV6: http://mirrors.opencas.cn 端口：80
    * IPV4/IPV6: http://mirrors.opencas.org 端口：80
    * IPV4/IPV6: http://mirrors.opencas.ac.cn 端口：80

大连东软信息学院镜像服务器地址:
    http://mirrors.neusoft.edu.cn 端口：80

北京化工大学镜像服务器地址:
    * IPv4: http://ubuntu.buct.edu.cn/ 端口：80
    * IPv4: http://ubuntu.buct.cn/ 端口：80
    * IPv6: http://ubuntu.buct6.edu.cn/ 端口：80

上海GDG镜像服务器地址:
    http://sdk.gdgshanghai.com 端口：8000
   
.. image:: ./images/proxy.png
       :scale: 90%
       :alt: alternate text
       :align: center

.. code:: sh

    $HOME/.gradle/wrapper/dists/gradle-4.0-milestone-1-all/2rnr7rhi2zsmkxo9re7615fy6/gradle-4.0-milestone-1
    /home/jxm/.gradle/wrapper/dists/gradle-4.0-milestone-1-all/2rnr7rhi2zsmkxo9re7615fy6/gradle-4.0-milestone-1-all.zip



修改vim快捷键
=================


File->Settings->Other Settings->Vim Emulation

.. image:: ./images/overrideMethod.png 
       :scale: 100%
       :alt: alternate text
       :align: center

Select Methods to Override/Implement

**************
常见问题      
**************

* `sudo执行命令时提示找不到该命令 <https://blog.csdn.net/Cryhelyxx/article/details/53384004>`_

* `adb USB 权限问题 <https://askubuntu.com/questions/908306/adb-no-permissions-on-ubuntu-17-04?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa>`_

.. code-block:: sh

    $ sudo adb kill-server
    $ sudo adb start-server

    #then connect your device turn Debugging on and type
    $ adb devices


------

https://github.com/YachaoLiu/spice-client-android
