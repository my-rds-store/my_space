说明
======

创建镜像
----------

.. code-block:: sh

    sudo docker build -t  my_space_build:v1 .

编译
----------
.. code-block:: sh
    
     docker run -t --rm -v ~/Documents/my_space:/root/my_space --name my_space_build  my_space_build:v1 bash -c "cd my_space; make html -j4"
