#######
openbox
#######


安装chrominum-browser和googlepinyin
-----------------------------------

1. Install
^^^^^^^^^^^^^^^^^^

.. code:: sh

   $ sudo tar xzvf  chrome_and_pinyin.tgz 
   $ sudo cd  pack
   $ sudo dpkg -i *.deb
    

.. image:: ./images/install_deb.gif
       :scale: 100%
       :alt: alternate text
       :align: center

2. Config
^^^^^^^^^^^

.. code:: sh

   $ ibus  engine  googlepinyin 

.. image:: ./images/ibus_config.gif
       :scale: 100%
       :alt: alternate text
       :align: center


3. How to use
^^^^^^^^^^^^^^

.. code:: sh

    $ chromium-browser --user-data-dir=/tmp www.baidu.com

.. image:: ./images/chrome_and_ping.gif
       :scale: 100%
       :alt: alternate text
       :align: center




