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

    $ brew cask install mactex`

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

    \begin{document}
    \maketitle
    你好, \LaTeX!
    \end{document}

.. code-block:: sh

    $ xelatex text.tex  # 编译 ==> pdf
    $ evince text.pdf   # 查看


**********
编辑器    
**********

* `texstudio <http://texstudio.sourceforge.net/>`_
* `ShareLaTex - 在线 LaTex 协同编辑 <https://www.sharelatex.com>`_

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

-----

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

.. code-block:: sh

    # 思源字体 ubuntu
    $ sudo apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra


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

* `LaTeX文档-CTEX <http://www.ctex.org/OnlineDocuments>`_

Learning and  Book   
=====================

* `Mac LaTex 实战 <https://toutiao.io/posts/diwaz3/preview>`_

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

