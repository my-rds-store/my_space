########################################
Git 常见问题
########################################

***
FAQ
***

.. code-block:: sh

    # 关闭蓝灯后，push失败
    connect to 127.0.0.1 port 38897: Connection refused

    # 查看
    $ env | grep -i proxy

    # 清空环境变量
    $ export http_proxy=""
    $ export https_proxy=""
    $ export HTTP_PROXY=""
    $ export HTTPS_PROXY=""

::

    How to remove submodule

    1. Delete the relevant line from the .gitmodules file.
    2. Delete the relevant section from .git/config.
    3. Run git rm --cached path_to_submodule (no trailing slash).

    4. Remove directory .git/modules/<submodule name>

::

     ! [remote rejected] master -> master (shallow update not allowed)

     $ git fetch --unshallow
     $ git fetch --unshallow origin 



-------


**与村下作诗一首**

.. raw:: html

    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="https://music.163.com/outchain/player?type=2&id=29436904&auto=1&height=66"></iframe>


::


    一

    有酒的日子就得死 喝一次死一次

    我在看那叶子死 那风死

    在看我死以后

    我死以后

    就让那叶子点燃我 让那风把我骨灰吹进你眼里

    你再也看不见我了

    你梦里梦见我 梦看清了我

    那是我老了的样子 我也知道你就是个婊子

    可是我真想你啊 你赤裸着给我跳舞

    给我看生活的高潮 闻死亡的味道

    二

    你啊你

    你听我喝下这酒 燃起这烟

    听我打了个嗝 听我决定要去流浪 听这世间的繁华不过尔尔

    你啊你

    你把眼睛换成星星 把身体换成我走不完的路程

    用你的一生置换我的一生

    鲜血淋漓在我的双脚上

    荆棘的不是路 而是我自己啊

    你啊 我想你定和这荆棘有所关联

    否则 我怎会痛不欲生

    烟戳在心窝上 不如你疼

    三

    故事开始在我死以后

    我死以后 清晨的太阳开始复活

    在山头唱首悲歌 唱你安宁地死在牢笼

    你被野狼啮去了肉 被鹰啄去了头 被虎剔去了骨 你的灵魂开始在大地铺陈

    在岸边谱曲挽歌 谱渔船撞上西边日落

    水鸟立在岸边歌唱 俯视水下沉船 俯视水里埋葬的夕阳

    在灯塔流浪的一生哼成调 千山万水的温情游弋喉咙里

    那些在夜晚闪过的光 在白日停留的人 化成杯里的苦酒 久久沉醉

    杯酒换盏 人去几回 一曲未落 一曲又起 我死在万千故事里

-------------

*后记（村下南北）：*

::

    我爱的不是酒，但我总跟在所有人都醉后才开始醉，可能这有点矫情。 这是一个与诗与烟相关的夜晚，自然
    酒是少不了的。今日，是一个叫做向死而生的生辰。我们总活在夜里，总在一口酒和一口烟之间念叨出零碎的
    诗，也许诗不够好，但却是相隔千万里的两个人所诞生的“孩子”。我们都有千言万语，可脱口而出的总是“你
    这个傻逼”。

    祝你生日快乐，也祝你能在往后的艰辛苦楚里快乐，干杯。

-------------

*后记（向死而生）：*

::

    我不是个好人，我们都不是什么好人。我们有什么可耻之处自己最清楚。我们变得完美的时候，就在握紧酒
    瓶的时候。我们所有苟且不堪的日子，那些所有遗忘了自己的人们，都被一气喝下，然后变成腥骚的尿。
    （村下，走一个）我不知道还能活多少年，不知道将来的日子里，还会丢失多少朋友。还好，时间永远是现
    在，那些过去的和未来的…………都在酒里，干杯。

----------

*诗歌，出自邻居的耳朵,邻居的耳朵网站已于2018年2月28日正式关停*

