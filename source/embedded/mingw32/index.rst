##################
Mingw32 (fedora)
##################

.. code-block:: bash

    yum install mingw32*


* `MinGW Cross Compiler Project  <http://mingw-cross.sourceforge.net/index.html>`_

* `MinGW/Tutorial <https://fedoraproject.org/wiki/MinGW/Tutorial#Introduction>`_

* `Building GTK apps for MS Windows on Linux <http://ricardo.ecn.wfu.edu/~cottrell/cross-gtk/>`_


-mwindows


* `my_code_exam <https://gitee.com/ForClanguage/about_gtk.git>`_ 

* `gtk2-runtime-2.24.10-2012-10-10-ash.exe <https://sourceforge.net/projects/gtk-win/files/GTK%2B%20Runtime%    20Environment/>`_

https://gtk-win.sourceforge.io/home/index.php/Main/Downloads 

----

* `NSIS <http://nsis.sourceforge.net/Main_Page>`_
* `HM NIS EDIT: A Free NSIS Editor/IDE <http://hmne.sourceforge.net/index.php>`_

-----

.. code-block:: bash
    
    mingw32-pkg-config --libs --cflags gtk+-2.0

    mingw32-pkg-config --list-all 

    ls /usr/i686-w64-mingw32/sys-root/mingw/lib/pkgconfig/

.. code-block:: bash

    ./configure --host=i686-w64-mingw32

    make --CXXFLAGS+=-mwindow


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

.. code-block:: bash

    $ yum install mingw32-nsis.x86_64  mingw32-nsiswrapper.noarch

    $ makensis project.nsi


