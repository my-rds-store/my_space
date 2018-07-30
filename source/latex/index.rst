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
Learning and  Book   
*********************

* `texblog  <https://texblog.org/>`_
  * `Automated sub-figure generation using a loop in LaTeX  <https://texblog.org/2015/10/09/automated-sub-figure-generation-using-a-loop-in-latex/>`_

* `LaTex新人教程  <http://www.latexstudio.net/archives/9377>`_
* `LaTex Tutorial Main <http://www1.cmc.edu/pages/faculty/aaksoy/latex/latextutorialmain.html>`_

* `LaTex 入门 - [ 云盘 密码9652]  <https://pan.baidu.com/s/1bq7Dv9hvNwCpmag1GaZw1A>`_
* `LaTeX | 为学术论文排版而生 <https://www.jianshu.com/p/9c5482a31c5b>`_
* `CTEX <http://www.ctex.org/HomePage>`_
* `LaTex help <http://www.emerson.emory.edu/services/latex/latex_toc.html>`_
* `LATEX2e 插图指南 <http://www.ctex.org/documents/latex/graphics/graphics.html>`_
* `WIKIBOOKS LaTex <https://en.wikibooks.org/wiki/LaTeX>`_

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



