# Qt6


* [Qt Doc](https://doc.qt.io/qt-6/index.html)
* [Qt For Python](https://doc.qt.io/qtforpython-6/index.html)

## Qt6 QML Book

* [Qt6 QML Book](https://www.qt.io/product/qt6/qml-book)


## Qt6 QML   

* [Your First QtQuick/QML Application](https://doc.qt.io/qtforpython-6/tutorials/basictutorial/qml.html)
* [Create applications with QtQuick](https://www.pythonguis.com/tutorials/pyqt6-qml-qtquick-python-application)


## 源码编译Qt6.8 

* 平台：   arm64
* dockekr image(ubuntu22.04)
    * `nvcr.io/nvidia/l4t-jetpack:r36.3.0`

```

# wget https://download.qt.io/official_releases/qt/6.8/6.8.1/single/qt-everywhere-src-6.8.1.tar.xz
wget https://mirrors.aliyun.com/qt/official_releases/qt/6.8/6.8.1/single/qt-everywhere-src-6.8.1.tar.xz

sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list # arm

apt-get install build-essential libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev gdb cmake libxcb-xinerama0-dev libfontconfig1-dev libfreetype6-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev

apt-get install cmake

apt-get install python3-html5lib

## install Node.js
apt-get install curl
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Download and install Node.js:
nvm install 22

# # Verify the Node.js version:
# node -v # Should print "v22.12.0".
# nvm current # Should print "v22.12.0".

# Verify npm version:
npm -v # Should print "10.9.0".
##


sudo apt install libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libdbus-1-dev libegl-dev libgbm-dev libgles-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev libpulse-dev libxcb-keysyms1-dev libxcb-cursor-dev libwayland-dev wayland-protocols libxrender-dev

apt install libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libdbus-1-dev libegl-dev libgbm-dev libgles-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev libpulse-dev libxcb-keysyms1-dev libxcb-cursor-dev libwayland-dev wayland-protocols libxrender-dev

#
# apt install python3 libclang-dev clang llvm ninja-build libvulkan-dev libgl1-mesa-dev libavcodec-dev libavformat-dev libopus-dev libvpx-dev libx11-xcb-dev libxcb-randr0-dev libxcb-shm0-dev libcups2-dev
# 

apt-get install git

###
# ARNING: QtWebEngine won't be built. Build requires nss >= 3.26.

apt install bison build-essential clang flex gperf \
	libatspi2.0-dev libbluetooth-dev libclang-dev libcups2-dev libdrm-dev \
	libegl1-mesa-dev libfontconfig1-dev libfreetype6-dev \
	libgstreamer1.0-dev libhunspell-dev libnss3-dev libopengl-dev \
	libpulse-dev libssl-dev libts-dev libx11-dev libx11-xcb-dev \
	libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev \
	libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev \
	libxcb-shape0-dev libxcb-shm0-dev libxcb-sync-dev libxcb-util-dev \
	libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb1-dev \
	libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev \
	libxfixes-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
	libxkbfile-dev libxrandr-dev libxrender-dev libxshmfence-dev \
	libxshmfence1 llvm ninja-build  python-is-python3 python3
	#nodejs

./configure -xcb  -no-webengine-printing-and-pdf
cmake .
cmake --build . --parallel 11
cmake --install . 

apt-get install sudo 
```

```dockerfile
# install tzdate
# 设置非交互模式，防止 tzdata 进入交互式配置
ENV DEBIAN_FRONTEND=noninteractive

# 安装 tzdata 和其他需要的软件包
RUN apt-get update && apt-get install -y tzdata

# 配置时区为 Asia/Shanghai（你可以根据需求更改）
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

# 还原 DEBIAN_FRONTEND 为 interactive（如果需要后续交互式安装）
ENV DEBIAN_FRONTEND=interactive
```