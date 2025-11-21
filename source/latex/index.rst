########
LaTeX   
########

***********
INSTALL    
***********

.. code-block:: sh

    ##############
    # Ubuntu 
    ##############
    $ sudo apt-get install texlive-full # 完全安装
    $ sudo apt-get install texlive

    # Install Edit 
    $ sudo apt-get install texmaker 
    $ sudo apt-get install texstudio

    ############
    #  mac 
    ############

    $ brew cask install mactex

    # Install Edit 
    $ brew cask install texstudio


*******************************************
Quick start (ubuntu)   
*******************************************

编写 text.tex

.. code-block:: latex

    \documentclass{ctexart}
    \title{First \LaTeX Document}
    \author{Jiang Xumin}
    
    % 思源字体
    \setCJKmainfont[BoldFont = Noto Sans CJK SC]{Noto Serif CJK SC}
    \setCJKsansfont{Noto Sans CJK SC}
    \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}
    \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}

    \begin{document}
    \maketitle

    你好, \LaTeX!

    \CJKfamily{zhhei}  这是黑体
 
    \CJKfamily{zhsong} 这是宋体

    \end{document}

.. code-block:: sh

    $ xelatex text.tex  # 编译 ==> pdf
    $ evince text.pdf   # 查看


**********
编辑器    
**********

* `texstudio <http://texstudio.sourceforge.net/>`_
    * Texstudio快捷键。
        * Ctrl + t : 注释
        * Ctrl + u : 去除注释

* `overleaf <https://www.overleaf.com/project>`_

* Latex workshop 插件配置
    *  Latex-workshop.view.outline.Sync.viewer
    *  Latex-workshop. `show Contex Menu`

    .. code-block:: json

        { 
            "latex-workshop.view.outline.sync.viewer": true,
            "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click",
            "latex-workshop.showContextMenu": true
        }


------------------------

*  `sharelatex-docker <https://hub.docker.com/r/tiagoboldt/sharelatex-docker/>`_

.. code-block:: sh

     $ docker pull  tiagoboldt/sharelatex-docker 
     $ docker run -d --restart=always -p 3000:3000 --name=sharelatex-docker  -v /srv/sharelatex-data:/data tiagoboldt/sharelatex-docker:latest

     # 生成管理员用户
     $ docker exec -t sharelatex-docker /bin/bash -c  'cd /sharelatex/ && grunt user:create-admin --email jiang_xmin@massclouds.com'

     # 设置管理员用密码
     $ google-chorme  http://localhost:3000/user/password/set?passwordResetToken=${TOKEN}
     
-------------

* https://www.ubuntupit.com/best-latex-editor-top-33-reviewed-for-linux-nerds/

----------------

* `TeXnicle <http://www.bobsoft-mac.de/texnicle/texnicle.html>`_
* `TeXpen <https://sourceforge.net/projects/texpen/>`_
* texpad
* texmaker


**************************
LaTeX/Source Code Listings
**************************

* `LaTeX/Source Code Listings <https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings>`_

.. code-block:: python

    #!/usr/bin/env python
    #coding=utf-8
    #file name:  source_filename.py

    improt os

    def func()
        print "hello world"


.. code-block:: tex

    \documentclass[UTF8]{ctexart}


    \usepackage{listings}

    \begin{document}
            \lstinputlisting[language=Python]{source_filename.py}
    \end{document}


**********
关于字体  
**********

* `fonts.conf 中文手册 <http://www.jinbuguo.com/gui/fonts.conf.html>`_
* `Linux字体美化实战(Fontconfig配置) <http://www.jinbuguo.com/gui/linux_fontconfig.html>`_

------

