###########
Git
###########

* `Git Community Book 中文版 <http://gitbook.liuhui998.com/index.html>`_
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

****************
Git 安装与配置 
****************

* `Git flow completion <https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion>`_

************
Git 常用命令 
************

git config 
============

.. code-block:: sh

    $ git config --global -e  # 默认为 --global
    $ git config  -e    # or git config --edit
    $ git config --list 
    $ git config --global core.editor vim  # 配置默认编辑器 vim

    #  代理服务哦
    $ git config --global http.proxy  socks5://127.0.0.1:1080 # 代理服务器
    $ git config --global https.proxy socks5://127.0.0.1:1080 
    
    $ git config --global --unset http.proxy   # 撤销代理服务器
    $ git config --global --unset https.proxy

    $ git config --global --get http.proxy   # 查询理服务器
    $ git config --global --get https.proxy

撤销与回退 
============

.. code-block:: sh

    $ git rm    --cached path              # 撤销add 文件
    $ git rm -r --cached path              # 撤销add 目录

    $ git checkout <commit_id> <path>      # 回退单个文件到某一次提交
    $ git checkout <branc_name> -- <path>  # checkout file from a brach

    $ git revert <commit_id>
    # git revert是用一次新的commit来回滚之前的commit, 而git reset是直接删除指定的commit。

    $ git commit --amend                   # 修改commit 备注信息

Create New branch   
==================

.. code-block:: sh

    $ git branch  <new_branch_name> <commit_id>  
    $ git checkout -b  <new_branch_name> <commit_id>  

Gitignore   
============


