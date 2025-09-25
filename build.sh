##
# docker run -t --rm -v ~/Documents/my_space:/root/my_space --name my_space_build  my_space_build:v1 bash -c "cd my_space; make html -j5"
 docker run -t --rm -v ~/Documents/my_space:/root/my_space --name my_space_build 192.168.2.100:8086/pm-autopilot/docs_build:v2 bash -c "cd my_space; make html -j5"
#"192.168.2.100:8086/pm-autopilot/docs_build:v2"
