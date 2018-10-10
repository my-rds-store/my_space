#########
Mysql
#########

* `推荐几本学习MySQL的好书 <https://www.cnblogs.com/prettyisshit/p/5841055.html>`_
    * `MySQL必知必会 高清晰中文书签版PDF+源码 <https://linux.linuxidc.com/index.php?folder=MjAxNsTq18rBzy801MIvNcjVL015U1FMsdjWqrHYu+EguN/H5c761tDOxMrpx6mw5lBERivUtMLr>`_

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
         
         set names utf8;
         set names gbk;


`MySQL 5.1参考手册 <http://www.shouce.ren/api/mysql/5/#>`_
`MySQL 教程 <http://www.shouce.ren/api/view/a/6106>`_


登陆
============

.. code-block:: sh

    $ mysql -h localhost -u root -p

    $ mysql -h localhost -u root -p -P 8306  # 指定端口号


数据库操作
============


.. code-block:: sh

    #  创建数据库
    mysqladmin -u root -p create 数据库名;
    Enter password:******

.. code-block:: sql

    /* 创建数据库 */
    CREATE DATABASE db_name;   

    SHOW DATABASES;  -- 查看数据库
    USE  db_name;    --  选中数据库
    SHOW TABLES;     -- 查看数据库中的表
    DROP DATABASE db_name;   -- 删除数据库

.. code-block::  bash

    [root@host]# mysqladmin -u root -p drop 数据库名;
    Enter password:******

数据表操作
==============

.. code-block::  sql

    /* 创建表 */

    -- CREATE TABLE 表名(字段名1 字段类型,....字段名n 字段类型n);
    CREATE TABLE table_name(column_1 data_type_1,....column_n data_type_n);

    CREATE TABLE emp( 
            ename    VARCHAR(10), 
            hiredate DATE, 
            sal      FLOAT(10,2), 
            deptno   INT(2) 
        );

    
    
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


.. code-block:: sql

    DESC table_name;   -- 查看表结构


    /* 查看表的创建语句 */
    -- SHOW CREATE TABLE table_name \G;
    SHOW CREATE TABLE table_name;


    DROP TABLE table_name;  -- 删除表 


指定表引擎和字符集
--------------------

在创建表最后，我们常用MyISAM或者InnoDB引擎。在指定引擎时，我们可以使用：


.. code-block:: sql

    ENGINE=InnoDB

指定表默认字符集：

.. code-block:: sql

    /*指定表默认字符集*/
    DEFAULT CHARSET=utf8

    CREATE TABLE emp ( 
        useraname varchar(10) DEFAULT NULL, 
        password date DEFAULT NULL, 
      )ENGINE=InnoDB DEFAULT CHARSET=utf8;


表结构 导入/导出
------------------

.. code-block:: sh

    # 导入
    mysqldump -uroot -prootroot databasefoo table1 table2 > foo.sql 
    mysqldump -uroot -prootroot sva_rec date_drv         > foo.sql 

.. code-block:: sh

    # 导出
    mysql -uroot databasefoo < foo.sql 


.. code-block:: sh

    # 导出整个数据库 
    # mysqldump -u用户名 -p密码  数据库名 > 导出的文件名 
    mysqldump -uroot -prootroot  db_name  > ./db_name.sql 

    #导出一个表，包括表结构和数据 
    # mysqldump -u用户名 -p 密码  数据库名 表名> 导出的文件名 
    mysqldump -uroot -prootroot db_name db_name> ./db_name.sql 


    #导出一个数据库结构 
    mysqldump -uroot -prootroot -d db_name > ./db_name.sql 

    # 导出一个表，只有表结构 
    # mysqldump -u用户名 -p 密码 -d数据库名  表名> 导出的文件名 
    mysqldump -uroot -prootroot -d db_name db_name> ./db_name.sql 

.. code-block:: sql

     /*导入数据库 source*/
     SOURCE ./wcnc_db.sql

     /*删除一条记录*/ 
     DELETE FROM table_name WHERE id=2; 

数据库从另外一台导入
========================

