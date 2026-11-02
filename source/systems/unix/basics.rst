文件、压缩与后台运行
========================================

split分割文件
-------------

https://blog.csdn.net/whu_zhangmin/article/details/45870077

.. code:: sh

    $ split -b 4000M -d -a 1 cm-11.tar.gz cm-11.tar.gz.

    # 使用split命令，-b 4000M 表示设置每个分割包的大小，单位还是可以k
    #  -d "参数指定生成的分割包后缀为数字的形式
    # -a x来设定序列的长度(默认值是2)，这里设定序列的长度为1

    # 执行命令后，生成压缩包如下：
    -rw-r--r--  1 root     root      4194304000 May 20 14:00 cm-11.tar.gz.0
    -rw-r--r--  1 root     root      4194304000 May 20 14:02 cm-11.tar.gz.1
    -rw-r--r--  1 root     root      4194304000 May 20 14:03 cm-11.tar.gz.2
    -rw-r--r--  1 root     root      4194304000 May 20 14:05 cm-11.tar.gz.3
    -rw-r--r--  1 root     root      4194304000 May 20 14:06 cm-11.tar.gz.4
    -rw-r--r--  1 root     root      4194304000 May 20 14:08 cm-11.tar.gz.5
    -rw-r--r--  1 root     root      4194304000 May 20 14:09 cm-11.tar.gz.6
    -rw-r--r--  1 root     root      2256379886 May 20 14:10 cm-11.tar.gz.7

    # 合并文件
    $ cat cm-11.tar.gz.* | tar -zxv

7zip
-------

* `7-zip-examples <https://www.dotnetperls.com/7-zip-examples>`_

.. code-block:: sh

  $ 7za a -t7z w7_64_5200u_comp.qcow2.7z w7_64_5200u_comp.qcow2 -mx9


tar 打包
---------------

.. code-block:: sh

    $ tar czvf test.tar.gz *         # 压缩当前文件夹下非隐藏文件的文件
    $ tar czvf ../abc.tgz  .[!.]* *  # 压缩当前文件夹下所有文件,排除两个隐藏文件夹"."和“..”

    $ tar -tf  name.tgz  # 查看压缩包内容


nohup
----------------------------

.. code-block:: sh

    nohup /root/runoob.sh > /dev/null 2>&1 &
    nohup /root/runoob.sh > runoob.log 2>&1 &





