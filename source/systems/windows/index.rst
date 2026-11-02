Windows
========================


子系统
-------------

* `install <https://docs.microsoft.com/zh-cn/windows/wsl/install-manual>`_

更换默认子系统安装位置
^^^^^^^^^^^^^^^^^^^^^^^^^

* https://blog.csdn.net/qq_41233171/article/details/106268552
* https://github.com/DDoSolitary/LxRunOffline/releases

.. code-block:: bat

    LxRunOffline.exe list  % 查看我们的子系统版本

    % 记下我们的版本号，然后输入LxRunOffline move -n {version} -d {dir}

    在这里{version}填写我们刚才查到的版本号，{dir}改为我们需要移动到的目录

    % 例如我要把Ubuntu-18.04移动到我新建的文件夹D:\WinLinux下，那么我需要输入

    LxRunOffline move -n Ubuntu-18.04 -d D:\WinLinux  然后确认回车耐心等待移动结束就行


* `WslRegisterDistribution failed with error: 0x800701bc <https://blog.csdn.net/qq_18625805/article/details/109732122>`_


.. code::

    C:\Users\jiang\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs