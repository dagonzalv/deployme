#Este ejemplo lee las lineas de un archivo,

import sys
import os

dpath="/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt"

#Invocamos el archivo que contiene el componente
#archivin = open('componente.txt')

#targetss = os.environ['TARGETS']

wltype = os.environ['WL']

print "aqui "+wltype


def editing():
        edit()
        startEdit()

def activating():
    save()
    activate()

def stoppingApp():
    
    archivin=open('componente.txt') 
    for linea in archivin.read().split('\n'):
        try:
            redirect('/opt/apps/logs/deployme/wlstdeployme.log')
            editing()
            progress=stopApplication(linea,timeout=360000)
            progress.printStatus()
            activating()
        except:
            print '  FAILED TO STOP THE APPLICATION  '
            print dumpStack()
    archivin.close()   
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
#        backup()  
#        getCode()
        conn()
        stoppingApp()  
#        pUndeploy()  
#        clearCache()  
#        pDeploy()
#        startingApp()
        print ' ....DEPLOYMENET DONE...'



