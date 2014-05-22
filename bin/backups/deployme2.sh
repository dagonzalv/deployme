 #!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------------------
# --  by Daniel Gonzalez Valdivia <dagonzalv@gmail.com>  Deployme V 1.5   2012-04-18  
# ----------------------------------------------------------------------------------------------------------------------------------


WL=${1}
#IP_SERVER_PORT=${2}
ACTION=${2}
COMP=${3}
PATH_ORIGIN=${4}
#TARG=${6}

DATE=`date "+%Y%m%d%H%M"`
DEPLOYME_HOME="/opt/apps/deployme"


# ----------------------------------------------------------------------------------------------------------------------------------
# -- Header's preload  AND  Functions -->
# ----------------------------------------------------------------------------------------------------------------------------------
sh ${DEPLOYME_HOME}/scripts/test/backups/welcome.sh


#Hace un ls a todos los archivos de configuracion de cada componente.

 load_config_files(){
   OATH="${DEPLOYME_HOME}/conf"
   CONF_FILES=`ls ${OATH}/*.conf`
    echo  ${CONF_FILES}
 }


#carga la informacion que esta en el archivo de conf para usar sus variables.
load_enviroment_from_config(){
   CONFIG_FILE=$1
   . ${CONFIG_FILE}
 }


# ----------------------------------------------------------------------------------------------------------------------------------
# --  within parameters
# ----------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "" ]
 then
  sh ${DEPLOYME_HOME}/bin/examples.sh    
fi




# ----------------------------------------------------------------------------------------------------------------------------------
# -- IF EXECUTE deployme.sh with parameters
# ----------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "wl10" ]
 then
	 #BEA_HOME="/opt/apps/wl10mp3/user_projects/domains/wlsnxt"
	 JAVA_HOME="/usr/java/java6"
	 WL_HOME="/opt/apps/wl10mp3/wlserver_10.3"
	 . "${WL_HOME}/server/bin/setWLSEnv.sh"
	 CLASSPATH="${CLASSPATH}:${WL_HOME}/common/eval/pointbase/lib/pbembedded57.jar:\
	           		 ${WL_HOME}/common/eval/pointbase/lib/pbtools57.jar:\
				 ${WL_HOME}/common/eval/pointbase/lib/pbclient57.jar"


   	#main
   	CONFIG_FILES=`load_config_files`
   	#TIME=`/bin/date "+%Y%m%d-%H%M"`
       	for CONFIG_FILE in ${CONFIG_FILES}
   	 do
                COMP_ARA=`ls $CONFIG_FILE | sed 's/\/opt\/apps\/deployme\/conf\///g' | cut -d "." -f 1`
              
                if [ ${COMP_ARA} = ${COMP} ]
		   then
		      load_enviroment_from_config ${CONFIG_FILE} 
			
		       if [ ${ACTION} = "stop" ]
		          then
				echo " STOPING  ${CMP} ...."
				echo ""

				  COMAND="-adminurl t3://${URL} \
					  -userconfigfile ${USRCFGFILE} \
					  -userkeyfile ${KEYFILE} \
					  -stop \
					  -name ${CMP}"

						java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
                       fi

                       if [ ${ACTION} = "start" ]
			  then
				 echo " STARTING  ${CMP} ...."
				 echo ""

				   COMAND="-adminurl t3://${URL} \
 				           -userconfigfile ${USRCFGFILE} \
					   -userkeyfile ${KEYFILE} \
					   -start \
					   -name ${CMP}"

					        java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
		       fi

		       if [ ${ACTION} = "deploy" ]
			  then
			       SIGN=`openssl dgst -md5 ${4}`
			       echo " The Signature of the component (MD5) ${3}  to deploy is : ${SIGN}"
			       echo " "
			       echo " DEPLOYING  ${CMP} ...."


				    COMAND="-adminurl t3://${URL} \
				   	    -userconfigfile ${USRCFGFILE} \
					    -userkeyfile ${KEYFILE} \
					    -deploy \
				   	    -name ${CMP} \
				   	    -source ${PATH_ORIGIN} \
					    -targets ${TARG} \
 					    -stage"

					     java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log

		       fi


			if [ ${ACTION} = "undeploy" ]
			   then
			       echo " "
				echo " UNDEPLOYING  ${CMP} ...."

					COMAND="-adminurl t3://${URL} \
						-userconfigfile ${USRCFGFILE} \
						-userkeyfile ${KEYFILE} \
						-undeploy \
						-name ${CMP}"

						java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
			fi

                fi
       done
fi
