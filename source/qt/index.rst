Qt
===========

.. toctree::
   :maxdepth: 1

   Qt5
   Qt6

Install
----------

* 下载在线安装器
    * `online_installers <https://download.qt.io/official_releases/online_installers/>`_
    * `online_installers-aliyun <https://mirrors.aliyun.com/qt/official_releases/online_installers/>`_ 


* aqtinstall

.. code:: bash

    aqt list-qt linux_arm64 android --arch  6.7.2
    aqt list-qt linux_arm64 desktop --arch  6.7.2
    aqt list-qt linux desktop --arch  6.7.2
    aqt list-qt mac desktop --arch  6.7.2
    aqt list-qt windows desktop --arch  6.7.2


    # 查询
    # https://aqtinstall.readthedocs.io/en/latest/getting_started.html#installing-qt

    aqt list-qt linux  desktop --long-modules 6.7.2 linux_gcc_64
    aqt list-qt linux_arm64 desktop --long-modules  6.7.2 linux_gcc_arm64

    QT_VERSION=6.7.2
    QT_PATH=$HOME/opt/Qt

    # 安装
    # https://aqtinstall.readthedocs.io/en/latest/cli.html#install-commands
    aqt install-qt -O "$QT_PATH"  linux desktop "$QT_VERSION" linux_gcc_64  -m all
    aqt install-qt -O "$QT_PATH"  linux_arm64 desktop "$QT_VERSION" linux_gcc_arm64  -m all

    aqt install-qt -O "$QT_PATH"  linux       desktop "$QT_VERSION" -m qt3d qt5compat  qtcharts  ...
    aqt install-qt -O "$QT_PATH"  linux_arm64 desktop "$QT_VERSION" -m qt3d qt5compat  qtcharts  ...


.. code::

    1.  新版本的安装器（4.0.1-1 后）支持 --mirror 命令行参数。在命令行中执行安装器，添加 

        --mirror https://mirrors.aliyun.com/qt 参数。

        例如 Windows 下执行当前目录的安装器的命令为 

        .\qt-unified-windows-x86-online.exe --mirror https://mirrors.aliyun.com/qt；

    2.  启动安装器后在设置中禁用默认源，添加新源 
        https://mirrors.aliyun.com/qt/online/qtsdkrepository/linux_x64/root/qt/ 
        （其他版本注意更改地址）。


* https://mirrors.ustc.edu.cn/help/qtproject.html



* `阿里图标 <https://www.iconfont.cn/?spm=a313x.7781069.1998910419.d4d0a486a>`_

* `图片下载网站  <https://www.flaticon.com/>`_



跨平台编译   
---------------

* `Linux下编译静态MinGW环境,编译windows平台Qt程序 <https://yjdwbj.github.io/2016/09/13/Linux%E4%B8%8B%E7%BC%96%E8%AF%91%E9%9D%99%E6%80%81MinGW%E7%8E%AF%E5%A2%83-%E7%BC%96%E8%AF%91windows%E5%B9%B3%E5%8F%B0Qt%E7%A8%8B%E5%BA%8F/>`_

* `MXE <http://mxe.cc/>`_   

打包    
---------------

* `linuxdeployqt <https://github.com/probonopd/linuxdeployqt/releases>`_
* windeployqt.exe -- Qt自带的工具

.. code:: bash

    # Linux 

    mkdir build;  cd build
    cmake ../
    make -j10

    APP_EXE=qt_client
    QML_DIR=${HOME}/extdisk/opt/Qt6/6.7.2/gcc_64/qml

    mkdir -p  AppRun
    cp $APP_EXE AppRun/
    cd  AppRun

    ${HOME}/Downloads/linuxdeployqt-continuous-x86_64.AppImage $APP_EXE -appimage -qmldir=${QML_DIR}
    # linuxdeployqt $APP_EXE -appimage -qmldir=${QML_DIR}

.. code:: 

    # Windows 

    cd build\Desktop_Qt_5_15_2_MinGW_32_bit-Release
    windeployqt.exe release --qmldir=D:\Qt\5.15.2\mingw81_32\qml

NextCloud   
-------------------

* `Git Client <https://github.com/nextcloud/client>`_
* `Build the Client <https://github.com/nextcloud/client_theming>`_


..
 Music 命运守护夜

.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=300 
    src="https://music.163.com/outchain/player?type=0&id=821701962&auto=1&height=430">
    </iframe>


