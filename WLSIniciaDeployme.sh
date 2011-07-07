#! /bin/sh

########################   D E P L O Y M E  1.0    ####################################

## This script performs deploy applications automatically with the help of Webopse.
## This is the first script where they make the validator component to deploy and
## assign the task to be performed: deploy, undeploy, stop, start.

## by Daniel Gonz�lez Valdivia. <dagonzalv@gmail.com> 
## rights reserved@ 09-MAY-2011


#Use parameters from parametros.conf file

IPWL=`grep IP parametros.conf | cut -d "=" -f 2`
USR=`grep USER parametros.conf | cut -d "=" -f 2`
APP=`grep APP parametros.conf | cut -d "=" -f 2`
CMP=`grep COMP parametros.conf | cut -d "=" -f 2`
CMD=`grep COMD parametros.conf | cut -d "=" -f 2`
WL=`grep WEBLC parametros.conf | cut -d "=" -f 2`


LOC_PATH='/opt/apps/deployme'

echo ${LOC_PATH}


# Create a file only with the component deploy's name.
echo $CMP > componente.txt

# Load the target's parameter
export TARGETS=`grep TRGT parametros.conf | cut -d "=" -f 2`

echo $TARGETS

# validate WL environment

if [ "${WL}" = "weblogic10" ]
 then
     export WL="weblogic10"
     echo $WL
     #scp componente.txt $USR@$IPWL:/opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/webopse
     #echo "EL ARCHIVO DE COPIÓ SIN PROBLEMAS AL SERVIDOR $IPWL !!!"
       if [ "${CMD}" = "deploy" ]
          then
              # $( /home/danyboy/apps/deployme/startUpWLSPY.sh stop )
              sh ${LOC_PATH}/startUpWLSPY.sh deploy
       fi

       if [ "${CMD}" = "undeploy" ]
          then
              sh ${LOC_PATH}/startUpWLSPY.sh undeploy
       fi

       if [ "${CMD}" = "start" ]
          then
              sh ${LOC_PATH}/startUpWLSPY.sh startapp
       fi

       if [ "${CMD}" = "stop" ]
          then
              sh ${LOC_PATH}/startUpWLSPY.sh stopapp
              #ssh $USR@$IPWL sh /opt/apps/wl10mp3/bea/user_projects/domains/wlsnxt/bin/webopse/startUpWLSPY.sh stopapp
       fi
fi

if [ "${WL}" = "weblogic09" ]
 then

     export WL="weblogic09"
     echo $WL
     #scp componente.txt $USR@$IPWL:/opt/apps/wl9mp2/bea/user_projects/domains/wlsnxt/bin/webopse
     #echo "SE REALIZÓ LA COPIA AL SERVIDOR $IPWL !!!"

       if [ "${CMD}" = "deploy" ]
          then
             # $( /home/danyboy/apps/pythosn/startUpWLSPY.sh stop )
              sh ${LOC_PATH}/startUpWL09SPY.sh deploy
       fi

       if [ "${CMD}" = "undeploy" ]
          then
             sh ${LOC_PATH}/startUpWL09SPY.sh undeploy
       fi

       if [ "${CMD}" = "start" ]
          then
             sh ${LOC_PATH}/startUpWL09SPY.sh startapp 
       fi

       if [ "${CMD}" = "stop" ]
          then
             sh ${LOC_PATH}/startUpWL09SPY.sh stopapp
       fi
fi
