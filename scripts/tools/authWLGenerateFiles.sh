#! /bin/sh

# Shell que permite generar los archivos de autentifiación de Weblogic para encriptar usuario y pwd

sh ../test/backups/welcome.sh

WL=${1}
USR=${2}
PWD=${3}
URL=${4}
USRFILE=${5}
PWDFILE=${6}


if [ "${WL}" = "" ]
  then
       echo " This shell create the Authentication's Files to Weblogic tools (WLST script). "
       echo " "
       echo " Example authWLGenerateFiles.sh /
	    
		with parameters : /

			 sh authWLGenerateFiles.sh 'wll10' 'weblogic' 'weblogic123' '10.103.12.144:9001' 'myuserconfigWLSNXT.secure' 'myuserkeyWLSNXT.secure'

			 when wl10 =  the weblogic Version 

			 weblogic =  the user console 

			 weblogic123 = the password console /
			 
	        with parameters : /
		
		         sh authWLGenerateFiles.sh 'wl9' 'weblogic' 'webl0ga' '10.103.12.144:9001' 'myuserconfigWLSNXT.secure' 'myuserkeyWLSNXT.secure'"
      echo " "
      echo " The Authentication's Files are created in keys/ Dir "
fi


if [ "${WL}" = "wl10" ]
 then

	export WL_HOME="/opt/apps/middleware/wl10mp3/wlserver_10.3"
	export BEA_HOME="/opt/apps/corefiles/domains"
	export JAVA_HOME="/opt/apps/jvm/java1.6"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

${JAVA_HOME}/bin/java weblogic.WLST WLKeyGen.py ${WL} ${USR} ${PWD} ${URL} ${USRFILE} ${PWDFILE}
             
 fi

if [ "${WL}" = "wl9" ]
  then
        export WL_HOME="/opt/apps/middleware/wl9mp2/bea"
	export BEA_HOME="/opt/apps/corefiles/domains"
	export JAVA_HOME="/opt/apps/jvm/java1.5"
	export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
	export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
	export PATH=$JAVA_HOME:$PATH

${JAVA_HOME}/bin/java weblogic.WLST WLKeyGen.py ${WL} ${USR} ${PWD} ${URL} ${USRFILE} ${PWDFILE}

fi
