graphviz 画图
==================

`Using PlantUML <https://build-me-the-docs-please.readthedocs.io/en/latest/Using_Sphinx/UsingGraphicsAndDiagramsInSphinx.html>`_

INSTALL
-----------

.. code-block:: sh

    $ sudo  apt-get install graphviz



conf.py
-----------

.. code-block:: python


    # 通过配置开启graphviz插件
    # extensions = ['sphinx.ext.graphviz']
    extensions.append('sphinx.ext.graphviz')


    #######################################################################
    # -- Options for graphviz  seting -------------------------------------
    #######################################################################

    # 设置 graphviz_dot 路径
    graphviz_dot = 'dot'

    # 设置 graphviz_dot_args 的参数，这里默认了默认字体
    graphviz_dot_args = ['-Gfontname=Georgia', 
                         '-Nfontname=Georgia',
                         '-Efontname=Georgia']
    # 输出格式，默认png，这里我用svg矢量图
    graphviz_output_format = 'svg'


查看已安装中文字体
--------------------

.. code-block:: sh

    $ fc-list :lang=zh


`sphinx文档使用graphviz来画图 <http://ju.outofmemory.cn/entry/220289>`_

`graphviz dot语言学习笔记 <http://www.jianshu.com/p/e44885a777f0>`_


`使用 Graphviz dot 创作 UML 类图 <http://www.jianshu.com/p/d730f83bd81f>`_
`使用Graphviz Dot绘制类图 <http://blog.csdn.net/ttomer/article/details/8684689>`_ 

`UML绘制-dot语言 <https://segmentfault.com/a/1190000004646829?utm_source=tuicool&utm_medium=referral>`_


`Documentation <http://graphviz.org/Documentation.php>`_



.. graphviz::

    digraph abc{
        a;
        b;
        c;
        d;

        a -> b;
        b -> d;
        c -> d;
    }


