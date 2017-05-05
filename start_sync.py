#/usr/bin/env python

import commands
from  time import sleep
import sys

#ret = commands.getoutput("git pull mc_origin master")

def build():

    ret = commands.getoutput("make html")
    print ret

while True:
    status,ret_str = commands.getstatusoutput("git pull mc_origin master")
    #print  status  
    #print ret_str
    if str(ret_str).find("Already up-to-date") != -1:
        #print " Already up-to-date"
        print " .",
        sys.stdout.flush()
    else:
        print "."
        print "building... "
        build()
    sleep(2)
        