.. code-block:: sh

    $ sudo systemctl stop  mariadb.service
    # 替换 /val/lib/mysql 目录
    $ sudo cp -r /val/lib/mysql  /val/lib/mysql.bak
    $ sudo cp -r new_mysql  /val/lib/mysql
    $ sudo chown -R mysql:mysql /val/lib/mysql 

服务器数据库损坏修复
========================

1. 关闭使用数据库的服务
------------------------------

.. code-block:: sh

    systemctl stop mccenter
    systemctl stop zabbix-server

    

2.用恢复模式启动数据库
------------------------------

编辑数据库配置文件 `/etc/my.cnf`


.. code-block:: ini

    [mysqld]

    datadir=/var/lib/mysql

    socket=/var/lib/mysql/mysql.sock

    # Disabling symbolic-links is recommended to prevent assorted security risks

    symbolic-links=0

    # Settings user and group are ignored when systemd is used.

    # If you need to run mysqld under a different user or group,

    # customize your systemd unit file for mariadb according to the

    # instructions in http://fedoraproject.org/wiki/Systemd

    # innodb_force_recovery = 2

    # innodb_purge_threads = 0

    max_allowed_packet = 500M

    wait_timeout = 600

    [mysqld_safe]

    log-error=/var/log/mariadb/mariadb.log

    pid-file=/var/run/mariadb/mariadb.pid

    #

    # include all files from the config directory

    #

    !includedir /etc/my.cnf.d

* 在[mysqld]下添加 `innodb_force_recovery = 2` ，其中等号右侧的数值应该从1到6逐个测试。
* 在[mysqld]下添加 `innodb_purge_threads = 0` 。
* 在[mysqld]下添加 `max_allowed_packet = 500M` 。
* 在[mysqld]下添加 `wait_timeout = 600` 。


.. code-block:: sh

    #重启数据库服务
    systemctl restart mariadb


如果长时间没有完成，则用 `ctrl + c` 停止命令执行。继续修改配置文件，增大 `innodb_force_recovery` 的值。
然后重启数据库服务。

如果重启数据库命令执行完成，用 `systemctl status mariadb` ，命令查看数据库服务是否已经启动。
如果没有，继续修改配置文件，增大 `innodb_force_recovery` 的值。然后重启数据库服务。
重复前面的步骤，直到数据库成功启动。


3.备份数据库
-------------------

.. code-block:: sh

    mysqldump -uroot --all-databases  > all_mysql_backup.sql

4.清空数据库
-------------------


.. code-block:: sh

    systemctl  stop  mariadb  #关闭数据库服务
    cp -r  /var/lib/mysql/ /var/lib/mysql.bak # 备份数据库
    rm -rf /var/lib/mysql/* #删除数据库

5.正常启动数据库
---------------------


.. code-block:: sh

    # 修改配置文件： 注释掉修改的配置项
    # vi /etc/my.cnf
    sed -i 's/^innodb_force_recovery =.*$/# innodb_force_recovery = 2/' /etc/my.cnf
    sed -i 's/^innodb_purge_threads =.*$/# innodb_purge_threads = 0/'   /etc/my.cnf

    systemctl restart mariadb #重启数据库

6.恢复数据库数据
-----------------------

.. code-block:: sh

    mysql -uroot -e "source /root/all_mysql_backup.sql"
    
7.修改数据库用户权限
---------------------------

.. code-block:: sh
    
    mysql -uroot #登录数据库shell。
    
.. code-block:: sql

    /*修改数据库用户权限*/
    update user set host = '%'  where user ='root';
    flush privileges;
    quit;

.. code-block:: sh
    
    mysql -uroot #登录数据库shell。
 
.. code-block:: sql

    /*创建zabbix用户*/
    create user 'zabbix'@'%'identified by 'zabbix';

    /*给zabbix用户数据库zabbix的操作权限：*/
    grant all on zabbix.* to'zabbix'@'%';
    flush privileges;
    quit;

8.启动停掉的服务
------------------------

.. code-block:: sh

    systemctl start mccenter
    systemctl start zabbix-server


修改最大连接数 
===============

* `CentOS7.2 调整mysql数据库最大连接数 <https://blog.csdn.net/hnhuangyiyang/article/details/51132141>`_

