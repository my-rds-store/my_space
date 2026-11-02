Python 2 / Wine 旧笔记
======================

.. warning::

   Python 2 已于 2020 年停止维护，以下内容仅作历史记录，不再建议使用。

Python 2 SimpleHTTPServer
-------------------------

.. code-block:: bash

   python -m SimpleHTTPServer 8008

Python 2 语法示例
-----------------

.. code-block:: python

   a = 5
   def func():
       a = a + 11
       print a

   func()

Wine + Python 2.7 打包 Windows exe
----------------------------------

.. code-block:: bash

   sudo apt-get install wine32 winetricks
   winetricks python

   cd ~/.wine/drive_c/Python26
   # wine msiexec /i python-2.7.15.msi /L*v log.txt
   wine msiexec /i python-2.7.15.msi

   wine python.exe Scripts/pip.exe install pyinstaller -i https://pypi.mirrors.ustc.edu.cn/simple
   wine python.exe Scripts/pip.exe install --upgrade pip -i https://pypi.mirrors.ustc.edu.cn/simple
   # wine python.exe Scripts/pip.exe install pyserial -i https://pypi.mirrors.ustc.edu.cn/simple

   cd ~/workspace

   tee HelloWorld.py <<-"EOF"
   print('hello world!')
   EOF

   wine ~/.wine/drive_c/Python27/Scripts/pyinstaller.exe --onefile HelloWorld.py
   wine dist/HelloWorld.exe

.. code-block:: bash

   sudo dpkg --add-architecture i386
   sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
   apt-get update

   apt-get install -y curl
   apt-get install -y wine32

   curl -o python-2.7.15.msi https://www.python.org/ftp/python/2.7.15/python-2.7.15.msi
   wine msiexec /i python-2.7.15.msi /q
   rm -f python-2.7.15.msi

   PY_HOME=${HOME}/.wine/drive_c/Python27
   wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install pyinstaller -i https://pypi.mirrors.ustc.edu.cn/simple
   wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install --upgrade pip -i https://pypi.mirrors.ustc.edu.cn/simple

旧版 Python 3.6（Ubuntu 16.04）
-------------------------------

.. code-block:: bash

   sudo apt-get install openssl
   sudo apt-get install libssl-dev

* `Ubuntu 16.04 安装 Python3.6 <https://www.cnblogs.com/gaowengang/p/7736672.html>`_
* `python3.6 安装报错 ZipImportError <https://blog.51cto.com/jschu/2174394>`_

Wine / PyInstaller Docker 链接
------------------------------

* https://github.com/dockefile-storage/wine/blob/master/Dockerfile
* https://hub.docker.com/r/cdrx/pyinstaller-windows/dockerfile
* http://www.kegel.com/wine/cl-howto-win7sdk.html
* https://github.com/Winetricks/winetricks
    * https://github.com/Winetricks/winetricks/blob/master/files/verbs/settings.txt
