#Este ejemplo lee las lineas de un archivo,

import sys
import os
import time

from java.util import Date
from java.text import SimpleDateFormat

wltype = sys.argv[1]
user = sys.argv[2]
pwd = sys.argv[3]
url = sys.argv[4]
filenameus = sys.argv[5]
filenamepwd = sys.argv[6]


UserConfigFILE10="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuserconfigfile.secure"
KeyConfigFILE10="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuser/keyfile.secure"
URL10="t3://"+url

UserConfigFILE09="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuserconfigfile.secure"
KeyConfigFILE09="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuser/keyfile.secure"
URL09="t3://"+url


def generatekeys():
      try:
               if wltype == 'wl10':
                        storeUserConfig('/opt/apps/deployme/keys/'+filenameus,'/opt/apps/deployme/keys/'+filenamepwd)
               else:
                        storeUserConfig('/opt/apps/deployme/keys/'+filenameus,'/opt/apps/deployme/keys/'+filenamepwd)
      except:
          print 'KEYS NOT GENERATED'
          print dumpStack()



def conn():
        try:
#                  CONNECTING TO THE SERVER ....   
        
               if wltype == 'wl10':
                         connect(user,pwd,URL10)
                        #connect(userConfigFile=UserConfigFILE10, userKeyFile=KeyConfigFILE10, url=URL10)
               else: 
                        connect(user,pwd,URL09)
                        #connect(userConfigFile=UserConfigFILE09, userKeyFile=KeyConfigFILE09, url=URL09)  
        except:
                print '  CONNECTION FAILED....'
                print dumpStack()
                exit()

if __name__== "main":
        conn()
        generatekeys()      
        print ' ....CONNECTION AND CREATE AUHT FILES DONE SUCCESSFULL...'