* `Ubuntu安装adobe字体 <https://blog.csdn.net/yixian918/article/details/51462275>`_

  
.. code-block:: sh

    $ git clone --depth 1  https://github.com/dolbydu/font.git adobe-fonts
    $ sudo mkdir -p   /usr/share/fonts/adobe
    $ sudo cp -rvf adobe-fonts/* /usr/share/fonts/adobe/

    # 生成字体信息
    $ sudo mkfontscale
    $ sudo mkfontdir
    $ sudo fc-cache -f -v

    # 查看
    $ fc-list :lang=zh-cn

* `思源字体- Google Noto Fonts <https://www.google.com/get/noto/>`_
* `思源字体- Adobe Source Han Serif <https://source.typekit.com>`_
* `XeTeX下使用思源黑体 <http://www.latexstudio.net/archives/2021.html>`_

.. code-block:: sh

    # 思源字体 ubuntu
    $ sudo apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra

----------------


* setmainfont{...} 
    衬线字体,论文中西文部分默认使用的字体。这里的默认字体都会是 Times New Roman。Linux 下也有同名字体。

* setsansfont{...}
    是西文默认无衬线字体。一般可能出现在大标题等显眼的位置。 这一部分经常碰上的字体会是 Helvetica/Arial。Linux下有Helvetica，前缀是 -adobe-helvetica-* 。这是一个古老的非抗锯齿版本（也就是不用 fontconfig 配置而使用 xfontsel），所以如今的 XWindow 环境应该不会再使用它作为屏幕字体。

* setmonofont{...} 
    是西文默认的等宽字体。一般用于排版程序代码。打印机字体。Courier 或者 Courier New 是常见的 Word 选项。Linux 下一般会有 Courier，但很少能看见 Courier New。

------------

* setCJKmainfont[BoldFont={...},ItalicFont={...}]{...} 
    指定中文（或韩文日文）的默认字体。衬线字体, 通常情况下，大部分文档论文会要求用宋体{SimSun}排版。
    Linux 下可能用文鼎宋体代替，不过效果可能较差。
    另一点是和西文不同的地方，这个设置允许我们指定粗体和斜体应用何种字体代替。之所以有这个区别，是因为中文不使用粗体表示强调，也不使用斜体表示引文或书名号。我一般会指定BoldFont 和 ItalicFont 为某种黑体，
    Windows 环境下是SimHei，Linux下我会用文泉驿正黑避免版权问题。
    有些高校的论文模板，比如就是明确要求强调段落必须使用楷体（SimKai），只能照着要求设置。

* \setCJKsansfont{...}  
    无衬线字体
* \setCJKmonofont{...}
    等宽字体,打印机字体。



* `衬线字体与无衬线字体区别 <https://www.jianshu.com/p/414ea6c05276>`_
* `如何优雅的选择默认字体(font-family) <https://www.imooc.com/article/11261>`_

-----------------

.. code-block:: tex

    \setCJKmainfont{隶书}
    % \setCJKmainfont{[Lishu.TTF]}     % 当前目录字体 Lishu.TTF

    %\setCJKfamilyfont{msyahei}{Microsoft YaHei}
    \setCJKfamilyfont{msyahei}{微软雅黑}



************************
deeplearningbook
************************


* `deeplearningbook 英文版 <http://www.deeplearningbook.org/>`_

* `deeplearningbook 中文版 <https://github.com/exacity/deeplearningbook-chinese.git>`_

* `deeplearningbook 读书笔记 (for Makedown) <https://github.com/exacity/simplified-deeplearning.git>`_


************
学习文档    
************

离线文档
============

.. code-block:: sh

    # 手册
    $ texdoc texdoc     # texdoc 

    $ texdoc ctex       # CTEX 宏集手册
    $ texdoc lshort-zh  # 一份不太简短的 L A TEX 2
    $ texdoc graphic    # 图片
    $ texdoc longtable  # 长表格宏包
    $ texdoc tabu       # 综合表格宏包

在线文档    
===============

* `LaTeX教程 <https://www.latexstudio.net/LearnLaTeX/>`_
* `LaTeX文档-CTEX <http://www.ctex.org/OnlineDocuments>`_

Learning and  Book   
=====================

* `一份（不太）简短的 LaTeX2ε 介绍 <https://github.com/CTeX-org/lshort-zh-cn/releases>`_


* `texblog  <https://texblog.org/>`_
    * `Automated sub-figure generation using a loop in LaTeX  <https://texblog.org/2015/10/09/automated-sub-figure-generation-using-a-loop-in-latex/>`_

* `LaTex Tutorial Main <http://www1.cmc.edu/pages/faculty/aaksoy/latex/latextutorialmain.html>`_

* `LaTex 入门 - [ 云盘 密码9652]  <https://pan.baidu.com/s/1bq7Dv9hvNwCpmag1GaZw1A>`_
* `LaTeX | 为学术论文排版而生 <https://www.jianshu.com/p/9c5482a31c5b>`_
* `CTEX <http://www.ctex.org/HomePage>`_
* `LaTex help <http://www.emerson.emory.edu/services/latex/latex_toc.html>`_
* `LATEX2e 插图指南 <http://www.ctex.org/documents/latex/graphics/graphics.html>`_
* `WIKIBOOKS LaTex <https://en.wikibooks.org/wiki/LaTeX>`_

************
latex 模板
************

* `LaTeX 开源小屋 <http://www.latexstudio.net/>`_
* `国科大论文模板 <https://github.com/mohuangrui/ucasthesis>`_
* `LaTeX Templates <http://www.latextemplates.com/>`_

* 演示文稿
    * `一个中文Latex幻灯片模版 <http://blog.sciencenet.cn/blog-255662-1095006.html>`_

************
知识点   
************

* 超链接

.. code-block:: tex

    %1.1 使用的包
    \usepackage[colorlinks,linkcolor=blue]{hyperref}
    
    %1.2 插入链接的代码
    \href{http://v.youku.com/}{Youku video} 



* `封面 <https://www.latextemplates.com/cat/title-pages>`_
