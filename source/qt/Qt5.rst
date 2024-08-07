Qt5
===========

Book
------

* `Qt5 QMlBook <https://cwc1987.gitbooks.io/qmlbook-in-chinese/content/>`_
    * https://github.com/cwc1987/QmlBook-In-Chinese

    * `QtQuick之PyQt5与QML交互学习笔记 <https://blog.csdn.net/zym326975/article/details/86589091>`_
    * https://evileg.com/en/post/242/
    * https://www.linuxzen.com/pyqt-qml-kuai-su-kai-fa-guizong-jie.html


--------------


.. * Qt4
..     * `Qt学习之路 <https://www.devbean.net/2012/08/qt-study-road-2-catelog/>`_
..     * `Qt开源社区 <http://www.qter.org/>`_


Qt学习 开源项目
----------------------

* `Stacer <https://github.com/oguzhaninan/Stacer>`_

    .. code-block:: sh

        git clone --depth 1 https://hub.fastgit.org/oguzhaninan/Stacer.git

* Qt自定义控件
    * https://github.com/feiyangqingyun/qucsdk
    * https://www.zhihu.com/column/c_1099710576145567744
    * `开源Demo <https://gitee.com/feiyangqingyun/QWidgetDemo>`_

--------

PyQt 学习示例    
----------------------

* `Python GUI  <https://pythonprogramminglanguage.com/pyqt/>`_

.. code-block:: sh

    git clone --depth 1  https://github.com/pyqt/examples.git

QChart
-------------

* 动态曲线图 
    * **Examples/Qt-5.10.0/charts/dynamicspline**
    * **Examples/Qt-5.10.0/charts/qmlchart**
* `QT绘制曲线图 QSplineSeries <https://blog.csdn.net/sazass/article/details/112892959>`_
* `QT绘制直方图 QBarSeries <https://blog.csdn.net/sazass/article/details/112877752>`_
* `QT绘制饼状图 QPieSeries     <https://blog.csdn.net/sazass/article/details/112863491>`_
* `QT绘制折线图 QLineSeries    <https://blog.csdn.net/sazass/article/details/112885820>`_
* `QT绘制散点图 QScatterSeries <https://blog.csdn.net/sazass/article/details/112895656>`_
* `QT绘制面积图 QAreaSeries    <https://blog.csdn.net/sazass/article/details/112899184>`_


Qt地图  研究   
---------------------

* `Qt Position <https://doc.qt.io/qt-5/qtpositioning-module.html>`_

* `Qt Location <https://doc.qt.io/qt-5/qtlocation-cpp.html>`_


-------------

* https://github.com/SindenDev/amap.git
* https://github.com/SindenDev/QAMap.git
* https://github.com/gongjianbo/QtWebCannelAndMap.git

播放器    
--------------

QMultimedia
    QCamera

* `SMPlayer <https://sourceforge.net/projects/smplayer/?source=typ_redirect>`_
* `获取SMPlayer <https://www.smplayer.info/zh_TW/downloads>`_

.. code-block:: sh

    $ sudo apt-get install smplayer

跨平台编译   
---------------

* `Linux下编译静态MinGW环境,编译windows平台Qt程序 <https://yjdwbj.github.io/2016/09/13/Linux%E4%B8%8B%E7%BC%96%E8%AF%91%E9%9D%99%E6%80%81MinGW%E7%8E%AF%E5%A2%83-%E7%BC%96%E8%AF%91windows%E5%B9%B3%E5%8F%B0Qt%E7%A8%8B%E5%BA%8F/>`_

* `MXE <http://mxe.cc/>`_   

打包    
---------------

* windeployqt


知识点     
-------------

* `将外部应用程序嵌入到QWidget中 <https://gitee.com/saltDocument/demo/tree/master/find_window>`_


.. code-block:: cpp

    // QTableWidget
    this->ui->tablewidget->setSelectionBehavior(QAbstractItemView::SelectRows);  //单击选择一行  
    this->ui->tablewidget->setSelectionMode(QAbstractItemView::SingleSelection); //设置只能选择一行，不能多行选中  
    this->ui->tablewidget->setEditTriggers(QAbstractItemView::NoEditTriggers);   //设置每行内容不可更改  
    this->ui->tablewidget->setAlternatingRowColors(true);                        //设置隔一行变一颜色，即：一灰一白 



* `环境变量 - setProcessEnvironmen  <https://blog.csdn.net/nicai_xiaoqinxi/article/details/90207538>`_


.. code-block:: bash

    # install qt4
    $ sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer -y --force-yes

    # qtcreator-3.5.1 depends
    $ sudo apt-get install libgstreamer-plugins-base0.10-0



StyleSheet   
--------------------


.. code:: sh

    sudo apt-get install ttf-wqy-zenhei fonts-wqy-microhei #安装字体

    fc-list # 查看字体命令

