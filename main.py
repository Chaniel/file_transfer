#!/usr/bin/env python 
#encoding=utf-8

import os
import time
import datetime

Sech1=['search']
Sech2=['search']

Sech={'Sech1':Sech1,'Sech2':Sech2}

#v_host="http://hostip:port"
v_host="http://hostip:port"
v_dir="/applogs"
v_user="applogs"
v_pass="'123456'"
v_d_dir="/home/applogs"

today = datetime.date.today()
one_day = datetime.timedelta(days=1)
yesterday = today - one_day
yesterday1=yesterday.strftime('%Y%m%d')

print yesterday1
acclist=[yesterday1+"*"]
print acclist

print 'Yesterday:', yesterday
yesterday2=yesterday.strftime('%Y-%m-%d')
acclist1=[yesterday2+"*"]
print acclist1


f = open('/home/om/Sech.sh','w')

def wget(url):
        os.system(url)

host_group=Sech
for host in host_group.keys():
    for service in host_group[host]:
        for acl in acclist:
    
            cmd="wget --limit-rate=3m -b -r -c -t 3 -T 30 -q -P " + v_d_dir + "/" + host  + "/" + service +"/" + " -np -nd -A " +'"'+ "searchlog_" + acl +'"'+ " " + v_host + v_dir +"/"+ host + '/' + service + "/"+ " --http-user=" + v_user + " --http-password=" + v_pass
            print cmd    
            f.write(cmd)
            f.write('\n')
            f.write("sleep 5s\n")
f.close
