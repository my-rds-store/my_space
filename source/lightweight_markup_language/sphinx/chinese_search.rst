支持中文搜索
=================

一. Read the docs 支持中文搜索 
------------------------------


#. 修改conf.py


   .. code-block:: python

    # import os

   改为

   .. code-block:: python

    import os

#. 在 conf.py添加

   .. code-block:: python

    on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
    if on_rtd:
        latex_elements = {
        # The paper size ('letterpaper' or 'a4paper').
        #'papersize': 'letterpaper',
        # The font size ('10pt', '11pt' or '12pt').
        #'pointsize': '10pt',
        # Additional stuff for the LaTeX preamble.
        'preamble': r'''
        \hypersetup{unicode=true}
        \usepackage{CJKutf8}
        \DeclareUnicodeCharacter{00A0}{\nobreakspace}
        \DeclareUnicodeCharacter{2203}{\ensuremath{\exists}}
        \DeclareUnicodeCharacter{2200}{\ensuremath{\forall}}
        \DeclareUnicodeCharacter{2286}{\ensuremath{\subseteq}}
        \DeclareUnicodeCharacter{2713}{x}
        \DeclareUnicodeCharacter{27FA}{\ensuremath{\Longleftrightarrow}}
        \DeclareUnicodeCharacter{221A}{\ensuremath{\sqrt{}}}
        \DeclareUnicodeCharacter{221B}{\ensuremath{\sqrt[3]{}}}
        \DeclareUnicodeCharacter{2295}{\ensuremath{\oplus}}
        \DeclareUnicodeCharacter{2297}{\ensuremath{\otimes}}
        \begin{CJK}{UTF8}{gbsn}
        \AtEndDocument{\end{CJK}}
        ''',
        }
    else:
        latex_elements = {
            'papersize' : 'a4paper',
            'utf8extra' : '',
            'inputenc'  : '',
            'babel'     : r'''\usepackage[english]{babel}''',
            'preamble' : r'''
            \usepackage{ctex}
            ''',
        }


二. 本地支持中文搜索 
---------------------

安装结巴
^^^^^^^^^^

        .. code-block:: sh

            $ sudo pip install --upgrade pip==9.0.1  -i https://pypi.mirrors.ustc.edu.cn/simple
            $ sudo pip install jieba==0.38  -i https://pypi.mirrors.ustc.edu.cn/simple


修改sphinx
^^^^^^^^^^^^

    #. 下载zh_CN.py

        .. code-block:: sh

            $ git clone https://github.com/bosbyj/sphinx.search.zh_CN.git


    #. 复制 zh_CN.py 到 sphinx 的 search 目录下，如：

        * Windows
            ::

                C:\Python27\Lib\site-packages\sphinx\search

        * ubuntu
                ::

                $HOME/.local/lib/python2.7/site-packages/sphinx/search/

            or
                ::

                /usr/local/lib/python2.7/dist-packages/Sphinx-1.5.5-py2.7.egg/sphinx


    #. 编辑search 目录下的 __init__.py 找到：

    .. code-block:: python

        # maps language name to module.class or directly a class
        languages = {
            'da': 'sphinx.search.da.SearchDanish',
            'de': 'sphinx.search.de.SearchGerman',
            'en': SearchEnglish,
            'es': 'sphinx.search.es.SearchSpanish',
                        ... ...
            'sv': 'sphinx.search.sv.SearchSwedish',
            'tr': 'sphinx.search.tr.SearchTurkish',
            'zh': 'sphinx.search.zh.SearchChinese',
        }



    修改成：

    .. code-block:: python

        # maps language name to module.class or directly a class
        languages = {
            'da': 'sphinx.search.da.SearchDanish',
            'de': 'sphinx.search.de.SearchGerman',
            'en': SearchEnglish,
            'es': 'sphinx.search.es.SearchSpanish',
                        ... ...
            'sv': 'sphinx.search.sv.SearchSwedish',
            'tr': 'sphinx.search.tr.SearchTurkish',
            'zh': 'sphinx.search.zh.SearchChinese',
         'zh_CN': 'sphinx.search.zh_CN.SearchChinese',
        }



重新make文档
^^^^^^^^^^^^^^

    #. 修改 source/conf.py

    .. code-block:: python

        language = "zh_CN"

    #. Build html

    .. code-block:: sh

        $ make html

