###############################    D  E  P  L  O  Y  M  E   1 . 0    #####################################################
#
#  by Daniel Gonzalez Valdivia. <dagonzalv@gmail.com>
#
# Script que aplica deploy al componente especificado dentro del flujo propio del deployme

import sys
import os
import time

from java.util import Date
from java.text import SimpleDateFormat

t = Date()
today=SimpleDateFormat("yyyyMMddHHmm").format(Date())
path = "/opt/apps/nxtcomp/pruebas"
origin = "/var/samba/public/VERSIONES/deploys"
#targetss = os.system('echo $TARGETS')

targetss = os.environ['TARGT']
print "aqui "+ targetss
wltype = os.environ['WL']
print "aqui "+ wltype

dpath="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt"
dpath9="/opt/apps/wl9mp2/bea/user_projects/domains/wlsnxt"


#Invocamos el archivo que contiene el componente
archivin = open('componente.txt')

#Modulo de creacion de directorio
def createDir():
     try:
         command = "mkdir "+path+"/"+today
         os.system(command)
     except:
            print '  DON*T CREATE DIR !! '
            print dumpStack()
print 'Listo ya se creo '+path+'/'+today

def getComponent():
      try:
          os.system('cp '+origin+'/*.*ar '+path+'/'+today)
          print ' THE COMPONENT COPIED SUCCESSFULLY  !!!!'

      except:
             print R+'   THE COMPONENT COPYING FAILED?!?!?'+ECODE
             print dumpStack()
             exit()

def editing():
        edit()
        startEdit()

def activating():
    save()
    activate()

def stoppingApp():
    for linea in archivin.read().split('\n'):
        try:
            editing()
            progress=stopApplication(linea,timeout=360000)
            progress.printStatus()
            activating()
        except:
            print '  FAILED TO STOP THE APPLICATION  '
            print dumpStack()
    print '  APPLICATION STOPPED  '


def startingApp():
       for linea in archivin.read().split('\n'):
        try:
                editing()
                startApplication(linea,timeout=360000)
                activating()
        except:
            print 'FAILED TO START THE APPLICATION '
            print 'APPLICATION STARTED SUCCESSFULLY '


def pUndeploy():
     for linea in archivin.read().split('\n'):
        try:
                editing()
                progress=undeploy(linea, timeout=360000)
                progress.printStatus()
                activating()
        except:
                print '  FAILED TO UNDEPLOY THE APPLICATION  '
                print dumpStack()
     archivin.close()
     print '  APPLICATION UNDEPLOYED   '

def clearCache():
        try:
                print '  CLEARING THE CACHE  '
                command = "rm -rf "+dpath+"/servers/AdminServer/tmp/*.*"
                os.system(command)
                print '  CLEARED THE CACHE   '
        except:
                print '  FAILED TO CLEAR CACHE '

def pDeploy():
   for linea in archivin.read().split('\n'):
      try: 
          editing()
          progress=deploy(linea,path+'/'+today+'/'+linea,targets=targetss,timeout=500000)
          #progress=deploy(linea,path+'/'+today+'/'+linea,targets="svmsoe01,svmsoe02",timeout=500000)
          progress.printStatus()
          activating()
          print dumpStack()
          redirect('/opt/apps/logs/deployme/wlstdeployme.log')
      except:
          print 'FALLO ERES RE WEY'
          print dumpStack()
          

def conn():
        try:
#             CONNECTING TO THE SERVER ....   
#connect(userConfigFile='/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuserconfigfile.secure', userKeyFile='/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/myuser/keyfile.secure', 't3://10.103.12.151:9001')  
             if wltype == 'weblogic10':
                                        connect('admin','w3bAp.mar','t3://10.103.12.151:9001')
             else:
                 connect('admin','nextel123','t3://10.103.12.151:7101')
        except:
                print R+'  CONNECTION FAILED....',+ECODE
                print dumpStack()
                exit()


if __name__== "main":
        createDir()  
        getComponent()
        conn()
#        stoppingApp()  
#        pUndeploy()  
#        clearCache()  
        pDeploy()
#        startingApp()
        print ' ....DEPLOYMENT DONE...'
