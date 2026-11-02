###########
Python
###########

**适用版本**：Python 3.12+（Ubuntu 24.04 自带 3.12）

环境与版本
==========

* 系统 Python：

  .. code-block:: bash

     sudo apt install python3 python3-venv python3-pip

* 需要更新版本时使用 deadsnakes：

  .. code-block:: bash

     sudo add-apt-repository ppa:deadsnakes/ppa
     sudo apt update
     sudo apt install python3.13 python3.13-venv

* 让 python 命令默认指向 python3：

  .. code-block:: bash

     sudo apt install python-is-python3

* 查看安装路径：

  .. code-block:: bash

     python3 -m site
     python3 -m site --user-site


国内镜像源
==========

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

    # 推荐使用标准库 venv
    python3 -m venv .venv
    source .venv/bin/activate
    deactivate

    # virtualenv（可选）
    virtualenv --python=python3 venv

    pip freeze  # 查看当前安装版本
    pip freeze > requirements.txt

* `virtualenvwrapper  <https://www.cnblogs.com/freely/p/8022923.html>`_


常用操作
========

临时 HTTP 服务
--------------

.. code-block:: bash

   python3 -m http.server 8008

.. note::

   Python 2 的 SimpleHTTPServer 已移除，现在统一使用 http.server。

编译 pyc
--------

.. code-block:: bash

   python3 -m compileall -b .

.. warning::

   下面的命令会删除 .py 源文件，确认后再执行。

.. code-block:: bash

   find . -name '*.py' -delete
   find . -name '__pycache__' -type d -prune -exec rm -rf {} +

打包 Windows exe
----------------

.. code-block:: bash

   python3 -m pip install pyinstaller
   pyinstaller --onefile app.py

* `PyInstaller 文档 <https://pyinstaller.org/en/stable/>`_
* `Python 打包指南 <https://packaging.python.org/>`_


打包与资料
==========

* `如何打包你的 Python 代码 <https://python-packaging-zh.readthedocs.io/zh_CN/latest/>`_
* `python3-cookbook <https://python3-cookbook.readthedocs.io/zh_CN/latest/>`_
* `流畅的 Python <https://www.linuxidc.com/Linux/2017-06/144466.htm>`_
* `精通 Python 设计模式 <https://www.linuxidc.com/Linux/2017-03/141662.htm>`_
* `NumPy 中文 <https://www.numpy.org.cn/>`_
* `Python Code Examples <https://www.programcreek.com/python/>`_
* `requests <https://requests.readthedocs.io/>`_


python 语法规则
==================

* 函数内对变量赋值会创建局部变量；需要修改全局变量时用 global：

.. code-block:: python

    a = 5
    def func():
        global a
        a = a + 11
        print(a)

    func()


-------

* `Django 官方文档 <https://docs.djangoproject.com/zh-hans/stable/>`_


python库
================

* `lxml - XML and HTML with Python <https://lxml.de/>`_

* `Urwid <https://urwid.org/index.html>`_
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
* `python装饰器 <https://www.cnblogs.com/cicaday/p/python-decorator.html>`_

----

.. code-block:: python

    # 查看字符串编码
    import chardet
    fencoding = chardet.detect(u"test string")
    print(fencoding)

    # 从 URL 地址提取文件名
    import os
    url = 'http://www.jb51.net/images/logo.gif'
    filename = os.path.basename(url)
    print(filename)

    # 去除扩展名
    print(os.path.splitext(filename)[0])

    # 打印方法名
    import inspect
    import sys
    for method in inspect.getmembers(sys.path):
        print(method)


其他
====

* `python全栈学习路线-查询笔记 <https://www.cnblogs.com/eric_yi/p/8483079.html>`_


机器学习
========

* https://github.com/Avik-Jain/100-Days-Of-ML-Code


示例
====

UDP 接收超时
-------------

.. literalinclude:: src/udp_timeout.py
    :linenos:
    :language: python
    :emphasize-lines: 6, 9,15


过时内容
========

Python 2、SimpleHTTPServer、Wine + Python 2.7 打包等旧笔记已移到 :doc:`/legacy/python2`。
