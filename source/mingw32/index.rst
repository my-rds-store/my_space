##################
Mingw32 (fedora)
##################

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

