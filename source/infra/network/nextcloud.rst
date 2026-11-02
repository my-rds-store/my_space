NextCloud
=========

.. note::

   JWT_SECRET 请替换为随机值，不要使用示例值。

.. code-block:: bash

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
    ## Passwd  ： change-me
    ############################
    sudo docker run -i -t -d -p 8090:80 -p 12433:433 --restart=always --name=onlyoffice\
    -e JWT_SECRET=change-me \
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

.. code-block:: bash

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


