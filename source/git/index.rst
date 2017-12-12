git 使用总结
==============

* `Git 教程 <https://git-scm.com/book/zh/v2>`_
* `Pro Git(中文版)  <http://git.oschina.net/progit/>`_
* `码云平台帮助文档 <http://git.mydoc.io/>`_

* `git rebase简介 <http://blog.csdn.net/hudashi/article/details/7664631/>`_

* `git-学习 <http://blog.csdn.net/jxm_csdn/article/details/51793607>`_

* `Gitlab 项目分支管理的一种策略 <https://segmentfault.com/a/1190000006062453>`_
* `Releases <http://docs.gitlab.com/ce/workflow/releases.html>`_

搭建gitlib
-------------

.. code-block:: bash

     docker run --name='gitlab-ce' -d \
	   -p 10022:22 -p 10080:80 \
	   --restart always \
	   --volume /data/gitlab/config:/etc/gitlab \
	   --volume /data/gitlab/logs:/var/log/gitlab \
	   --volume /data/gitlab/data:/var/opt/gitlab \
	   gitlab/gitlab-ce

* `指定HostName  <http://blog.csdn.net/u011054333/article/details/61532271>`_
* `gitlab docker <https://hub.docker.com/u/gitlab/>`_
* `gitlab docker 镜像 <https://hub.docker.com/r/gitlab/gitlab-ce/>`_
* `使用docker运行gitlab服务 <http://blog.csdn.net/felix_yujing/article/details/52139070>`_
* https://docs.gitlab.com/omnibus/docker/

搭建gitlib-CI(待研究)
^^^^^^^^^^^^^^^^^^^^^

* `Install GitLab Runner <https://docs.gitlab.com/runner/install/>`_
* `Install GitLab Runner using the official GitLab repositories  <https://docs.gitlab.com/runner/install/linux-repository.html>`_
* http://www.jianshu.com/p/2b43151fb92e

* http://www.jianshu.com/p/df433633816b?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation

* http://www.jianshu.com/p/6e65075339d1?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation


.. code-block:: sh

    $ git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git

OR

.. code-block:: sh

    $ git clone https://github.com/Valloric/YouCompleteMe.git  
    $ cd crfasrnn  
    $ git submodule update --init --recursive 


Git 修改commit 备注信息
    .. code-block:: sh

        git commit --amend


子模块
---------

http://stackoverflow.com/questions/2144406/git-shallow-submodules

#. 添加子模块

.. code-block:: sh

    $ git submodule add 仓库地址 路径

#. 删除子模块

#. 状态 

.. code-block:: sh

    $ git submodule status

#. 更新子模块

.. code-block:: sh

    $ git submodule update --init --recursive

.. code-block:: sh

    $ git submodule add url path/to/name 
    $ git submodule init
    $ git submodule foreach git pull
    $ git submodule update

#. 同步一个COMMIT

    可以同步一个commit到本分支

.. code-block:: sh

    $ git cherry-pick xxx

#. Git打TAG

打TAG也就是发布版本

.. code-block:: sh

$ git tag -a v1.2 -m "version 1.4"
$ git push --tags
如果还不能理解可以到这里看看是linus是怎么给Linux内核打的TAG，TAG看起来像什么：https://github.com/torvalds/linux/releases

# .查看status详情

这样可以在commit之前先看一下修改详情。

.. code-block:: sh

    $ git add xxx
    $ git diff --cached


# .不产生无用的merge的同步
有这么一种情况，用一个分支专门同步代码提供商的代码的时候，如果一般的pull会不断的产生一个merge看起来会很烦，用下边的使用添加一个--rebase就不会产生无用的merge了

.. code-block:: sh

    $ git pull --rebase origin master

# .关于stash
适用情况：做了修改后，还没有add commit等等后续工作，现在突然要切换分支做其它事情，默认情况下你在这个分支修改的代码会被带到切换过去的分支中。可以先把你修改的保存起来。这些修改可以再还原过来。

.. code-block:: sh

    $ git stash -u

    $ xxxx 随便你的操作
    $ git stash pop

注意:-u是代表是也把添加的新文件（术语是未跟踪）也藏起来，一般是要有这个u的。

# .恢复一个COMMIT
    如果一个COMMIT你不想要了，想要去除，可以考虑使用以下的方法；

.. code-block:: sh

    $ git revert xxxx

    这个就可以去掉这个COMMIT的改动，这个是明式的去掉，如果你又后悔了，还可以再次恢复。

问题:

::

     ! [remote rejected] master -> master (shallow update not allowed)

解决:

::

     git fetch --unshallow
     git fetch --unshallow origin 
