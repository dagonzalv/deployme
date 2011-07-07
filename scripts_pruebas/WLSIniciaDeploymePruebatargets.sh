#! /bin/sh


########################   D E P L O Y M E  1.0    ####################################

## This script performs deploy applications automatically with the help of Webopse.
## This is the first script where they make the validator component to deploy and
## assign the task to be performed: deploy, undeploy, stop, start.

## by Daniel Gonz√lez Valdivia. <dagonzalv@gmail.com> 
## rights reserved@ 09-MAY-2011


#Use parameters from parametros.conf file

IPWL=`grep IP parametros.conf | cut -d "=" -f 2`
USR=`grep USER parametros.conf | cut -d "=" -f 2`
APP=`grep APP parametros.conf | cut -d "=" -f 2`
CMP=`grep COMP parametros.conf | cut -d "=" -f 2`
CMD=`grep COMD parametros.conf | cut -d "=" -f 2`
WL=`grep WEBLC parametros.conf | cut -d "=" -f 2`
TRG=`grep TRGT parametros.conf | cut -d "=" -f 2`

echo ${TRG}

LOC_PATH='/opt/apps/deployme'

echo ${LOC_PATH}


export TARGT=`grep TRGT parametros.conf | cut -d "=" -f 2`

echo $TARGT
