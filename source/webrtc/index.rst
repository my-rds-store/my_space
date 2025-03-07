WebRTC
===============

.. code::

    要使用 WebRTC 实现视频传输，需要先了解一些基本的概念和原理。WebRTC 是一种实时通信协议，用于在网页浏览器之间实现音频、视频和数据的传递。它基于 HTML5 和 JavaScript 技术，可以直接在浏览器中运行而不需要任何插件。

    想要使用 Python 进行 WebRTC 的开发，可以考虑使用 Python 的 web 框架 Flask 或者 Django。这两个框架都提供了路由和模板等相关功能，可以方便你进行业务逻辑的开发。

    另外推荐使用 webrtc-native，这是一个 Python 包，它提供了一组 Python 的 API，允许你使用 WebRTC 协议进行音频/视频传输等功能的开发。

    当然，如果你对 WebRTC 的底层技术比较熟悉，你也可以直接使用 Python 的网络编程模块（如 socket）以及 WebRTC 原生的 API 进行开发。

    总体而言，要实现 WebRTC 的视频传输，需要以下步骤：

    使用 Python 框架搭建服务器，并设置好相应的路由。

    使用 webrtc-native，或者用 Python 配合 WebRTC 原生的 API 来实现 SDP 协议的生成和交换。

    实现基于 WebRTC 的音视频数据传输功能。

    在客户端使用 WebRTC API，建立本地的媒体流，并在连接成功后将其传输给服务器端。

    实现 WebRTC 点对点的连接和通讯功能。

    希望这些信息对你有所帮助！

Demo
----------------

* https://gitee.com/learn_web/web-rtc-test.git


环境搭建
------------
* `webrtc-streamer <https://hub.docker.com/r/mpromonet/webrtc-streamer>`
    * 支持arm64
    * 局域网，手机浏览器可以显示图像，但是 pc端 浏览器，不显示图像

* 待验证
    * `Webrtc服务器搭建(基于局域网环境) <https://blog.csdn.net/gladsnow/article/details/77900333>`_



`npm下载源 <https://www.cnblogs.com/echohye/p/18149863>`_
====================================================================


官方的源地址： https://registry.npmjs.org/

由于服务器在海外，国内访问速度会慢很多。下面是我搜集的一些npm国内的镜像源

============== ================================================= ======================
源名称	        npm源地址	                                        推荐指数
============== ================================================= ======================
淘宝新镜像源	  https://registry.npmmirror.com	                   ★★★★
腾讯云镜像源	  http://mirrors.cloud.tencent.com/npm/	             ★★★
华为云镜像源	  https://mirrors.huaweicloud.com/repository/npm/	   ★★★
cnpm镜像地址	  http://registry.cnpmjs.org	                       ★★
============== ================================================= ======================


    2、修改npm源

.. code::

    2.1、临时修改
        如果只是在某一次使用源，可以临时修改，通过在install命令前加上--registry 源地址即可：

    示例：使用淘宝npm源下载cnpm
        npm --registry https://registry.npmmirror.com install cnpm
    2.2、永久修改
      永久配置，直接使用指令修改：

      npm config set registry https://registry.npmmirror.com

    修改之后生效如下，查询npm配置的源：

      npm config get registry
