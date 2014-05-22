#! /bin/sh

# Shell que permite generar los archivos de autentifiación de Weblogic para encriptar usuario y pwd

sh backups/welcome.sh

WL=${1}
USR=${2}
PWD=${3}
URL=${4}


if [ "${WL}" = "" ]
  then
       echo " Shell that allow to get WLST Connection test... 
       
	      Example startUpWLConnect.sh /
	    
		  with parameters : /

			 sh startUpWLConnect.sh 'wll10' 'weblogic' 'weblogic123' '10.103.12.144:9001'

			 when :
			 
			 	wl10 = weblogic Version  

			 	weblogic =  the user console 

			 	weblogic123 = the password console  
				
				10.103.12.144:9001 = url/
			 
	     		 sh startUpWLConnect.sh 'wl9''weblogic' 'weblogic123'"
fi


if [ "${WL}" = "wl10" ]
 then

	export WL_HOME="/opt/apps/wl10mp3/wlserver_10.3"
	export BEA_HOME="/opt/apps/wl10mp3/bea/user_projects/domains"
	export JAVA_HOME="/opt/java6/bin"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

        java weblogic.WLST WLConnect.py ${WL} ${USR} ${PWD} ${URL}
             
 fi

if [ "${WL}" = "wl9" ]
  then
        export WL_HOME="/opt/apps/wl9mp2/weblogic92"
	export BEA_HOME=" /opt/apps/wl9mp2/bea/user_projects/domains"
	export JAVA_HOME="/opt/java1.5/bin"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

       java weblogic.WLST WLConnect.py ${WL} ${USR} ${PWD} ${URL}
    

fi
