vim 技巧
===================

升级vim
-----------------------

`升级vim <https://stackoverflow.com/questions/39896698/youcompleteme-unavailable-requires-vim-7-4-143>`_

.. code-block:: sh

    $ sudo add-apt-repository ppa:jonathonf/vim
    $ sudo apt-get update && sudo apt-get upgrade
    $ sudo apt-get install vim-nox 

``INSTALL``
--------------

    .. code-block:: sh

        $ sudo apt-get install vim vim-scripts vim-doc
        $ sudo apt-get install vim-addon-manager # 插件管理
        $ sudo apt-get install vim-gnome         # 系统黏贴板支持 

`Using Vim as IDE for Python <http://christian.sterzl.info/blog/vim-as-ide-for-python>`_


`UltiSnips vim 代码块 <http://mednoter.com/UltiSnips.html>`_


`vim 与 Markdown <http://www.jianshu.com/p/fa8c56e1aa52>`_  


`Markdown 预览插件 <https://github.com/iamcco/markdown-preview.vim>`_

`vim插件管理器：Vundle的介绍及安装i(很全) <http://blog.csdn.net/zhangpower1993/article/details/52184581>`_

`一个小博客教你把vim用飞起来 <http://www.cnblogs.com/songfy/p/5635757.html>`_

`VIM配置---面向前端 <http://blog.csdn.net/u012948976/article/details/51869990>`_



YouCompleteMe
---------------

`YouCompleteMe手册 <http://valloric.github.io/YouCompleteMe/#ubuntu-linux-x64>`_


安装
-------------------

Ubuntu Linxu x64

    .. code-block:: sh

        $ sudo apt-get install build-essential cmake
        $ sudo apt-get install python-dev python3-dev

        $ sudo apt-get install golang           # 搭建go环境


    .. code-block:: sh

        $ git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git \
            $HOME/.vim/bundle/YouCompleteMe
        $ cd $HOME/.vim/bundle/YouCompleteMe
        $ git submodule update --init --recursive

        $ ./install.py --clang-completer  # c/c++
        $ ./install.py --gocode-completer # go
        $ ./install.py --all


    Vundle
        .. code-block:: sh

            Plugin 'Valloric/YouCompleteMe'

YouCompleteMe的配置
^^^^^^^^^^^^^^^^^^^^^

`YouCompleteMe的配置 <http://www.cnblogs.com/starrytales/p/6031671.html>`_

`YouCompleteMe的配置 2 <http://blog.jobbole.com/58978/>`_

在 `$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py`
添加:

.. code-block:: python 

    flags = [
    '-Wall',
      ...  
    '-isystem',
    './tests/gmock/include',
    '-isystem',       # 此行及以下，为添加行,检索 C/C++头文件
    '/usr/include',
    '-isystem',
    '/usr/include/c++/5.4.0',
    '-isystem',
    '/usr/include',
    '/usr/include/x86_64-linux-gnu/c++',
    ]


``vim实用技巧``
------------------

    .. seealso::

        .. code-block:: sh

            $ vim-addons status
            $ vim-addons install omnicppcomplete

        :ref:`如何判断文件类型? <set-filetype>`




vim实用技巧
---------------------

* 技巧 24 面向列块的可视模式编辑表格数据

* 技巧 30 在指定范围上执行普通模式命令

        normal

* 技巧51 用精确的文本对象选择区

        xml 编写技巧



.. _set-filetype:

查看当前文件是什么类型了

   .. code:: 

        :set filetype 

`Vim升华之树形目录插件NERDTree安装图解 <http://www.linuxidc.com/Linux/2013-06/86048.htm>`_


#. Vim升华之树形目录插件NERDTree安装图解

http://www.linuxidc.com/Linux/2013-06/86048.htm

#. 每天一个vim插件–vim-multiple-cursors (foocoder.com)

    http://www.tuicool.com/articles/ymYNj2

#.  Vim常用插件——前端开发工具系列

http://web.jobbole.com/83226/


#. vi/vim使用进阶: 开启文件类型检测

http://easwy.com/blog/archives/advanced-vim-skills-filetype-on/


#. plugin、autoload、ftplugin有什么区别

http://www.cnblogs.com/chris-cp/p/4581593.html


#. filetype---- 文件类型检测

http://liuzhijun.iteye.com/blog/1846123



* `像打永春一样使用vim <http://www.jianshu.com/p/4cae150b772f>`_
* `vim 命令汇总 <https://www.zybuluo.com/jiangxumin/note/482449>`_
* `一步步将vim改造成C/C++开发环境IDE <http://blog.chinaunix.net/uid-23089249-id-2855999.html>`_
* `vi/vim使用进阶: 智能补全 <http://easwy.com/blog/archives/advanced-vim-skills-omin-complete/>`_
* `Vim 中使用 OmniComplete 为 C/C++ 自动补全 <http://timothyqiu.com/archives/using-omnicomplete-for-c-cplusplus-in-vim/>`_
* `vim剪切板 <http://www.cnblogs.com/softwaretesting/archive/2011/07/12/2104434.html>`_  
* `vim 右键复制 <http://blog.csdn.net/txg703003659/article/details/6622995>`_

**project**

* `vim中project插件安装与使用 <http://blog.csdn.net/clevercode/article/details/51363050>`_
* `用VIM插件project管理你的项目 <http://blog.163.com/023_dns/blog/static/118727366201212261255290/>`_





