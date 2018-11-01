#################
tensorflow                   
#################

* `tensorflow 中文社区 <http://www.tensorfly.cn/>`_

.. code-block:: sh

    docker pull tensorflow/tensorflow

    docker run --name="tensorflow" -d -p 8888:8888 tensorflow/tensorflow

    # nvidia-docker
    docker run  --name="tensorflow-gpu" --runtime=nvidia -it -p 8888:8888 tensorflow/tensorflow:latest-gpu

