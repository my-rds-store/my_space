Git 使用总结
==============

* `Git 教程 <https://git-scm.com/book/zh/v2>`_
* `Pro Git(中文版)  <http://git.oschina.net/progit/>`_
* `码云平台帮助文档 <http://git.mydoc.io/>`_

* `git rebase简介 <http://blog.csdn.net/hudashi/article/details/7664631/>`_

* `Git使用流程规范 <http://www.jizhuomi.com/software/436.html>`_

* `git-学习 <http://blog.csdn.net/jxm_csdn/article/details/51793607>`_

* `Gitlab 项目分支管理的一种策略 <https://segmentfault.com/a/1190000006062453>`_
* `Releases <http://docs.gitlab.com/ce/workflow/releases.html>`_


Git 常用命令 
-------------

git config 
^^^^^^^^^^^

.. code-block:: bash

    $ git config --global -e

    # 默认为 --global
    $ git config  -e     # or git config --edit
    $ git config --list 
    $ git config user.name 
    $ git config --global core.editor vim  # 配置默认编辑器 vim
    $ git rm --cached path            # 撤销add
    $ git checkout <commit_id> <path> # 回退单个文件到某一次提交

    $ git commit --amend              # 修改commit 备注信息


`git log <http://blog.csdn.net/wh_19910525/article/details/7468549>`_
----------------------------------------------------------------------------

.. code-block:: bash

    $ git log --stat  #  --stat，查看修改了那些文件,仅显示简要的增改行数统计

    # https://www.cnblogs.com/Sir-Lin/p/6064844.html
    $ git log -- filename  <path>  # 查看某文件的修改历史
    $ git show <commit-id> <path>
 


git submodule 
^^^^^^^^^^^^^^

.. code-block:: bash
    
    git submodule add url path/to/name 
    git submodule add <repo> <dir>          # 添加 子模块
                                            # 删除 子模块

    git submodule init                      # 初始化子模块
    git submodule status                    # 状态
    git submodule update                    # 更新子模块
    git submodule foreach git pull          # 拉取所有子模块

    git clone <repository> --recursive      # 递归的方式克隆整个项目
    git submodule update --init --recursive # 更新子模块



git tag 
^^^^^^^^^^^^^^

.. code-block:: sh

    # 打TAG也就是发布版本
    $ git tag -a v1.4 -m "version 1.4"
    $ 
    $ git push --tags
    $ git push my_origin --tags

如果还不能理解可以到这里看看是linus是怎么给Linux内核打的TAG，TAG看起来像什么：https://github.com/torvalds/linux/releases


搭建Gitlib
-------------

.. code-block:: bash

     docker run --name='gitlab-ce' -d \
	   -p 10022:22 -p 10080:80 \
	   --restart always \
	   --volume /data/gitlab/config:/etc/gitlab \
	   --volume /data/gitlab/logs:/var/log/gitlab \
	   --volume /data/gitlab/data:/var/opt/gitlab \
	   gitlab/gitlab-ce

     sudo docker run --detach \
         --hostname gitlab.example.com \
         --env GITLAB_OMNIBUS_CONFIG="external_url 'http://192.168.8.100:10080'; gitlab_rails['lfs_enabled'] = true;" \
         --publish 10443:443 --publish 10080:10080 --publish 10022:22 \
         --name gitlab \
         --restart always \
         --volume /srv/gitlab/config:/etc/gitlab \
         --volume /srv/gitlab/logs:/var/log/gitlab \
         --volume /srv/gitlab/data:/var/opt/gitlab \
         gitlab/gitlab-ce:10.2.4-ce.0


* `指定HostName  <http://blog.csdn.net/u011054333/article/details/61532271>`_
* `gitlab docker <https://hub.docker.com/u/gitlab/>`_
* `gitlab docker 镜像 <https://hub.docker.com/r/gitlab/gitlab-ce/>`_
* `使用docker运行gitlab服务 <http://blog.csdn.net/felix_yujing/article/details/52139070>`_
* https://docs.gitlab.com/omnibus/docker/

搭建Gitlib-CI 持续集成
^^^^^^^^^^^^^^^^^^^^^^^

* gitlib-ci : https://gitlab.com

* `Install GitLab Runner <https://docs.gitlab.com/runner/install/>`_

* `用 GitLab CI 进行持续集成 <https://segmentfault.com/a/1190000006120164>`_

* `Gitlab CI yaml官方配置文件翻译 <https://github.com/Fennay/gitlab-ci-cn>`_

    ::

     /etc/gitlab-runner/config.toml

* `Advanced configuration <https://docs.gitlab.com/runner/configuration/advanced-configuration.html>`_


* `GitLab Runner Commands  <https://docs.gitlab.com/runner/commands/README.html>`_

.. code-block:: bash

    $ sudo gitlab-ci-multi-runner register
    $ sudo gitlab-runner register
    $ sudo gitlab-runner unregister --name "name"

    $ sudo gitlab-runner list
    $ sudo gitlab-runner verify

    $ sudo gitlab-runner install -n "gitlab-runner" -u root -d /var/gitlab/runner \
      -c /etc/gitlab-runner/config.toml   # ubuntu  

    $ sudo gitlab-runner uninstall -n "gitlab-runner" 

    $ sudo gitlab-runner start -n "gitlab-runner" 
    $ sudo gitlab-runner stop  -n "gitlab-runner" 

* `gitlab runner 遇到的几个坑 <http://www.jianshu.com/p/d91387b9a79b>`_

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



Other
---------

http://stackoverflow.com/questions/2144406/git-shallow-submodules

#. 同步一个COMMIT

    可以同步一个commit到本分支

.. code-block:: sh

    $ git cherry-pick xxx

#. 查看status详情

这样可以在commit之前先看一下修改详情。

.. code-block:: sh

    $ git add xxx
    $ git diff --cached


#. 不产生无用的merge的同步
有这么一种情况，用一个分支专门同步代码提供商的代码的时候，如果一般的pull会不断的产生一个merge看起来会很烦，用下边的使用添加一个--rebase就不会产生无用的merge了

.. code-block:: sh

    $ git pull --rebase origin master

#. 关于stash
适用情况：做了修改后，还没有add commit等等后续工作，现在突然要切换分支做其它事情，默认情况下你在这个分支修改的代码会被带到切换过去的分支中。可以先把你修改的保存起来。这些修改可以再还原过来。

.. code-block:: sh

    $ git stash -u

    $ xxxx 随便你的操作
    $ git stash pop

注意:-u是代表是也把添加的新文件（术语是未跟踪）也藏起来，一般是要有这个u的。

#. 恢复一个COMMIT
    如果一个COMMIT你不想要了，想要去除，可以考虑使用以下的方法；

.. code-block:: sh

    $ git revert xxxx

    这个就可以去掉这个COMMIT的改动，这个是明式的去掉，如果你又后悔了，还可以再次恢复。


FAQ
-------------



* 1. 关闭蓝灯后，push失败

    ::

      connect to 127.0.0.1 port 38897: Connection refused

.. code-block:: bash

    # 查看
    $ env | grep -i proxy

    # 清空环境变量
    $ export http_proxy=""
    $ export https_proxy=""
    $ export HTTP_PROXY=""
    $ export HTTPS_PROXY=""


* How to remove submodule

    ::

        Delete the relevant line from the .gitmodules file.
        Delete the relevant section from .git/config.
        Run git rm --cached path_to_submodule (no trailing slash).

        Remove directory .git/modules/<submodule name>

问题:

::

     ! [remote rejected] master -> master (shallow update not allowed)

解决:

::

     git fetch --unshallow
     git fetch --unshallow origin 

