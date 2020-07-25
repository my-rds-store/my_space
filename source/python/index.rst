###########
Python 
###########

* `Numpy 中文 <https://www.numpy.org.cn/about/>`_

-----------------

* `Python Code Examples <https://www.programcreek.com/python/>`_

* `python-requests <http://www.python-requests.org/en/master/>`_ 
    * `Python Requests快速入门  <https://blog.csdn.net/iloveyin/article/details/21444613>`_

* `在Linux中使用Python模拟键盘按键  <https://blog.csdn.net/zhouy1989/article/details/13997507>`_


.. code-block:: sh
    
    # python2   SimpleHTTPServer
    python -m SimpleHTTPServer 8008
    
    # python3   
    python -m http.server 8008


.. code-block:: sh

    # 查找python安装包的路径 site-packages

    python -m site              # 系统目录
    python -m site --user-site  # 用户目录


************
打包
************

* `如何打包你的Python代码 <https://python-packaging-zh.readthedocs.io/zh_CN/latest/>`_

* `Pyinstaller使用  <https://www.jianshu.com/p/cc76099bbe04>`_
* `Using PyInstaller <http://pyinstaller.readthedocs.io/en/stable/usage.html>`_

---------

* python3编译成pyc文件

.. code-block:: sh

    python3 -m compileall -b .           # -b: 生成的pyc与源代码在同一目录
    find . -name '*.py' |xargs rm -rf    # . 删除py文件
    find . -name 'pycache' |xargs rm -rf # 删除pycache目录


*******
Book   
*******

* `python3-cookbook <http://python3-cookbook.readthedocs.io/zh_CN/latest/>`_
* `流畅的Python 中文PDF <http://www.linuxidc.com/Linux/2017-06/144466.htm>`_
* `精通Python设计模式 高清晰PDF <https://www.linuxidc.com/Linux/2017-03/141662.htm>`_
* `NumPy 中文文档 <https://www.numpy.org.cn/>`_

**************
国内镜像源
**************

* Linux
 
.. code-block:: sh
        
    mkdir $HOME/.pip
    tee $HOME/.pip/pip.conf <<-'EOF'
    [global]
    index-url = https://mirrors.aliyun.com/pypi/simple/

    [install]
    trusted-host=mirrors.aliyun.com
    EOF

* Windows

::

        在文件夹的地址栏输入 %appdata% （即进入这个文件夹）。

        在当前文件夹下新建一个pip文件夹。

        进入pip文件夹，新建一个pip.ini文件

virtualenv   
==================

.. code-block:: sh

    # old  version
    #virtualenv --no-site-packages venv
    #virtualenv -p /usr/bin/python3.6  --no-site-packages venv
    
    # new version 20.0.13
    virtualenv --python=python3 venv


    pip freeze  # 查看当前安装版本
    pip freeze > requirements.txt

* `virtualenvwrapper  <https://www.cnblogs.com/freely/p/8022923.html>`_

   待整理


python 语法规则   
==================


* python规则指定,所有在赋值语句左面的变量都是局部变量

.. code-block:: python

    a=5
    def func():
        # global a  # 注释掉此行，报错
        a = a+11
        print a

    func()


-------

* `Django 教程 <https://code.ziqiangxuetang.com/django/django-tutorial.html>`_


****************
python库  
****************

* `lxml - XML and HTML with Python <http://lxml.de/>`_

* `Urwid <http://urwid.org/index.html>`_
  * `urwid_timed_progress <https://github.com/mgk/urwid_timed_progress>`_

* `pyserial <https://my.oschina.net/u/2306127/blog/616002>`_

-----

* `PyUserInput <https://github.com/PyUserInput/PyUserInput>`_
* `简书:PyUserInput <https://www.jianshu.com/p/552f96aa85dc>`_

.. code-block:: python

    # 键盘事件监听
    from pykeyboard import PyKeyboardEvent
    import time

    class TapRecord(PyKeyboardEvent):
      def __init__(self):
        PyKeyboardEvent.__init__(self)
     
      def tap(self, keycode, character, press):
        print(time.time(), keycode, character, press)
     
    t = TapRecord()
    t.run()



