########################################
GitHub、GitLab 与 CI
########################################

********
Github  
********


* github的镜像网站 
    * 原 ghproxy.com 已不可用，以下示例改为直连。

.. code-block:: sh 

    # 未加速
    git clone https://github.com/Autoware-AI/autoware.ai.git 

    # 直连
    git clone https://github.com/stilleshan/ServerStatus

    wget & curl
    wget https://github.com/stilleshan/ServerStatus/archive/master.zip
    wget https://raw.githubusercontent.com/stilleshan/ServerStatus/master/Dockerfile
    curl -O https://github.com/stilleshan/ServerStatus/archive/master.zip
    curl -O https://raw.githubusercontent.com/stilleshan/ServerStatus/master/Dockerfile


* `Syncing a fork <https://help.github.com/articles/syncing-a-fork/>`_

************
Gitlab_
************

.. _Gitlab : https://gitlab.com

* `Install GitLab by using Docker <https://docs.gitlab.com/ee/install/docker/index.html>`_


搭建Gitlab 
================

.. code-block:: sh

     sudo docker run --detach \
         --hostname gitlab.example.com \
         --env GITLAB_OMNIBUS_CONFIG="external_url 'http://192.168.8.100:10080'; gitlab_rails['lfs_enabled'] = true;" \
         --publish 10443:443 --publish 10080:80 --publish 10022:22 \
         --name gitlab \
         --restart always \
         --volume /srv/gitlab/config:/etc/gitlab \
         --volume /srv/gitlab/logs:/var/log/gitlab \
         --volume /srv/gitlab/data:/var/opt/gitlab \
         gitlab/gitlab-ce:10.2.4-ce.0


     # 更改物理机主机，sshd端口 
     sudo sed -i 's/#Port\ 22/Port\ 1022/g' /etc/ssh/sshd_config
     sudo shutdown -r now

     ## 2020 
     sudo docker run --detach \
        --hostname "192.168.1.100" \
        --env GITLAB_OMNIBUS_CONFIG="gitlab_rails['lfs_enabled'] = true;" \
        --publish 10443:443 --publish 80:80 --publish 22:22 \
        --name gitlab \
        --restart always \
        --volume /srv/gitlab/config:/etc/gitlab \
        --volume /srv/gitlab/logs:/var/log/gitlab \
        --volume /srv/gitlab/data:/var/opt/gitlab \
       gitlab/gitlab-ee:13.9.1-ee.0



    ### 2024
    docker run -d --name gitlab --restart always \
        -p 9443:443 \
        -p 9980:9980 \
        -p 9922:22 \
        -v /srv/gitlab/config:/etc/gitlab \
        -v /srv/gitlab/logs:/var/log/gitlab \
        -v /srv/gitlab/data:/var/opt/gitlab \
        gitlab/gitlab-ee:14.10.5-ee.0

        #  gitlab/gitlab-ee:15.11.13-ee.0 ## OK , but vscode.dev not ok


    # external_url 'http://192.168.110.30:9980'
    # gitlab_rails['gitlab_ssh_host'] = '192.168.110.30'
    # gitlab_rails['gitlab_shell_ssh_port'] = 9922

    #  vim /opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml
    #
    # docker exec -it gitlab vi /opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml

    # docker exec -it gitlab gitlab-ctl reconfigure
    # docker exec -it gitlab gitlab-ctl restart

    # get root passwd
    # docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password


    ################
    # gitlab_pages
    ################
    pages_external_url "http://promote.pages.io:9980"
    gitlab_pages['enable'] = true


    ############################################ 
    # DNS config
    # C:\Windows\System32\drivers\etc/hosts
    # /etc/hosts
    ############################################ 

    192.168.110.30 document.promote.pages.io


    GitLab Pages examples
        https://gitlab.com/pages

* `Gitlab Pages <https://docs.gitlab.com/ee/administration/pages/index.html>`_

