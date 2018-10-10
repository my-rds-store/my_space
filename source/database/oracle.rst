#######
Oracle 
#######

***********
Install    
***********

server  
========

* `downlaod server <https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html>`_

* `docker <https://blog.csdn.net/wm5920/article/details/78770556>`_

  
  .. code-block:: sh

      #修改/etc/selinux/config文件，设置为disable
      sed 's/SELINUX=.*$/^SELINUX=disable/g'  /etc/selinux/config

      docker pull wnameless/oracle-xe-11g

      docker run -d -p 49160:22 -p 49161:1521 wnameless/oracle-xe-11g
      #49160是ssh访问端口,初始密码admin
      #49161是数据库访问端口

   .. code::

        hostname: localhost
        port: 49161
        sid: xe
        username: system/sys
        password: oracle

* 静默安装(待验证)
  * `Centos7安装Oracle 11gR2 <https://www.cnblogs.com/startnow/p/7580865.html>`_
  * `CentOS 7静默（无图形化界面）安装Oracle 11g <https://blog.csdn.net/Kenny1993/article/details/75038670>`_


Client   
=========

* `Download client <https://www.oracle.com/technetwork/database/database-technologies/instant-client/downloads/index.html>`_

* `Install client  <https://blog.csdn.net/karloo/article/details/51862226>`_

    * oracle-instantclient-basic*.rpm    
    * oracle-instantclient-sqlplus*.rpm    
    * oracle-instantclient-devel*.rpm    

.. code-block:: sh

    dpkg -i  oracle-instantclient-basic*.rpm    
    dpkg -i  oracle-instantclient-sqlplus*.rpm    
    dpkg -i  oracle-instantclient-devel*.rpm    

    export  ORACLE_HOME=/usr/lib/oracle/11.2/client64
    export  TNS_ADMIN=$ORACLE_HOME/network/admin
    export  NLS_LANG='simplified chinese_china'.ZHS16GBK
    export  LD_LIBRARY_PATH=$ORACLE_HOME/lib 
    export  PATH=$ORACLE_HOME/bin:$PATH
    
    # connect 
    sqlplus64 system/oracle@//192.168.8.204:49161/xe

    select name from v$database;

    cat test.sql
    SELECT table_name FROM user_tables;
    exit;

    sqlplus64 system/oracle@//192.168.8.204:49161/xe @/root/test.sql