.. code::

    font: bold;  是否粗体显示
    border-image:"";  用来设定边框的背景图片。
    border-radius:5px;  用来设定边框的弧度。可以设定圆角的按钮
    border-width: 1px；  边框大小


    font-family:"微软雅黑";  来设定字体所属家族，
    font-size:20px;      来设定字体大小
    font-style:"";       来设定字体样式
    font-weight:20px;    来设定字体深浅

    background-color: green;  设置背景颜色
    background:transparent;   设置背景为透明
    color:rgb(241, 70, 62);   设置前景颜色
    selection-color:rgb(241, 70, 62);  用来设定选中时候的颜色

    qproperty-alignment: AlignCenter; /*居中*/
    qproperty-text: '文字';
    qproperty-wordWrap: true; /* 自动换行*/

     

     min-height: 32px;
     max-height: 32px;
     min-width: 80px;
     max-width: 80px;
     padding: 5px;


    可以使用border-top，border-right，border-bottom，border-left分别设定按钮的上下左右边框，
    同样有border-left-color, border-left-style, border-left-width.等分别来设定他们的颜色，样式和宽度


.. code::  

        /************************ 
        *   横向 Slider 
        ************************/
        QSlider::groove:horizontal {
                border: 1px solid #4A708B;
                background: #C0C0C0;
                height: 5px;
                border-radius: 1px;
                padding-left:-1px;
                padding-right:-1px;
        }
         
        QSlider::sub-page:horizontal {
                background: qlineargradient(x1:0, y1:0, x2:0, y2:1, 
                    stop:0 #B1B1B1, stop:1 #c4c4c4);
                background: qlineargradient(x1: 0, y1: 0.2, x2: 1, y2: 1,
                    stop: 0 #5DCCFF, stop: 1 #1874CD);
                border: 1px solid #4A708B;
                height: 10px;
                border-radius: 2px;
        }
         
        QSlider::add-page:horizontal {
                background: #575757;
                border: 0px solid #777;
                height: 10px;
                border-radius: 2px;
        }
         
        QSlider::handle:horizontal {
            background: qradialgradient(spread:pad, cx:0.5, cy:0.5, radius:0.5, fx:0.5, fy:0.5, 
            stop:0.6 #45ADED, stop:0.778409 rgba(255, 255, 255, 255));
         
            width: 11px;
            margin-top: -3px;
            margin-bottom: -3px;
            border-radius: 5px;
        }
         
        QSlider::handle:horizontal:hover {
            background: qradialgradient(spread:pad, cx:0.5, cy:0.5, radius:0.5, fx:0.5, fy:0.5, stop:0.6 #2A8BDA, 
            stop:0.778409 rgba(255, 255, 255, 255));
         
            width: 11px;
            margin-top: -3px;
            margin-bottom: -3px;
            border-radius: 5px;
        }
         
        QSlider::sub-page:horizontal:disabled {
                background: #00009C;
                border-color: #999;
        }
         
        QSlider::add-page:horizontal:disabled {
                background: #eee;
                border-color: #999;
        }
         
        QSlider::handle:horizontal:disabled {
                background: #eee;
                border: 1px solid #aaa;
                border-radius: 4px;
        }


        /************************ 
        *   纵向 Slider 
        ************************/

        QSlider::groove:vertical {
                border: 1px solid #4A708B;
                background: #C0C0C0;
                width: 5px;
                border-radius: 1px;
                padding-left:-1px;
                padding-right:-1px;
                padding-top:-1px;
                padding-bottom:-1px;
        }
         
        QSlider::sub-page:vertical {
                background: #575757;
                border: 1px solid #4A708B;
                border-radius: 2px;
        }
         
        QSlider::add-page:vertical {
                background: qlineargradient(x1:0, y1:0, x2:0, y2:1, 
                    stop:0 #c4c4c4, stop:1 #B1B1B1);
                background: qlineargradient(x1: 0, y1: 0.2, x2: 1, y2: 1,
                    stop: 0 #5DCCFF, stop: 1 #1874CD);
                border: 0px solid #777;
                width: 10px;
                border-radius: 2px;
        }
         
        QSlider::handle:vertical 
        {
                background: qradialgradient(spread:pad, cx:0.5, cy:0.5, radius:0.5, fx:0.5, fy:0.5, stop:0.6 #45ADED, 
                stop:0.778409 rgba(255, 255, 255, 255));
         
                height: 11px;
                margin-left: -3px;
                margin-right: -3px;
                border-radius: 5px;
        }
         
        QSlider::sub-page:vertical:disabled {
                background: #00009C;
                border-color: #999;
        }
         
        QSlider::add-page:vertical:disabled {
                background: #eee;
                border-color: #999;
        }
         
        QSlider::handle:vertical:disabled {
                background: #eee;
                border: 1px solid #aaa;
                border-radius: 4px;
        }

常见问题   
------------------

* `Ubuntu下Qtcreator无法输入中文的解决办法 <https://blog.csdn.net/baidu_33850454/article/details/81212026>`_

..
 Music 命运守护夜

.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=300 
    src="https://music.163.com/outchain/player?type=0&id=821701962&auto=1&height=430">
    </iframe>


