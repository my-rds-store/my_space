############
下载工具研究
############

*********
Aria2    
*********


Doc     
========



* https://aria2.github.io/
* http://aria2.github.io/manual/en/html/aria2c.html#rpc-interface

examble:
    https://github.com/zhenlohuang/pyaria2/blob/master/pyaria2.py
    https://github.com/persepolisdm/persepolis/blob/master/persepolis/scripts/download.py


Examble
=======


.. code-block:: bash

    $ sudo  aria2c --allow-overwrite  -x5 -o abc.qcow2 http://192.168.100.109:8889/offline_imge.qcow2
    $ sudo  aria2c --continue=true  --allow-overwrite  -x5 -o abc.qcow2 http://192.168.100.109:8889/offline_imge.qcow2
    $ sudo  aria2c --enable-rpc=true -D --disable-ipv6 --check-certificate=false

    $ sudo aria2c   --enable-rpc \
                    --rpc-listen-all \
                    --continue  \
                    --max-concurrent-downloads=1 \
                    --max-connection-per-server=10 \
                    --rpc-max-request-size=1024M

Webui-aria2
===========

github
    https://github.com/ziahamza/webui-aria2

examble
    http://webui-aria2.ghostry.cn/

* http://dy.ghostry.cn/

ariAng
=========

doc
    http://ariang.mayswind.net/zh_Hans/

examble
    http://ariang.mayswind.net/latest/#!/downloading

