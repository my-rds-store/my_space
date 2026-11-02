#######
WebRTC
#######

WebRTC 用于浏览器之间的实时音视频/数据通信。核心是信令、SDP、ICE/STUN/TURN 和 RTP。

核心概念
========

* 信令：交换 SDP 和 ICE candidate，通常用 WebSocket。
* SDP：描述媒体能力（编解码、分辨率等）。
* ICE：候选地址收集与连通性检查；STUN 获取公网地址，TURN 做中继。
* 媒体传输：SRTP/RTCP；数据通道用 SCTP。

最小验证
========

* `WebRTC samples <https://webrtc.github.io/samples/>`_
* 在 chrome://webrtc-internals 查看 ICE/连接状态。
* Python 端：`aiortc <https://github.com/aiortc/aiortc>`_ / `文档 <https://aiortc.readthedocs.io/>`_

Demo
====

* https://gitee.com/learn_web/web-rtc-test.git

环境搭建
========

* `webrtc-streamer <https://hub.docker.com/r/mpromonet/webrtc-streamer>`_
    * 支持 arm64
    * 局域网，手机浏览器可以显示图像，但 PC 端浏览器不显示图像

* 待验证
    * `Webrtc服务器搭建(基于局域网环境) <https://blog.csdn.net/gladsnow/article/details/77900333>`_

npm 下载源
==========

官方的源地址： https://registry.npmjs.org/

由于服务器在海外，国内访问速度会慢很多。下面是我搜集的一些 npm 国内的镜像源

============== ================================================= ======================
源名称	        npm源地址	                                        推荐指数
============== ================================================= ======================
淘宝新镜像源	  https://registry.npmmirror.com	                   ★★★★
腾讯云镜像源	  http://mirrors.cloud.tencent.com/npm/	             ★★★
华为云镜像源	  https://mirrors.huaweicloud.com/repository/npm/	   ★★★
cnpm镜像地址	  http://registry.cnpmjs.org	                       ★★
============== ================================================= ======================

修改 npm 源
------------

.. code-block:: bash

   # 临时修改
   npm --registry https://registry.npmmirror.com install cnpm

   # 永久修改
   npm config set registry https://registry.npmmirror.com
   npm config get registry

附：Tauri 命令
==============

.. code-block:: bash

   npm create tauri-app@latest
   npm create tauri-app@2.4.0

   wget https://github.com/AppImage/AppImageKit/releases/download/continuous/AppRun-x86_64
   chmod a+x AppRun-x86_64
   mv AppRun-x86_64 src-tauri/

   npm install
   npm run dev
   npm run tauri dev
   npm run tauri build
