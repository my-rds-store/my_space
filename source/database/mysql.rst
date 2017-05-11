Mysql
================


``导出表结构``
------------------

.. code-block:: sh

    $ mysqldump -uroot -prootroot databasefoo table1 table2 > foo.sql 
    $ mysqldump -uroot -prootroot sva_rec date_drv         > foo.sql 


``导入表结构``
------------------

.. code-block:: sh

    $ mysql -uroot databasefoo < foo.sql 

 

#. 导出整个数据库 


　　mysqldump -u用户名 -p密码  数据库名 > 导出的文件名 

.. code-block:: sh

    $  mysqldump -uroot -pmysql sva_rec  > e:\sva_rec.sql 

#. 导出一个表，包括表结构和数据 

    mysqldump -u用户名 -p 密码  数据库名 表名> 导出的文件名 

.. code-block:: sh

    C:\Users\jack> mysqldump -uroot -pmysql sva_rec date_rec_drv> e:\date_rec_drv.sql 

#. 导出一个数据库结构 

.. code-block:: sh

    C:\Users\jack> mysqldump -uroot -pmysql -d sva_rec > e:\sva_rec.sql 

#. 导出一个表，只有表结构 

    mysqldump -u用户名 -p 密码 -d数据库名  表名> 导出的文件名 

.. code-block:: sh

    C:\Users\jack> mysqldump -uroot -pmysql -d sva_rec date_rec_drv> e:\date_rec_drv.sql 

#. 导入数据库 


　　常用source 命令 
　　进入mysql数据库控制台， 
　　如mysql -u root -p 
　　mysql>use 数据库 
　　然后使用source命令，后面参数为脚本文件(如这里用到的.sql) 

.. code-block:: sh

    mysql>source d:wcnc_db.sql

