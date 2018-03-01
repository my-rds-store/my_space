###########
python 学习
###########

* `Python Code Examples <https://www.programcreek.com/python/>`_

------

* `如何打包你的Python代码 <https://python-packaging-zh.readthedocs.io/zh_CN/latest/>`_


Book
--------------

* `python3-cookbook <http://python3-cookbook.readthedocs.io/zh_CN/latest/>`_
* `流畅的Python 中文PDF <http://www.linuxidc.com/Linux/2017-06/144466.htm>`_
* `精通Python设计模式 高清晰PDF <https://www.linuxidc.com/Linux/2017-03/141662.htm>`_


好用的python库
--------------

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


----

.. code-block:: python

    # 查看字符串 编码
    import chardet
    fencoding=chardet.detect(u"test string")
    print fencoding


