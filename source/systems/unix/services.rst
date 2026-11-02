系统服务与定时任务
========================================

8. 定时任务
----------------------

.. code-block:: sh

    $ export EDITOR=vim
    $ crontab -e

    $ service cron status/start/stop/restart
    $ systemcltl  restart crond

::

    # 每天　23 点　1 分　执行
    # m h  dom mon dow   command
    1 23 * * *  /root/workspace_for_docker/mk_mcstudent_iso.sh 

.. image:: https://images2015.cnblogs.com/blog/1173412/201706/1173412-20170627141421461-845471341.png

* `使用crontab，让linux定时执行shell脚本 <https://www.cnblogs.com/wucaiyun1/p/6866730.html>`_
* `一个简单的linux下设置定时执行shell脚本的示例 <https://www.cnblogs.com/bcphp/p/7084967.html>`_

Linux平台下的service程序编写指南
------------------------------------

C
    https://blog.csdn.net/gobitan/article/details/5903342
python
    https://blog.csdn.net/philip502/article/details/13511625
    https://stackoverflow.com/questions/4705564/python-script-as-linux-service-daemon


Systemd  
-------------------

* `Systemd 入门教程 <https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html>`_
* `systemctl 命令完全指南 <https://www.linuxidc.com/Linux/2015-07/120833.htm>`_
* `REATING AND MODIFYING SYSTEMD UNIT FILES <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files>`_

.. code-block:: sh

    # Ubuntu 目录为 /lib/systemd/system/
    # Centos 目录为 /usr/lib/systemd/system/

    systemctl cat sshd.service

    # 修改后，reload
    systemctl daemon-reload

    systemctl reload *.service #重新加载服务配置文件 ?????????????????

    systemctl enable  massclouds-core
    systemctl disable massclouds-core

    systemctl start   massclouds-core
    systemctl stop    massclouds-core
    systemctl restart massclouds-core

    # list enabled ...
    systemctl list-unit-files | grep enabled

    # 查看日志
    journalctl -f -u massclouds-core


example 
---------------

.. code-block:: ini

    [Unit]
    Description=xinit
    #After=systemd-user-sessions.service
    [Service]
    #Environment=DISPLAY=:0.0
    Type=simple
    ExecStart=/usr/bin/startx  /usr/bin/openbox
    StandardOutput=syslog
    #KillMode=process
    [Install]
    WantedBy=multi-user.target
    #WantedBy=graphical.target

.. code-block:: ini

    [Unit]
    Description=massclouds-core
    [Service]
    Type=simple
    ExecStart=/opt/massclouds_core/bin/massclouds
    KillMode=process
    [Install]
    WantedBy=multi-user.target
    #WantedBy=graphical.target  # 图形用户

------

::

    [Unit]
    Description : 服务的简单描述
    Documentation ： 服务文档
    Before、After:定义启动顺序。Before=xxx.service,代表本服务在xxx.service启动之前启动。After=xxx.service,代表本服务在xxx.service之后启动。
    Requires：这个单元启动了，它需要的单元也会被启动；它需要的单元被停止了，这个单元也停止了。
    Wants：推荐使用。这个单元启动了，它需要的单元也会被启动；它需要的单元被停止了，对本单元没有影响。

::

    [Service]
    Type=simple（默认值）：systemd认为该服务将立即启动。服务进程不会fork。如果该服务要启动其他服务，不要使用此类型启动，除非该服务是socket激活型。
    Type=forking：systemd认为当该服务进程fork，且父进程退出后服务启动成功。对于常规的守护进程（daemon），除非你确定此启动方式无法满足需求，使用此类型启动即可。使用此启动类型应同时指定 PIDFile=，以便systemd能够跟踪服务的主进程。
    Type=oneshot：这一选项适用于只执行一项任务、随后立即退出的服务。可能需要同时设置 RemainAfterExit=yes 使得 systemd 在服务进程退出之后仍然认为服务处于激活状态。
    Type=notify：与 Type=simple 相同，但约定服务会在就绪后向 systemd 发送一个信号。这一通知的实现由 libsystemd-daemon.so 提供。
    Type=dbus：若以此方式启动，当指定的 BusName 出现在DBus系统总线上时，systemd认为服务就绪。
    Type=idle: systemd会等待所有任务(Jobs)处理完成后，才开始执行idle类型的单元。除此之外，其他行为和Type=simple 类似。
    PIDFile：pid文件路径
    ExecStart：指定启动单元的命令或者脚本，ExecStartPre和ExecStartPost节指定在ExecStart之前或者之后用户自定义执行的脚本。Type=oneshot允许指定多个希望顺序执行的用户自定义命令。
    ExecReload：指定单元停止时执行的命令或者脚本。
    ExecStop：指定单元停止时执行的命令或者脚本。
    PrivateTmp：True表示给服务分配独立的临时空间
    Restart：这个选项如果被允许，服务重启的时候进程会退出，会通过systemctl命令执行清除并重启的操作。
    RemainAfterExit：如果设置这个选择为真，服务会被认为是在激活状态，即使所以的进程已经退出，默认的值为假，这个选项只有在Type=oneshot时需要被配置。
    StandardOutput=console代表打印输出到系统日志文件，StandardOutput=tty代表打印输出到串口

::

    [Install]
    Alias：为单元提供一个空间分离的附加名字。
    RequiredBy：单元被允许运行需要的一系列依赖单元，RequiredBy列表从Require获得依赖信息。
    WantBy：单元被允许运行需要的弱依赖性单元，Wantby从Want列表获得依赖信息。
    Also：指出和单元一起安装或者被协助的单元。
    DefaultInstance：实例单元的限制，这个选项指定如果单元被允许运行默认的实例。


Service 
---------------

* `Ubuntu Service说明与使用方法 <http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html>`_


-----

* `chroot  <https://www.howtogeek.com/howto/linux/reset-your-ubuntu-password-easily-from-the-live-cd/>`_


.. code-block:: sh

    # Linux log日志占用
    #Linux使用df -h检查磁盘文件, 可以看到/run目录下有日志目录/run/log/journal, 占用了数G空间。

    du --max-depth=1 -h

    #在日志目录下有很多历史累积的日志。

    #Linux log日志清理
    #检查当前journal使用磁盘量

    journalctl --disk-usage

    # 清理方法可以采用按照日期清理，或者按照允许保留的容量清理，只保存2天的日志，最大500M
    journalctl --vacuum-time=2d
    journalctl --vacuum-size=500M

    #如果要手工删除日志文件，则在删除前需要先轮转一次journal日志
    # systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald.service


要启用日志限制持久化配置，可以修改 /etc/systemd/journald.conf

.. code::

    SystemMaxUse=16M
    ForwardToSyslog=no


然后重启

.. code:: sh

    systemctl restart systemd-journald.service

    # 检查journal是否运行正常以及日志文件是否完整无损坏
    journalctl --verify