.. code-block:: ini

    # /srv/gitlab/config/gitlab.rb
    pages_external_url "http://192.168.1.100/"
    gitlab_pages['enable'] = true


注册限制
-----------------

.. code:: 

    1. “Admin Area”(管理员区域）。
    2. 选择 “Settings”(设置) > “General”(常规）。
    3. 在 “Sign-up Restrictions”(注册限制)
    4. 新的注册需要管理员批准


Gitlab Prometheus
-----------------

* `解决Gitlab Prometheus导致的磁盘空间不足问题 <https://blog.csdn.net/IT_Holmes/article/details/135354866>`_

.. code::

    ## gitlab/config/gitlab.rb

    prometheus['enable'] = false


.. code-block:: sh

    # 容器日志文件积累过多：容器运行时，会产生大量的日志文件，特别是当容器处于高负载或长时间运行时。
    # 容器日志通常会存储在 /var/lib/docker/containers/{container_id}/ 目录下。你可以进入该目录查看哪些文件占用了大量空间，尤其是 *-json.log 文件

    sudo du -h --max-depth=1 /var/lib/docker/containers
     ...
     302G    /var/lib/docker/containers/1460a86b4f73384ec563d71bc67b9fad2ba4790ca94c0c4a0674337f22945b06
     ...
     309G    /var/lib/docker/containers

    sudo truncate -s 0  /var/lib/docker/containers/1460a86b4f73384ec563d71bc67b9fad2ba4790ca94c0c4a0674337f22945b06/1460a86b4f73384ec563d71bc67b9fad2ba4790ca94c0c4a0674337f22945b06-json.log




Gitlab other
-----------------

* `指定HostName  <https://blog.csdn.net/u011054333/article/details/61532271>`_
* `gitlab docker <https://hub.docker.com/u/gitlab/>`_
* `gitlab docker 镜像 <https://hub.docker.com/r/gitlab/gitlab-ce/>`_
* `使用docker运行gitlab服务 <https://blog.csdn.net/felix_yujing/article/details/52139070>`_
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

3. Registering Runners 
-------------------------

.. code:: bash

    gitlab-runner register -n \
        --url "http://192.168.2.100/" \
        --registration-token "yrXA-AuQF9x7A24AxLeM" \
        --description "arm64 jigang shell" \
        --locked="true" \
        --tag-list jigang-arm64-shell\
        --run-untagged="true" \
        --executor "shell" \


    ## sudo    -->  /etc/gitlab-runner/config.toml
    ## promote -->  ~/.gitlab-runner/config.toml

    gitlab-runner register -n \
        --url "http://192.168.2.100/" \
        --registration-token "yrXA-AuQF9x7A24AxLeM" \
        --executor docker \
        --description doc-2.0-gitlab-runner  \
        --docker-image "docker:latest" \
        --docker-privileged false\
        --locked false \
        --run-untagged true \
        --tag-list public-runner,another-tag \
        --docker-volumes '/usr/share/fonts:/usr/share/fonts' \
        --docker-volumes '/home/promote/extdisk/pm_file/doc:/tmp/doc' \
        --docker-volumes '/cache'


.. code:: bash

    sudo vim /etc/systemd/system/gitlab-runner.service

.. code:: 

    Description=GitLab Runner
    After=network.target

    [Service]
    #StartLimitInterval=5
    #StartLimitBurst=10
    Type=simple
    ExecStart=/usr/bin/gitlab-runner run --working-directory /home/promote/extdisk/gitlab-runner 
    #ExecStart=/usr/bin/gitlab-runner run  -working-directory /home/promote/gitlab-runner --config /home/promote/.gitlab-runner/config.toml
    StandardOutput=syslog

    User=root
    Group=root

    #Restart=always
    #RestartSec=120

    [Install]
    WantedBy=multi-user.target


.. code:: bash

    sudo systemctl daemon-reload
    sudo systemctl enable  gitlab-runner.service
    sudo systemctl restart gitlab-runner.service 
    sudo systemctl status  gitlab-runner.service 

3. gitlab-ci.yml
------------------

* `通过 .gitlab-ci.yml配置任务 <https://fennay.github.io/gitlab-ci-cn/gitlab-ci-yaml.html>`_
* `Configuration of your jobs with .gitlab-ci.yml <https://docs.gitlab.com/ee/ci/yaml/README.html>`_

gitlab-ci 环境变量
^^^^^^^^^^^^^^^^^^^^^^^^^^^

* CI_REPOSITORY_URL 
* CI_PIPELINE_URL   
* CI_PROJECT_URL     : Project url
* CI_SERVER_NAME
* CI_COMMIT_REF_NAME : 分支名

.. code-block:: sh

    $ echo "$CI_REPOSITORY_URL"
    http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@172.19.2.57/your-username/gitlib-ci_test.git
    $ echo "$CI_PIPELINE_URL"
    http://172.19.2.57/your-username/gitlib-ci_test/pipelines/149
    $ echo "$CI_PROJECT_URL"
    http://172.19.2.57/your-username/gitlib-ci_test
    $ echo "$CI_SERVER"
    yes
    $ echo "$CI_SERVER_NAME"
    GitLab
    $ echo "$CI_COMMIT_REF_NAME"
    dev
    $ IP=`echo "$CI_PROJECT_URL" | sed "s/^http:\/\///"| sed "s/\/.*$//"`
    $ echo "$IP"
    172.19.2.57

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
        "http://192.168.1.102/your-username/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1" \
        -o artifacts.zip

    # public project
    curl -L -o artifacts.zip \
    "http://192.168.1.102/your-username/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1"
    
    wget -O artifacts.zip  \
    http://192.168.1.102/your-username/mc-terminal/-/jobs/artifacts/4.2.0-dev/download?job=job1
    
    #### 
    curl -L -o mcstudent_offline_4.2.1-11-g54157f0_amd64.deb \
    http://192.168.1.102/your-username/mc-terminal/-/jobs/artifacts/4.2.0-dev/raw/BUILD/mcstudent_offline_4.2.1-11-g54157f0_amd64.deb?job=job1

    wget -O mcstudent_offline_4.2.1-11-g54157f0_amd64.deb \
    http://192.168.1.102/your-username/mc-terminal/-/jobs/artifacts/4.2.0-dev/raw/BUILD/mcstudent_offline_4.2.1-11-g54157f0_amd64.deb?job=job1


* `Building Docker images with GitLab CI/CD <https://docs.gitlab.com/ee/ci/docker/using_docker_build.html>`_


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

* `gitlab runner 遇到的几个坑 <https://www.jianshu.com/p/d91387b9a79b>`_
* `GitLab-CI与GitLab-Runner <https://www.jianshu.com/p/2b43151fb92e>`_
* `[后端]gitlab之gitlab-ci自动部署  <https://www.jianshu.com/p/df433633816b?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation>`_

**************************
Docker 镜像托管 (待研究)    
**************************

* https://cloud.tencent.com/developer/article/1178492 


**************
Travis CI     
**************


* `docs.travis-ci <https://docs.travis-ci.com/>`_

* `持续集成服务 Travis CI 教程 <https://www.ruanyifeng.com/blog/2017/12/travis_ci_tutorial.html>`_

* `用Travis CI给android项目部署Github release <http://kescoode.com/travis-ci-android-github-release/>`_
* `基于Travis CI搭建Android自动打包发布工作流（支持Github Release及fir.im） <https://avnpc.com/pages/android-auto-deploy-workflow-on-travis-ci>`_

* `用Github、Travis-CI集成发布app遇到的坑 <https://www.jianshu.com/p/fac8ccc8373b>`_

* `如何简单入门使用Travis-CI持续集成 <https://github.com/nukc/how-to-use-travis-ci>`_

* https://github.com/gopl/ci

