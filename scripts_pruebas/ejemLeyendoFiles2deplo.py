#Este ejemplo lee las lineas de un archivo,

import sys
import os


dpath="/home/danyboy/apps/wl10mp3/user_projects/domains/wlsnxt2"

archivin = open('componente.txt')

wars=[]


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
          progress=deploy(linea,'/home/danyboy/apps/nxtcomp/wl10mp3/bck/'+linea,target='AdminServer',timeout=360000)
          progress.printStatus()
          activating()
      except:
          print 'FALLO ERES RE WEY'
          print dumpStack()
print 'ERES CHINGON YA SE DEPLOYO ESTA MADREOLA'


def conn():
        try:
#                  CONNECTING TO THE SERVER ....   
                #connect(userConfigFile=UCF, userKeyFile=UKF, url=URL)  
                connect('weblogic','nextel123','t3://127.0.0.1:7101')
        except:
                print R+'  CONNECTION FAILED....',+ECODE
                print dumpStack()
                exit()

if __name__== "main":
#        backup()  
#        getCode()
        conn()
#        stoppingApp()  
#        pUndeploy()  
#        clearCache()  
        pDeploy()
        startingApp()
        print ' ....DEPLOYMENET DONE...'



