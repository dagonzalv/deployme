#! /bin/sh

# Shell que permite generar los archivos de autentifiación de Weblogic para encriptar usuario y pwd

sh ../test/backups/welcome.sh

WL=${1}
USR=${2}
PWD=${3}
URL=${4}
COMP=${5}


if [ "${WL}" = "" ]
  then
       echo " This shell create the Authentication's Files to Weblogic tools (WLST script). "
       echo " "
       echo " Example authWLGenerateFiles.sh /
	    
		with parameters : /

			 sh manualscript.sh 'wll10' 'weblogic' 'weblogic123' '10.103.12.144:9001' 'siscob'

			 when wl10 =  the weblogic Version 

			 weblogic =  the user console 

			 weblogic123 = the password console " 
			 
		
      echo " "
fi


if [ "${WL}" = "wl10" ]
 then

	export WL_HOME="/opt/apps/wl10mp3/bea/wlserver_10.3"
	export BEA_HOME="/opt/apps/wl10mp3/bea/user_projects/domains"
	export JAVA_HOME="/opt/java6/bin"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

             
 fi

if [ "${WL}" = "wl9" ]
  then
        export WL_HOME="/opt/apps/wl9mp2/bea/weblogic92"
	export BEA_HOME=" /opt/apps/wl9mp2/bea/user_projects/domains"
	export JAVA_HOME="/opt/java1.5/bin"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

					COMAND="-adminurl t3://${URL} \
						-username ${USR} \
					        -password ${PWD} \
					        -undeploy \
              					-name ${COMP}"

            java weblogic.Deployer ${COMAND} 

fi
