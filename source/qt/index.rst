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

    pip install aqtinstall -i https://mirrors.aliyun.com/pypi/simple/

    aqt list-qt linux_arm64 android --arch  6.7.2
    aqt list-qt linux_arm64 desktop --arch  6.7.2
    aqt list-qt linux desktop --arch  6.7.2
    aqt list-qt mac desktop --arch  6.7.2
    aqt list-qt windows desktop --arch  6.7.2

    aqt list-tool linux       desktop
    aqt list-tool linux_arm64 desktop
    aqt list-tool linux       desktop tools_cmake --long
    aqt list-tool linux_arm64 desktop tools_cmake --long


    # 查询
    # https://aqtinstall.readthedocs.io/en/latest/getting_started.html#installing-qt

    aqt list-qt linux  desktop --long-modules 6.7.2 linux_gcc_64
    aqt list-qt linux_arm64 desktop --long-modules  6.7.2 linux_gcc_arm64

    QT_VERSION=6.7.2
    QT_PATH=$HOME/opt/Qt

    # 安装
    # https://aqtinstall.readthedocs.io/en/latest/cli.html#install-commands
    aqt install-qt -O "$QT_PATH"  linux        desktop "$QT_VERSION" linux_gcc_64  -m all

    aqt install-qt --base https://mirrors.aliyun.com/qt \
        -O "$QT_PATH"  linux        desktop "$QT_VERSION" linux_gcc_64  -m all

    aqt install-qt -O "$QT_PATH"  linux_arm64 desktop "$QT_VERSION" linux_gcc_arm64  -m all

    aqt install-qt -O "$QT_PATH"  linux       desktop "$QT_VERSION" -m qt3d qt5compat  qtcharts  ...
    aqt install-qt -O "$QT_PATH"  linux_arm64 desktop "$QT_VERSION" -m qt3d qt5compat  qtcharts  ...

    aqt install-tool -O "$QT_PATH" linux        desktop tools_cmake
    aqt install-tool -O "$QT_PATH" linux        desktop tools_qtcreator_gui
    aqt install-tool -O "$QT_PATH" linux_arm64  desktop tools_cmake

* https://gitee.com/qt_study/qt6-docker.git
      * https://hub.docker.com/r/stateoftheartio/qt6
      * https://github.com/state-of-the-art/qt6-docker


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


屏幕取色工具   
---------------

* Ubuntu

    .. code:: bash

        sudo apt install gpick

* Windows
    * `Plastiliq Pixel Picker <https://plastiliq-pixel-picker.software.informer.com/download/>`_


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

.. code:: bash

    # 1.
    docker rm -f nextcloud
    sudo rm -rf ${HOME}/extdisk/nextcloud
    docker run -d --restart=always --name nextcloud -p 8092:80  -v ${HOME}/extdisk/nextcloud:/var/www/html  nextcloud:30.0
    #docker run -d --restart=always --name nextcloud -p 8092:80  -v ${HOME}/extdisk/nextcloud:/var/www/html  nextcloud:26.0

    # 2.
    # 刷新登陆页面, 会创建config.php文件
    #   ${HOME}/extdisk/nextcloud/config/config.php 

    # 3.
    sudo vim ~/extdisk/nextcloud/config/config.php
    # 添加一行,代理地址,下载app  
    #  'proxy' => 'socks5://192.168.110.129:7897',

    # 4.
    # web 创建 管理员账号密码，


    # 5.
    ############################
    ## Passwd  ： my_jwt_secret
    ############################
    sudo docker run -i -t -d -p 8090:80 -p 12433:433 --restart=always --name=onlyoffice\
    -e JWT_SECRET=my_jwt_secret \
    onlyoffice/documentserver:8.2  

    ## https://helpcenter.onlyoffice.com/integration/gettingstarted-nextcloud.aspx#JWT_block
    sudo docker exec onlyoffice /var/www/onlyoffice/documentserver/npm/json -f /etc/onlyoffice/documentserver/local.json 'services.CoAuthoring.secret.session.string'

    # 6.
    # 安装 onlyoffice app, 并设置
    #
    #  https://www.jianshu.com/p/649763d38b85
    # 
    
    # 解押
    cd  /extdisk/nextcloud/apps
    tar xzvf ~/drawio-v3.0.3.tar.gz

    # 进入 Nextcloud 的“应用”页面，找到“未启用”的应用列表，手动启用 Draw.io 应用。

*  Nextcloud  Install App

.. code:: bash

    # Download  drawio fome  apps.nextcloud.com
    # https://apps.nextcloud.com/apps/drawio

    #  Version
    # nextcloud 30 -----> Draw.io 3.0.3


* `Git Client <https://github.com/nextcloud/client>`_
* `Build the Client <https://github.com/nextcloud/client_theming>`_


..
 Music 命运守护夜

.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=300 
    src="https://music.163.com/outchain/player?type=0&id=821701962&auto=1&height=430">
    </iframe>


