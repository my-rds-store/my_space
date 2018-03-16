######
apache
######



显示目录
============



.. code-block::  cfg

    <Directory "/home/ftpdir">
	AllowOverride None
	# Allow open access:
	Require all granted
    </Directory>


显示全名
============

.. code-block::  cfg

    Options +Indexes
    <IfModule mod_autoindex.c>
      IndexOptions NameWidth=*
    </ifModule>