* `python装饰器详解 <https://blog.csdn.net/xiangxianghehe/article/details/77170585>`_
* `python装饰器 <http://python.jobbole.com/82344/>`_
* `详解Python的装饰器 <https://www.cnblogs.com/cicaday/p/python-decorator.html>`_

----

.. code-block:: python

    # 查看字符串 编码
    import chardet
    fencoding=chardet.detect(u"test string")
    print fencoding

    # 从URL地址提取文件名
    import os
    url = 'http://www.jb51.net/images/logo.gif'
    filename = os.path.basename(url)
    print(filename)

    # 去除扩展名
    print os.path.splitext(filename)[0]

    # 打印方法名
    import inspect
    import sys
    for  method in  inspect.getmembers(sys.path):
        print method

***********************************
Linux 下编译windows Exe
***********************************

* `winehq <https://wiki.winehq.org/Ubuntu_zhcn>`_

* `Build a Windows executable from Python scripts on Linux <http://sparkandshine.net/build-a-windows-executable-from-python-scripts-on-linux/>`_

.. code-block:: sh

    sudo apt-get install wine32 winetricks
    winetricks python 

    cd ~/.wine/drive_c/Python26
    #wine msiexec /i python-2.7.15.msi /L*v log.txt
    wine msiexec /i python-2.7.15.msi 

    wine python.exe Scripts/pip.exe install pyinstaller -i    https://pypi.mirrors.ustc.edu.cn/simple
    wine python.exe Scripts/pip.exe install --upgrade pip -i  https://pypi.mirrors.ustc.edu.cn/simple
    #wine python.exe Scripts/pip.exe install pyserial -i    https://pypi.mirrors.ustc.edu.cn/simple

    cd ~/workspace

    tee HelloWorld.py <<-"EOF"
    print('hello world!')
    EOF

    wine ~/.wine/drive_c/Python27/Scripts/pyinstaller.exe --onefile HelloWorld.py
    wine dist/HelloWorld.exe


.. code-block:: sh
    
    sudo dpkg --add-architecture i386 # 开启32位架构支持
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
    apt-get update

    apt-get install -y curl 
    apt-get install -y wine32 
    #apt-get install -y --fix-missing winetricks 

    curl -o python-2.7.15.msi https://www.python.org/ftp/python/2.7.15/python-2.7.15.msi
    wine msiexec /i python-2.7.15.msi /q   #Dockerfile 有问题？？？, 手动安装没问题
    rm -f  python-2.7.15.msi

    PY_HOME=${HOME}/.wine/drive_c/Python27
    wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install pyinstaller   -i  https://pypi.mirrors.ustc.edu.cn/simple
    wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install --upgrade pip -i  https://pypi.mirrors.ustc.edu.cn/simple


------

* `Urwid <http://urwid.org/>`_
* `npyscreen  <https://npyscreen.readthedocs.io/index.html>`_

*******
其他   
*******

* `python全栈学习路线-查询笔记 <https://www.cnblogs.com/eric_yi/p/8483079.html>`_


***********
机器学习   
***********

* https://github.com/Avik-Jain/100-Days-Of-ML-Code


******************
build int docker 
******************

* https://github.com/dockefile-storage/wine/blob/master/Dockerfile
* https://hub.docker.com/r/cdrx/pyinstaller-windows/dockerfile
* http://www.kegel.com/wine/cl-howto-win7sdk.html
* https://github.com/Winetricks/winetricks
    * https://github.com/Winetricks/winetricks/blob/master/files/verbs/settings.txt

************************************
build install python 
************************************

.. code-block:: sh

        # 编译前安装 , 否则pip 报错误
        sudo apt-get install openssl
        sudo apt-get install libssl-dev

* `Ubuntu 16.04 安装 Python3.6 <https://www.cnblogs.com/gaowengang/p/7736672.html>`_
        * `python3.6安装报错ZipImportError...zlib not available <https://blog.51cto.com/jschu/2174394>`_

************************************
示例 
************************************

UDP 接收超时
=============

.. literalinclude:: src/udp_timeout.py
    :linenos:
    :language: python
    :emphasize-lines: 6, 9,15


