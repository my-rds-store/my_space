配置本地中文搜索
=================


一、安装结巴
----------------

        .. code-block:: sh

                $ sudo pip install --upgrade pip
                $ pip install jieba --user  -i https://pypi.mirrors.ustc.edu.cn/simple


二、配置中文搜索
-----------------------


#. 下载zh_CN.py
    ::

        https://github.com/bosbyj/sphinx.search.zh_CN

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



三、重新make文档
---------------------

#. 修改 source/conf.py

    .. code-block:: python

        language = "zh_CN"

#. make文档

    .. code-block:: sh

        $ make html

