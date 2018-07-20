###########
python 学习
###########

* `Python Code Examples <https://www.programcreek.com/python/>`_

* `python-requests <http://www.python-requests.org/en/master/>`_
* `Python Requests快速入门  <https://blog.csdn.net/iloveyin/article/details/21444613>`_

* `在Linux中使用Python模拟键盘按键  <https://blog.csdn.net/zhouy1989/article/details/13997507>`_


************
打包
************

* `如何打包你的Python代码 <https://python-packaging-zh.readthedocs.io/zh_CN/latest/>`_

* `Pyinstaller使用  <https://www.jianshu.com/p/cc76099bbe04>`_
* `Using PyInstaller <http://pyinstaller.readthedocs.io/en/stable/usage.html>`_

*******
Book   
*******



* `python3-cookbook <http://python3-cookbook.readthedocs.io/zh_CN/latest/>`_
* `流畅的Python 中文PDF <http://www.linuxidc.com/Linux/2017-06/144466.htm>`_
* `精通Python设计模式 高清晰PDF <https://www.linuxidc.com/Linux/2017-03/141662.htm>`_

-------

* `Django 教程 <https://code.ziqiangxuetang.com/django/django-tutorial.html>`_


****************
好用的python库  
****************

* `lxml - XML and HTML with Python <http://lxml.de/>`_

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


************************************
tty终端中显示和输入中文
************************************


* https://blog.csdn.net/maybe_frank/article/details/53371201
* https://fooyou.github.io/document/2015/11/30/fbterm-display-and-input-Chinese-in-tty.html

.. code-block:: sh

   $ sudo apt-get install fbterm
   $ sudo fbterm

------

* `Urwid <http://urwid.org/>`
* `npyscreen  <https://npyscreen.readthedocs.io/index.html>`_

*******
其他   
*******

* `python全栈学习路线-查询笔记 <https://www.cnblogs.com/eric_yi/p/8483079.html>`_


