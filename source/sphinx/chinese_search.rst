================
中文搜索
================

一、安装结巴
**********************

#. 安装pip

#. 安装结巴
    ::

        pip install jieba

二、配置中文搜索
************************

#. 下载zh_CN.py
    ::

        https://github.com/bosbyj/sphinx.search.zh_CN

#. 复制 zh_CN.py 到 sphinx 的 search 目录下，如：
    ::

        C:\Python27\Lib\site-packages\sphinx\search

#. 打开 search 目录下的 __init__.py 找到：
    ::

        from sphinx.search import en, ja
        languages = {
            'en': en.SearchEnglish,
            'ja': ja.SearchJapanese,
        }

    修改成：
    ::

        from sphinx.search import en, ja, zh_CN
        languages = {
            'en': en.SearchEnglish,
            'ja': ja.SearchJapanese,
            'zh_CN': zh_CN.SearchChinese
        }

三、重新make文档
***************************

#.  make文档
    ::

        make html