.. code-block:: sh

    # 忽略,指定文件之外的所有文件
    $ tee .gitignore <<-'EOF'
    /*

    ! Dockerfile
    ! init.sh
    ! sources.list
    ! readme.md
    EOF


`git log <http://blog.csdn.net/wh_19910525/article/details/7468549>`_
=============================================================================

.. code-block:: sh

    $ git log --stat  #  --stat，查看修改了那些文件,仅显示简要的增改行数统计

    # https://www.cnblogs.com/Sir-Lin/p/6064844.html
    $ git log -- filename  <path>  # 查看某文件的修改历史
    $ git show <commit-id> <path>
    $ git log -b <branch_name> 


* `git cherry-pick <https://www.jianshu.com/p/08c3f1804b36>`_

.. code-block:: sh

    $ git cherry-pick xxx

.. code-block:: sh

    $ git add  <path>

    #####################
    # about git diff
    #####################

    $ git diff --cached
    # Compare files from two different branches
    $ git diff <branch_name> <another_branch_name> -- <path>

.. code-block:: sh

    $ git pull --rebase origin master


git submodule 
================

.. code-block:: sh
    
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


git patch   
============

.. code-block:: sh

    ########################################
    # 当前分支，打patch
    ########################################
    # 1、生成patch(在代码修改后没有commit之前的状态执行，进入想生成patch的目录即可)
    git diff > project.patch
    # 2、打patch，方法和linux的diff一样
    patch -p0 < project.patch
    git apply project.patch  //也可用这个命令打patch
    
    ###################################################  
    # 不同分支,不同文件，打pacth, 
    # 将 my_dev 对比 master的修改，打成path
    ################################################### 
    git diff master my_dev -- src/view/setting/other_seting.py > other_seting.py.pacth

    # 此时branch 位于 master 
    git apply other_seting.py.pacth


************
Send Mail   
************


.. code-block:: sh

    $ sudo apt-get install -y git-email  
    
    # config 
    $ git config --local user.email "jiang_xmin@massclouds.com"
    $ git config --local user.name  "jiang_xmin"
    $ git config --local sendemail.smtpserver     "smtp.qiye.163.com"
    $ git config --local sendemail.smtpencryption "tls"
    $ git config --local sendemail.smtpuser        "jiang_xmin@massclouds.com"
    $ git config --local sendemail.smtpserverport "25"
    # git config --local sendemail.smtppass       'passwd'

    $ git config --local sendemail.annotate     true
    $ git config --local sendemail.chainreplyto true
    $ git config --local sendemail.confirm      always 
    $ git config --local sendemail.to jxm_zn@163.com  # sendo to 

    # send 
    $ git send-email --no-chain-reply-to --annotate --confirm=always --to=jxm_zn@163.com  master -1 



********
Github  
********

* `Syncing a fork <https://help.github.com/articles/syncing-a-fork/>`_


************
Gitlab_
************

.. _Gitlab : https://gitlab.com


搭建Gitlab 
================

.. code-block:: sh

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


.. code-block:: sh

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

.. code-block:: sh

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
    [true]: false

    Please enter the executor: ssh, docker+machine, docker-ssh+machine, kubernetes, docker, parallels, virtualbox, docker-ssh, shell:
    docker

    Please enter the Docker image (eg. ruby:2.1):
    alpine:latest

* `Using Docker images <https://docs.gitlab.com/ee/ci/docker/using_docker_images.html>`_
* `Using Docker Build <https://docs.gitlab.com/ce/ci/docker/using_docker_build.html>`_

.. code-block:: sh

    $ sudo docker exec -it gitlab-public-runner gitlab-runner register -n \
            --url "https://gitlab.com/" \
            --registration-token "REGISTRATION_TOKEN" \
            --executor docker \
            --description 2.3-docker-gitlab-runner  \
            --docker-image ubuntu:14.04  \
            --docker-privileged true\
            --locked false \
            --run-untagged true \
            --tag-list public-runner,another-tag 

    # add volumes
    $ sudo docker exec -it gitlab-public-runner gitlab-runner register -n \
            --url https://gitlab.com/ \
            --registration-token REGISTRATION_TOKEN \
            --executor docker \
            --description "My Docker Runner" \
            --docker-image "docker:latest" \
            --docker-volumes /var/run/docker.sock:/var/run/docker.sock



3. gitlab-ci.yml
------------------

* `通过 .gitlab-ci.yml配置任务 <https://fennay.github.io/gitlab-ci-cn/gitlab-ci-yaml.html>`_
* `Configuration of your jobs with .gitlab-ci.yml <https://docs.gitlab.com/ee/ci/yaml/README.html>`_

4. gitlab-runner 常用命令
--------------------------

.. code-block:: sh

    $ sudo gitlab-runner register
    $ sudo gitlab-runner unregister --name "name"
    $ sudo gitlab-runner list
    $ sudo gitlab-runner verify

Triggering pipelines through the API
============================================

* https://docs.gitlab.com/ee/ci/triggers/#adding-a-new-trigger

.. code-block:: sh

    curl -X POST \
         -F token=c180975fb840ba2b5c942347a58f90 \
         -F ref=master \
         http://192.168.1.102/api/v4/projects/7/trigger/pipeline


downloading-the-latest-artifacts
====================================
 
* `downloading-the-latest-artifacts <https://docs.gitlab.com/ce/user/project/pipelines/job_artifacts.html#downloading-the-latest-artifacts>`_
* `download-the-artifacts-archive <https://docs.gitlab.com/ee/api/jobs.html#download-the-artifacts-archive>`_
* `download-a-single-artifact-file <https://docs.gitlab.com/ee/api/jobs.html#download-a-single-artifact-file>`_

.. code-block:: sh

    # pirvite  project
    curl -L  --header "PRIVATE-TOKEN: nDU2GenxaCiNouREB91n"  \
        "http://192.168.1.102/jiang_xmin/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1" \
        -o artifacts.zip

    # public project
    curl -L -o artifacts.zip \
    "http://192.168.1.102/jiang_xmin/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1"
    
    wget -O artifacts.zip  \
    http://192.168.1.102/jiang_xmin/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1
    
    #### 
    curl -L -o mcstudent_offline_4.2.1-11-g54157f0_amd64.deb \
    http://192.168.1.102/jiang_xmin/mc-terminal/-/jobs/artifacts/4.2.0-dev/raw/BUILD/mcstudent_offline_4.2.1-11-g54157f0_amd64.deb?job=job1

    wget -O mcstudent_offline_4.2.1-11-g54157f0_amd64.deb \
    http://192.168.1.102/jiang_xmin/mc-terminal/-/jobs/artifacts/4.2.0-dev/raw/BUILD/mcstudent_offline_4.2.1-11-g54157f0_amd64.deb?job=job1


Advanced
========

* `Install GitLab Runner <https://docs.gitlab.com/runner/install/>`_
* `用 GitLab CI 进行持续集成 <https://segmentfault.com/a/1190000006120164>`_
* `Gitlab CI yaml官方配置文件翻译 <https://github.com/Fennay/gitlab-ci-cn>`_
* `Advanced configuration <https://docs.gitlab.com/runner/configuration/advanced-configuration.html>`_
* `GitLab Runner Commands  <https://docs.gitlab.com/runner/commands/README.html>`_

.. code-block:: sh

    $ sudo gitlab-runner register
    $ sudo gitlab-runner register -c "$HOME/.gitlab-runner/config.toml"

    $ sudo gitlab-runner unregister --name "name"
    $ sudo gitlab-runner list
    $ sudo gitlab-runner verify

* `gitlab runner 遇到的几个坑 <http://www.jianshu.com/p/d91387b9a79b>`_
* `GitLab-CI与GitLab-Runner <http://www.jianshu.com/p/2b43151fb92e>`_
* `[后端]gitlab之gitlab-ci自动部署  <http://www.jianshu.com/p/df433633816b?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation>`_

**************
Travis CI     
**************


* `docs.travis-ci <https://docs.travis-ci.com/>`_

* `持续集成服务 Travis CI 教程 <http://www.ruanyifeng.com/blog/2017/12/travis_ci_tutorial.html>`_

* `用Travis CI给android项目部署Github release <http://kescoode.com/travis-ci-android-github-release/>`_
* `基于Travis CI搭建Android自动打包发布工作流（支持Github Release及fir.im） <https://avnpc.com/pages/android-auto-deploy-workflow-on-travis-ci>`_

* `用Github、Travis-CI集成发布app遇到的坑 <https://www.jianshu.com/p/fac8ccc8373b>`_

* `如何简单入门使用Travis-CI持续集成 <https://github.com/nukc/how-to-use-travis-ci>`_

* https://github.com/gopl/ci

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

