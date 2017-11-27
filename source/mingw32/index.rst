##################
Mingw32 (fedora)
##################

.. code-block:: bash

    yum install mingw32*


* `MinGW Cross Compiler Project  <http://mingw-cross.sourceforge.net/index.html>`_

* `MinGW/Tutorial <https://fedoraproject.org/wiki/MinGW/Tutorial#Introduction>`_

* `Building GTK apps for MS Windows on Linux <http://ricardo.ecn.wfu.edu/~cottrell/cross-gtk/>`_


-mwindows


.. code-block:: bash
    
    mingw32-pkg-config --libs --cflags gtk+-2.0

    mingw32-pkg-config --list-all 

    ls /usr/i686-w64-mingw32/sys-root/mingw/lib/pkgconfig/

.. code-block:: bash

    ./configure --host=i686-w64-mingw32


How to find library dependencies of Windows DLL
-----------------------------------------------

.. code-block:: bash

    # install 
    yum install mingw-binutils-generic.x86_64
    # Show dependencies dll 
    mingw-objdump -p a.exe | grep DLL

    # install 
    yum install binutils
    # Show dependencies dll 
    objdump -p a.exe  | grep DLL

