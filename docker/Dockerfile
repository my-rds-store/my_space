#######################
#  https://hub.docker.com/r/nimmis/alpine-apache/~/dockerfile/
# ------------------------ 

#FROM  alpine:3.5
#FROM  alpine:latest
FROM  ubuntu:18.04
MAINTAINER Jiangxumin <jxm_zn@163.com>

COPY  .pip  /root/.pip

## 设定 阿里dns
RUN echo "nameserver 223.5.5.5"    >   /etc/resolv.conf && \ 
    echo "nameserver 223.6.6.6"    >>  /etc/resolv.conf

## 更换换阿里源
RUN  sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list    

RUN DEBIAN_FRONTEND=noninteractive apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y git make graphviz python3-pip && \
    DEBIAN_FRONTEND=noninteractive  apt clean


COPY requirements.txt ./requirements.txt
RUN  python3 -m pip install --upgrade pip && \
     python3 -m pip install -r requirements.txt

WORKDIR /root
#COPY  start.py  /root/
#RUN git clone  --depth 1  https://git.oschina.net/jxm_space/my_space.git /root/my_space 
#CMD python start.py  my_space 


