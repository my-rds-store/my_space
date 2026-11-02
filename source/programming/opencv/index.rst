#######
OpenCV
#######

**适用版本**：OpenCV 4.x + Python 3.12+

安装
====

.. code-block:: bash

   python3 -m pip install opencv-python

* 需要 contrib 模块时安装 opencv-contrib-python
* Ubuntu 系统包：sudo apt install python3-opencv

最小示例
========

读取并显示图片
--------------

.. code-block:: python

   import cv2

   img = cv2.imread("image.jpg")
   if img is None:
       raise SystemExit("cannot read image")

   cv2.imshow("image", img)
   cv2.waitKey(0)
   cv2.destroyAllWindows()

读取摄像头
----------

.. code-block:: python

   import cv2

   cap = cv2.VideoCapture(0)
   while True:
       ok, frame = cap.read()
       if not ok:
           break
       cv2.imshow("camera", frame)
       if cv2.waitKey(1) == 27:
           break
   cap.release()
   cv2.destroyAllWindows()

资料
====

* `OpenCV 文档 <https://docs.opencv.org/4.x/>`_
* `OpenCV Python 教程 <https://docs.opencv.org/4.x/d6/d00/tutorial_py_root.html>`_
* `OpenCV GitHub <https://github.com/opencv/opencv>`_
* `百度云盘 <https://pan.baidu.com/>`_ -- Books/OpenCV官方教程中文版（Python书签版）
