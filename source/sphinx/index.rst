
reStructuredText 语法
=====================


.. toctree::
   :maxdepth: 1
   :caption: Contents:

   conf
   chinese_search
   local_pdf
   graphviz
  

在线编辑器
    * http://rst.ninjs.org/
    * https://livesphinx.herokuapp.com/


参考文档
----------

* `Quick reStructuredText <http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_
* `reStructuredText Directives <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_
* `reStructuredText Markup Specification <http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html>`_
* `A ReStructuredText Primer <http://docutils.sourceforge.net/docs/user/rst/quickstart.html>`_
* `sphinx-doc <http://www.sphinx-doc.org/en/stable/index.html>`_

* `放到git page <http://lucasbardella.com/blog/2010/02/hosting-your-sphinx-docs-in-github>`_

INSTALL
-------

.. code-block:: sh

    $ sudo pip install --upgrade pip -i https://pypi.mirrors.ustc.edu.cn/simple

    # for mac
    $ sudo pip install six --upgrade --ignore-installed six 

    $ sudo pip install sphinx==1.5.5  sphinx-autobuild==0.6.0 -i https://pypi.mirrors.ustc.edu.cn/simple
    $ sudo pip install sphinx_rtd_theme==0.2.4  -i https://pypi.mirrors.ustc.edu.cn/simple
    
* `Pip安装依赖于six的库失败的解决方法 <https://www.jianshu.com/p/45fb07007ddc>`_

建立sphinx工程
--------------

.. code-block:: sh

    $ sphinx-quickstart

    $ echo "build/" >> .gitignore


.. code-block:: sh

    > Separate source and build directories (y/n) [n]: y

修改 conf.py

.. code-block:: python

    language = "zh_CN"

    html_theme = 'sphinx_rtd_theme'


代码
----------

`使用Sphinx,显示代码 <https://build-me-the-docs-please.readthedocs.io/en/latest/Using_Sphinx/ShowingCodeExamplesInSphinx.html>`_

`Showing code examples <http://www.sphinx-doc.org/en/stable/markup/code.html#directive-highlight>`_

`highlighting language  <http://pygments.org/docs/lexers/>`_

.. code-block:: rst

        .. code-block:: sh

                #!/bin/sh
                echo "hello world"


.. code-block:: rst

    .. literalinclude:: filename
       :linenos:
       :language:
       :lines:
       :start-after:
       :end-before:
       :emphasize-lines:

图片
-------------

.. code-block:: rst

        .. image:: ./images/pic1.png
                :scale: 60%

        .. image:: ./images/pic2.png
                :width:  380px
                :height: 253px


        .. image:: ./x.gif
               :height: 660px
               :width: 580 px
               :scale: 70%
               :alt: alternate text
               :align: center

        .. raw:: html

           <hr width=50 size=10>

        .. raw:: html
           :url: http://docutils.sourceforge.net/docs/ref/rst/directives.html


ReadTheDocs 私有部署搭建安装
----------------------------

.. literalinclude:: ./rtd_local_install.sh
    :language: bash
    :encoding: utf-8

