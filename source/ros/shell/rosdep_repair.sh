#!/usr/bin/env bash

# 参考: https://blog.csdn.net/leida_wt/article/details/115120940

GHPROXY='https:\/\/ghproxy.com\/'

# 1
if [ -f /usr/lib/python2.7/dist-packages/rosdep2/sources_list.py.bak ]; then
	echo "PASS to EXIT!!!!!!"
	exit 0
else

	sudo cp -rvf /usr/lib/python2.7/dist-packages/rosdep2/sources_list.py \
	             /usr/lib/python2.7/dist-packages/rosdep2/sources_list.py.bak

	sudo sed -i "311s/^/        url=\"${GHPROXY}\"+url\n/" \
		/usr/lib/python2.7/dist-packages/rosdep2/sources_list.py
fi


# 2
sudo sed -i "68s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdistro/__init__.py


# 3
sudo sed -i "36s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdep2/gbpdistro_support.py


# 4
sudo sed -i "72s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdep2/sources_list.py


# 5
sudo sed -i "39s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdep2/rep3.py


# 6
sudo sed -i "68s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdistro/manifest_provider/github.py

sudo sed -i "119s/https:\/\//${GHPROXY}/" \
	/usr/lib/python2.7/dist-packages/rosdistro/manifest_provider/github.py

# 7
sudo sed -i "204s/^/        gbpdistro_url=\"${GHPROXY}\"+gbpdistro_url\n/" \
	/usr/lib/python2.7/dist-packages/rosdep2/gbpdistro_support.py


