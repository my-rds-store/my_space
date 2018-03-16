######
apache
######


配置
=====

显示目录
---------------



.. code-block::  cfg

    <Directory "/home/ftpdir">
	AllowOverride None
	# Allow open access:
	Require all granted
    </Directory>


设置字符编码
--------------

.. code-block::  cfg

    AddDefaultCharset UTF-8
    IndexOptions Charset=UTF-8

    #AddDefaultCharset GB2312
    #AddDefaultCharset GBK



显示全名_
----------

.. _显示全名: https://superuser.com/questions/1153765/how-to-show-the-whole-file-name-while-using-htaccess-to-list-files-in-a-directo

.. code-block::  cfg

    Options +Indexes
    <IfModule mod_autoindex.c>
      IndexOptions NameWidth=*
    </ifModule>

