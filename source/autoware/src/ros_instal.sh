##############################
# Install ROS  melodic
##############################
sudo apt install libc6:i386 --yes --allow-unauthenticated
#sudo apt-get install cuda-10-0

sudo apt-get install openssh-server vim --yes --allow-unauthenticated
sudo apt-get install python3-pip --yes --allow-unauthenticated
sudo apt-get install ros-melodic-desktop-full --yes --allow-unauthenticated
sudo apt-get install ros-melodic-desktop-full --yes --allow-unauthenticated --fix-missing

sudo apt-get install ros-melodic-rosbash ros-melodic-rosbash-params --yes --allow-unauthenticated 

tee ${HOME}/.bash_aliases <<-'EOF'
##################################
#  CUDA
##################################
export CUDA_HOME=/usr/local/cuda-10.0
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export CPLUS_INCLUDE_PATH=/usr/local/include/eigen3:${CPLUS_INCLUDE_PATH}  # autoware : --- stderr: glviewer

source /opt/ros/melodic/setup.bash
EOF
source /opt/ros/melodic/setup.bash


##############
sudo tee /etc/resolv.conf <<-'EOF'
nameserver 8.8.8.8
nameserver 114.114.114.114
EOF

sudo rosdep init
rosdep update

sudo apt-get install python-rosinstall \
                     python-rosinstall-generator \
                     python-wstool \
                     build-essential --yes --allow-unauthenticated


sudo apt install -y python-catkin-pkg python-rosdep ros-$ROS_DISTRO-catkin
sudo apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool 

sudo apt-get install libarmadillo-dev libglew-dev libssh2-1-dev python-flask python-requests wget --yes --allow-unauthenticated

######## pip
mkdir ${HOME}/.pip
sudo tee ${HOME}/.pip/pip.conf <<-'EOF'
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/

#(legacy|columns)
format = columns

[install]
trusted-host=mirrors.aliyun.com
EOF

#######
sudo apt-get install vim openssh-server --yes --allow-unauthenticated


# #sudo apt-get install nvidia-docker2
# sudo apt-get install curl --yes --allow-unauthenticated
# sudo apt-get install chromium-browser --yes --allow-unauthenticated
sudo apt-get install libsdl1.2-dev --yes --allow-unauthenticated
# 
# #sudo apt-get install aptitude
# #sudo aptitude install  ros-melodic-desktop-full --yes --allow-unauthenticated
