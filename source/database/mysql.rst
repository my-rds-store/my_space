Mysql
================



.. code-block:: bash

    $ sudo docker pull mariadb

    $ sudo docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:tag


`MySQL 5.1参考手册 <http://www.shouce.ren/api/mysql/5/#>`_
`MySQL 教程 <http://www.shouce.ren/api/view/a/6106>`_

``登陆``
------------------

.. code-block:: sh

    $ mysql -h localhost -u root -p


``数据库操作``
------------------

创建数据库
^^^^^^^^^^^
.. code:: 

    > create database 数据库名;


.. code-block:: sh

    # mysqladmin -u root -p create 数据库名;
    Enter password:******

查看数据库
^^^^^^^^^^^
.. code:: 

    > SHOW DATABASES;


选中数据库
^^^^^^^^^^^
.. code:: 

    > USE 数据库名;


查看数据库中的表
^^^^^^^^^^^^^^^^^^
.. code:: 

    > SHOW TABLES;


删除数据库
^^^^^^^^^^^^^^^^^^
.. code:: 

    > drop database 数据库名;

.. code-block::  sh

    [root@host]# mysqladmin -u root -p drop 数据库名;
    Enter password:******

``数据表操作``
------------------

创建表
^^^^^^^^^

.. code:: 

    > CREATE TABLE 表名(字段名1 字段类型,....字段名n 字段类型n);


.. code:: 

    > CREATE TABLE emp( 
            ename varchar(10), 
            hiredate date, 
            sal float(10,2), 
            deptno int(2) 
        );

.. code::

    USE account;

    CREATE TABLE book2(   
            id INT  NOT NULL  AUTO_INCREMENT,
            uname  varchar(30),    
            email  varchar(100),   
            passwd  varchar(30),   
            PRIMARY KEY ( id )
            );

.. code-block:: sh

    $ mysql -u root -p  -D account < create_table.sql ;



.. code-block:: sh

    MySQL> use account;  
    MySQL> source ./create_table.sql 
    MySQL>.\ ./create_table.sql 



查看表结构
^^^^^^^^^^^

.. code::

    > DESC 表名;

查看表的创建语句
^^^^^^^^^^^^^^^^^
.. code::

    > SHOW CREATE TABLE 表名 \G;

删除表
^^^^^^^^^
.. code::

    > DROP TABLE 表名;



指定表引擎和字符集
^^^^^^^^^^^^^^^^^^^^

在创建表最后，我们常用MyISAM或者InnoDB引擎。在指定引擎时，我们可以使用：

.. code::

    ENGINE=InnoDB

指定表默认字符集：

.. code::

    DEFAULT CHARSET=utf8

效果如下：

.. code::

    > CREATE TABLE emp ( 
        useraname varchar(10) DEFAULT NULL, 
        password date DEFAULT NULL, 
      )ENGINE=InnoDB DEFAULT CHARSET=utf8;


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

    mysql> source d:\wcnc_db.sql

