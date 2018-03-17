###########
Git使用总结
###########

* `Git 教程 <https://git-scm.com/book/zh/v2>`_
* `Pro Git(中文版)  <http://git.oschina.net/progit/>`_
* `码云平台帮助文档 <http://git.mydoc.io/>`_

-------------

* `Git使用流程规范 <http://www.jizhuomi.com/software/436.html>`_
* `Gitlab 项目分支管理的一种策略 <https://segmentfault.com/a/1190000006062453>`_
* `git rebase简介 <http://blog.csdn.net/hudashi/article/details/7664631/>`_

.. image:: ./image/Repository.png
    :scale: 100%
    :alt: alternate text
    :align: center

************
Git 常用命令 
************

git config 
============

.. code-block:: bash

    $ git config --global -e  # 默认为 --global
    $ git config  -e    # or git config --edit
    $ git config --list 
    $ git config --global core.editor vim  # 配置默认编辑器 vim

撤销与回退 
============

.. code-block:: bash

    $ git rm --cached path                 # 撤销add
    $ git checkout <commit_id> <path>      # 回退单个文件到某一次提交

    $ git revert <commit_id>
    # git revert是用一次新的commit来回滚之前的commit, 而git reset是直接删除指定的commit。

    $ git commit --amend                   # 修改commit 备注信息

`git log <http://blog.csdn.net/wh_19910525/article/details/7468549>`_
=============================================================================

.. code-block:: bash

    $ git log --stat  #  --stat，查看修改了那些文件,仅显示简要的增改行数统计

    # https://www.cnblogs.com/Sir-Lin/p/6064844.html
    $ git log -- filename  <path>  # 查看某文件的修改历史
    $ git show <commit-id> <path>


* `git cherry-pick <https://www.jianshu.com/p/08c3f1804b36>`_

.. code-block:: sh

    $ git cherry-pick xxx

.. code-block:: sh

    $ git add  <path>
    $ git diff --cached

.. code-block:: sh

    $ git pull --rebase origin master


git submodule 
================

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
============

.. code-block:: sh

    # 打TAG也就是发布版本
    $ git tag -a v1.4 -m "version 1.4"
    $ 
    $ git push --tags
    $ git push my_origin --tags

如果还不能理解可以到这里看看是linus是怎么给Linux内核打的TAG，TAG看起来像什么：https://github.com/torvalds/linux/releases


************
Gitlab_
************

.. _Gitlab : https://gitlab.com


搭建Gitlab 
================

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
*  https://docs.gitlab.com/omnibus/docker/


搭建Gitlab-CI 持续集成
=======================

快速使用
============


1. Install gitlab-runner
--------------------------

* https://docs.gitlab.com/runner/install/docker.html


.. code-block:: bash

    docker run -d --name gitlab-runner --restart always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      gitlab/gitlab-runner:latest

    # or
    docker run -d --name gitlab-runner --restart always \
      -v /srv/gitlab-runner/config:/etc/gitlab-runner \
      -v /var/run/docker.sock:/var/run/docker.sock \
      gitlab/gitlab-runner:latest

2. Registering Runners 
-------------------------

* https://docs.gitlab.com/runner/register/index.html

.. code-block:: bash

    $ docker exec -it gitlab-runner gitlab-runner register

    Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com )
    https://gitlab.com

    Please enter the gitlab-ci token for this runner
    xxx

    Please enter the gitlab-ci description for this runner
    [hostame] my-runner

    Please enter the gitlab-ci tags for this runner (comma separated):
    my-tag,another-tag

    Whether to run untagged jobs [true/false]:
    [false]: true

    Whether to lock Runner to current project [true/false]:
    [true]: true

    Please enter the executor: ssh, docker+machine, docker-ssh+machine, kubernetes, docker, parallels, virtualbox, docker-ssh, shell:
    docker

    Please enter the Docker image (eg. ruby:2.1):
    alpine:latest

* `Using Docker images <https://docs.gitlab.com/ee/ci/docker/using_docker_images.html>`_
* `Using Docker Build <https://docs.gitlab.com/ce/ci/docker/using_docker_build.html>`_

.. code-block:: bash

    $ docker exec -it gitlab-runner gitlab-runner register
      --url "https://gitlab.example.com/" \
      --registration-token "PROJECT_REGISTRATION_TOKEN" \
      --description "docker-gitlab-runner-description" \
      --tag-list my-tag,another-tag \
      --run-untagged true \
      --locked  true \
      --executor "docker" \
      --docker-image ubuntu:14.04 

3. gitlab-ci.yml
------------------

* `通过 .gitlab-ci.yml配置任务 <https://fennay.github.io/gitlab-ci-cn/gitlab-ci-yaml.html>`_
* `Configuration of your jobs with .gitlab-ci.yml <https://docs.gitlab.com/ee/ci/yaml/README.html>`_

4. gitlab-runner 常用命令
--------------------------

.. code-block:: bash

    $ sudo gitlab-runner register
    $ sudo gitlab-runner unregister --name "name"
    $ sudo gitlab-runner list
    $ sudo gitlab-runner verify

Advanced
========

* `Install GitLab Runner <https://docs.gitlab.com/runner/install/>`_
* `用 GitLab CI 进行持续集成 <https://segmentfault.com/a/1190000006120164>`_
* `Gitlab CI yaml官方配置文件翻译 <https://github.com/Fennay/gitlab-ci-cn>`_
* `Advanced configuration <https://docs.gitlab.com/runner/configuration/advanced-configuration.html>`_
* `GitLab Runner Commands  <https://docs.gitlab.com/runner/commands/README.html>`_

.. code-block:: bash

    $ sudo gitlab-runner register
    $ sudo gitlab-runner register -c "$HOME/.gitlab-runner/config.toml"

    $ sudo gitlab-runner unregister --name "name"
    $ sudo gitlab-runner list
    $ sudo gitlab-runner verify

* `gitlab runner 遇到的几个坑 <http://www.jianshu.com/p/d91387b9a79b>`_
* `GitLab-CI与GitLab-Runner <http://www.jianshu.com/p/2b43151fb92e>`_
* `[后端]gitlab之gitlab-ci自动部署  <http://www.jianshu.com/p/df433633816b?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation>`_

***
FAQ
***

.. code-block:: bash

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
