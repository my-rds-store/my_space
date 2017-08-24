配置文件说明 conf.py
=========================


* version 

项目主版本, 用来替代 \|Version\|. 
例如,对于Python文档, 就像2.6 


* release 

完整版本，用来替换 \|release\|, 正如在HTML模板中.
例如,对于Python文档。正如 2.6.0rc1


 如果你不需要在version 和 release 做区别，只需要将它们设置为相同即可。

*  不显示 View page source
    
  `html_copy_source <http://www.sphinx-doc.org/en/stable/config.html#confval-html_copy_source>`_

    .. code-block:: python

        html_copy_source=False
        html_show_sourcelink=False

参考 `The build configuration file <http://www.pythondoc.com/sphinx/config.html>`_。   


* 主题 

    http://www.writethedocs.org/guide/tools/sphinx-themes/


