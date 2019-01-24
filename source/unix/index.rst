###########
UNIX
###########


* AIX 查看系统位数 

.. code:: sh

    getconf HARDWARE_BITMODE  # 查看系统位数


    # 要确定您安装的 AIX 的级别，请运行以下命令： 
    oslevel 
    # 或 
    uname -vr 


    oslevel -r # 要确定发行版的维护包，请运行以下命令： 


    lslpp -L    # 要确定特定的 LPP 或文件集的级别 


    lslpp -L | pg # 要确定所有 LPP 或文件集的级别 


    # 要显示有关您系统上的硬件信息，请运行以下命令： 
    lscfg -vp | pg 
    prtconf|pg   # 可以较全的列出系统及硬件信息


* `FreeBSD Vagrant Box  <https://app.vagrantup.com/freebsd>`_



