########
LaTex   
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

*********************
常用命令   
*********************


.. code-block:: sh
    # 手册
    $ texdoc texdoc     # texdoc 

    $ texdoc ctex       # CTEX 宏集手册
    $ texdoc lshort-zh  # 一份不太简短的 L A TEX 2
    $ texdoc graphic    # 图片
    $ texdoc longtable  # 长表格宏包
    $ texdoc tabu       # 综合表格宏包
 
*********************
Learning and  Book   
*********************

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

-----
https://www.ubuntupit.com/best-latex-editor-top-33-reviewed-for-linux-nerds/
-----

* `TeXnicle <http://www.bobsoft-mac.de/texnicle/texnicle.html>`_
* `TeXpen <https://sourceforge.net/projects/texpen/>`_
* texpad
* texmaker

----------------

**************
屏幕显示按键  
**************


* `keycastr - keycast on mac  <https://github.com/keycastr/keycastr>`_
* `screenkey <https://www.thregr.org/~wavexx/software/screenkey/>`_
    
    .. code-block:: sh
    
        $ sudo apt-get install screenkey 
        $ screenkey --show-settings 
        $ screenkey -t 0.5 --multiline

* `KeyCastOW – keycast on windows <http://brookhong.github.io/2014/04/28/keycast-on-windows.html>`_


*********************
LaTex templates
*********************

* `latextemplates <http://www.latextemplates.com/>`_

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



