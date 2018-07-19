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


* `LaTex新人教程  <http://www.latexstudio.net/archives/9377>`_

* `LaTex 入门 - [ 云盘 密码9652]  <https://pan.baidu.com/s/1bq7Dv9hvNwCpmag1GaZw1A>`_
* `LaTeX | 为学术论文排版而生 <https://www.jianshu.com/p/9c5482a31c5b>`_
* `CTEX <http://www.ctex.org/HomePage>`_





