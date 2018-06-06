Mysql
================

.. code-block:: bash

    $ sudo docker pull mariadb

    $ docker run --name some-mariadb -p 8306:3306 -e MYSQL_ROOT_PASSWORD=rootroot -d mariadb:latest

    # For Sysvinit Systems
    $ sudo  service mysql start|stop|restart|reload|status
    # or
    $ sudo  /etc/init.d/mysql start|stop|restart|reload|status

    # For Systemd Systems #
    $ sudo systemctl start|stop|restart|reload|status  mariadb.service
    # or
    $ sudo systemctl start|stop|restart|reload|status  mysql.service
    # or
    $ sudo systemctl start|stop|restart|reload|status  mariadb
    # or
    $ sudo systemctl start|stop|restart|reload|status  mysql


select 查询，中文显示乱码
    .. code-block:: sql
    
         > set names utf8;

         > set names gbk;


`MySQL 5.1参考手册 <http://www.shouce.ren/api/mysql/5/#>`_
`MySQL 教程 <http://www.shouce.ren/api/view/a/6106>`_


``登陆``
------------------

.. code-block:: sh

    $ mysql -h localhost -u root -p

    $ mysql -h localhost -u root -p -P 8306  # 指定端口号


``数据库操作``
------------------

创建数据库
^^^^^^^^^^^

.. code-block:: sql

    -- CREATE DATABASE 数据库名;
    CREATE DATABASE db_name;


.. code-block:: bash

    # mysqladmin -u root -p create 数据库名;
    Enter password:******

查看数据库
^^^^^^^^^^^
.. code:: 

    > SHOW DATABASES;

选中数据库
^^^^^^^^^^^

.. code-block:: sql

    -- USE 数据库名;
    USE db_name;


查看数据库中的表
^^^^^^^^^^^^^^^^^^
.. code-block:: sql

    > SHOW TABLES;


删除数据库
^^^^^^^^^^^^^^^^^^
.. code-block::  sql

    -- drop database 数据库名;
    drop database db_name; 

.. code-block::  bash

    [root@host]# mysqladmin -u root -p drop 数据库名;
    Enter password:******

``数据表操作``
------------------

创建表
^^^^^^^^^

.. code-block::  sql

    -- CREATE TABLE 表名(字段名1 字段类型,....字段名n 字段类型n);
    CREATE TABLE table_name(column_1 data_type_1,....column_n data_type_n);


.. code-block::  sql

    > CREATE TABLE emp( 
            ename    VARCHAR(10), 
            hiredate DATE, 
            sal      FLOAT(10,2), 
            deptno   INT(2) 
        );

.. code::

    USE account;

    CREATE TABLE book2(   
            id INT  NOT NULL  AUTO_INCREMENT,
            uname   VARCHAR(30),    
            email   VARCHAR(100),   
            passwd  VARCHAR(30),   
            PRIMARY KEY ( id )
            );

.. code-block:: sh

    $ mysql -u root -p  -D account < create_table.sql ;

.. code-block:: sql

     USE ACCOUNT;  
     SOURCE ./create_table.sql 
     -- .\  ./create_table.sql 


查看表结构
^^^^^^^^^^^

.. code-block:: sql

    DESC table_name;

查看表的创建语句
^^^^^^^^^^^^^^^^^

.. code-block:: sql

    -- SHOW CREATE TABLE table_name \G;
    SHOW CREATE TABLE table_name;

删除表
^^^^^^^^^

.. code-block:: sql

    DROP TABLE table_name;


指定表引擎和字符集
^^^^^^^^^^^^^^^^^^^^

在创建表最后，我们常用MyISAM或者InnoDB引擎。在指定引擎时，我们可以使用：


.. code-block:: sql

    ENGINE=InnoDB

指定表默认字符集：

.. code::

    DEFAULT CHARSET=utf8

效果如下：

.. code-block:: sql

    CREATE TABLE emp ( 
        useraname varchar(10) DEFAULT NULL, 
        password date DEFAULT NULL, 
      )ENGINE=InnoDB DEFAULT CHARSET=utf8;


``导出表结构``
------------------

.. code-block:: bash

    $ mysqldump -uroot -prootroot databasefoo table1 table2 > foo.sql 
    $ mysqldump -uroot -prootroot sva_rec date_drv         > foo.sql 


``导入表结构``
------------------

.. code-block:: bash

    $ mysql -uroot databasefoo < foo.sql 


#. 导出整个数据库 

::

    mysqldump -u用户名 -p密码  数据库名 > 导出的文件名 

.. code-block:: bash

    $  mysqldump -uroot -pmysql sva_rec  > ./sva_rec.sql 

#. 导出一个表，包括表结构和数据 

    mysqldump -u用户名 -p 密码  数据库名 表名> 导出的文件名 

.. code-block:: bash

    $ mysqldump -uroot -pmysql sva_rec date_rec_drv> ./date_rec_drv.sql 

#. 导出一个数据库结构 

.. code-block:: bash

    $ mysqldump -uroot -pmysql -d sva_rec > ./sva_rec.sql 

#. 导出一个表，只有表结构 

    mysqldump -u用户名 -p 密码 -d数据库名  表名> 导出的文件名 

.. code-block:: bash

    $ mysqldump -uroot -pmysql -d sva_rec date_rec_drv> ./date_rec_drv.sql 

#. 导入数据库 source

.. code-block:: sql

     SOURCE ./wcnc_db.sql

#. 删除一条记录

.. code-block:: sql

    DELETE FROM table_name WHERE id=2;

数据库恢复
============

.. code-block:: sh

    $ sudo systemctl stop  mariadb.service
    # 替换 /val/lib/mysql 目录
    $ sudo cp -r /val/lib/mysql  /val/lib/mysql.bak
    $ sudo cp -r new_mysql  /val/lib/mysql
    $ sudo chown -R mysql:mysql /val/lib/mysql 

