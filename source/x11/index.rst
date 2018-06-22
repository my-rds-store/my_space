######
X11   
######

***********
Install    
***********

.. code-block:: bash

    sudo apt-get install -y xorg openbox
    export DISPLAY=:0.0
    sudo xhost +local:root
     
    xinit

* `xrandr <https://wiki.archlinux.org/index.php/Xrandr_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>`_
* `窗口管理器 Openbox 入门指南 (1) <https://linuxtoy.org/archives/openbox-getting-started-guide.html#running>`_
* `Resolution <https://wiki.ubuntu.com/X/Config/Resolution>`_
* `startx 及xinit 介绍 <https://blog.csdn.net/qq_39101111/article/details/78728857>`_

.. raw:: html

    <script src="https://gist.github.com/mapix/4652350.js"></script>

* `startx <http://man.linuxde.net/startx>`_

.. code-block:: sh

    #!/bin/sh

    #  $Home/.xinitrc
    # /etc/X11/xinit/xinitrc
    #
    # global xinitrc file, used by all X sessions started by xinit (startx)

    # invoke global X session script
    # . /etc/X11/Xsession
    exec openbox-session


.. code-block:: sh

    tee  .config/openbox/autostart.sh  <<-'EOF'
    if [ `xrandr | grep eDP-1 | grep -c ' connected '` -eq 1 ]; then
	    if [ `xrandr | grep ^DP-1 | grep -c ' connected'` -eq 1 ]; then
		    # xrandr --output DP-1 --auto --primary --output eDP-1 --auto --right-of DP-1
		    xrandr --output DP-1 --auto --primary 
		    echo "==="
	    fi
	    if [ `xrandr | grep ^HDMI-1 | grep -c ' connected '` -eq 1 ]; then
		    # xrandr --output HDMI-1 --auto --primary --output eDP-1 --auto --right-of HDMI-1
		    xrandr --output HDMI-1 --auto --primary 
	    fi
    fi
    feh --bg-fill   ~/Wallpapers/background.jpeg
    # feh --bg-tile   ~/Wallpapers/tile8.jpg
    # feh --bg-center ~/Wallpapers/paperart5.jpg
    EOF


**************
自 动 登 陆   
**************

* `Ubuntu Server 16.04 免密碼自動登入  <https://justhodl.blogspot.com/2018/03/ubuntu-server-1604-auto-login-non-gui.html>`_

.. code-block:: sh

    # 登陆自启动
    tee  /root/.bash_profile <<-'EOF'
    if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
        xinit  # or start x11
    fi
    EOF
