
reStructuredText 语法
=====================


.. toctree::
   :maxdepth: 1
   :caption: Contents:

   conf
   chinese_search
   local_pdf
   graphviz
  


参考文档
----------

* `Quick reStructuredText <http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_
* `reStructuredText Directives <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_
* `reStructuredText Markup Specification <http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html>`_
* `A ReStructuredText Primer <http://docutils.sourceforge.net/docs/user/rst/quickstart.html>`_

INSTALL
-------

.. code-block:: sh

    $ sudo pip install --upgrade pip==9.0.1  -i https://pypi.mirrors.ustc.edu.cn/simple
    $ sudo pip install sphinx==1.5.5  sphinx-autobuild==0.6.0 -i https://pypi.mirrors.ustc.edu.cn/simple
    $ sudo pip install sphinx_rtd_theme==0.2.4  -i https://pypi.mirrors.ustc.edu.cn/simple


代码
----------

.. code-block:: rst

        .. code-block:: sh

                #!/bin/sh
                echo "hello world"

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


