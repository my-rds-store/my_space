#coding=utf-8
import socket,sys
import time

s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)

IP=socket.gethostbyname(socket.gethostname())
s.settimeout(30) #设置超时  
s.bind((IP,1080))

print ("等待数据中。。。。")
while True:
    try:
        s.settimeout(0.02)    # 200ms 超时
        d,a=s.recvfrom(8192)

        print ("%s 在 %s发来数据 ：%s "%(a,time.ctime(),d))
#        s.sendto('[%s] %s'%(time.ctime(),d),a)  
#        print ("收到数据并且返回到：",a)  
    except socket.timeout:
        print ("时间到！")

s.close()
