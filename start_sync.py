#/usr/bin/env python

import commands
from  time import sleep
import sys

from loginit import init_logger
import logging

init_logger("/tmp/my_space.log")


def build():

    ret = commands.getoutput("make html")
    logging.info(ret)

def update_apache2_www():

    ret = commands.getoutput("rm -rf /var/www/html/")
    logging.info(ret)
    ret = commands.getoutput("cp -rf build/html/* /var/www/html/")
    logging.info(ret)
    

while True:
    status,ret_str = commands.getstatusoutput("git pull mc_origin master")
    #print  status  
    #print ret_str
    if str(ret_str).find("Already up-to-date") != -1:
        #print "Already up-to-date"
        logging.info("Already up-to-date")
        #print " .",
        #sys.stdout.flush()
    else:
        #print "."
        #print "building... "
        build()
        update_apache2_www()
    sleep(2)
        
