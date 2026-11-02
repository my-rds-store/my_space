思源字体安装
============

* 思源宋体
    * https://github.com/adobe-fonts/source-han-serif/releases
        * Language Specific OTFs Simplified Chinese (简体中文)

* 思源黑体
    * https://github.com/adobe-fonts/source-han-sans/releases
        * Language Specific OTFs Simplified Chinese (简体中文)

.. code-block:: bash

   # 思源宋体
   sudo mkdir -p /usr/share/fonts/opentype/SourceHanSerifSC
   sudo unzip -x ~/Downloads/09_SourceHanSerifSC.zip -d /usr/share/fonts/opentype/SourceHanSerifSC
   fc-cache -f -v
   fc-list | grep -i SourceHanSerifSC

   # 思源黑体
   sudo mkdir -p /usr/share/fonts/opentype/SourceHanSansSC
   sudo unzip -x ~/Downloads/09_SourceHanSansSC.zip -d /usr/share/fonts/opentype/SourceHanSansSC
   fc-cache -f -v
   fc-list | grep -i SourceHan
