#/usr/bin/env python

import commands
from  time import sleep

#ret = commands.getoutput("git pull mc_origin master")

while True:
    status,ret_str = commands.getstatusoutput("git pull mc_origin master")
    #print  status  
    print ret_str
    if ret_str.find("Already up-to-date") != -1:
        print " Already up-to-date"
    else:
        print " clone ...building... "
    sleep(3)
        
