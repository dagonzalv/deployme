#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------------------
#  Deployme 1.5
#  Developer:
# --  by Daniel Gonzalez Valdivia <dagonzalv@gmail.com>  Deployme V 1.5   2012-04-18  
# ----------------------------------------------------------------------------------------------------------------------------------

# --- Input Parameters
WL=${1}
ACTION=${2}
COMP=${3}
URL=${4}
PATH_ORIGIN=${5}
#TARG=${6}

DATE=`date "+%Y%m%d%H%M"`
DEPLOYME_HOME="/opt/apps/deployme"


# ----------------------------------------------------------------------------------------------------------------------------------
# -- Header's preload  AND  Functions -->
# ----------------------------------------------------------------------------------------------------------------------------------
sh ${DEPLOYME_HOME}/scripts/test/backups/welcome.sh


#Make a ls comand to all Component Configuration files.

 load_config_files(){
   OATH="${DEPLOYME_HOME}/conf"
   CONF_FILES=`ls ${OATH}/*.conf`
    echo  ${CONF_FILES}
 }


#load the information that there are , in the conf file to use the variables env 

load_enviroment_from_config(){
   CONFIG_FILE=$1
   . ${CONFIG_FILE}
 }

#Validations when the components are the same in two or more domains . That's something doesn't pass here jejeje.

validate_comp(){

  COMP_URL=$1

  if [ ${COMP_URL} = "10.103.12.15:9002" ]
	then
	BEA_HOME=${BEA_HOME}
	USRFG=${USRCFGFILE}
	KEYLE=${KEYFILE}
	TRGI=${TARG}
  fi

  if [ ${COMP_URL} = "10.103.12.15:9001" ]
    then
	BEA_HOME=${BEA_HOME}
	USRFG=${USRCFGFILE}
	KEYLE=${KEYFILE}
	TRGI=${TARG}
  fi       

  if [ ${COMP_URL} = "10.103.12.44:8010" ]
    then
        USRFG=${USRCFGFILE3}
	KEYLE=${KEYFILE3}
  fi 
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

if [ "${WL}" = "wl9" ]
 then
         #BEA_HOME="/opt/apps/wl10mp3/user_projects/domains/wlsnxt"
         JAVA_HOME="/opt/apps/jvm/java1.5"
         WL_HOME="/opt/apps/middleware/wl9mp2/bea"
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

                      validate_comp ${URL}

                       if [ ${ACTION} = "stop" ]
                          then
                                echo " STOPING  ${CMP} ...."
                                echo ""
                                 COMAND="-adminurl t3://${URL} \
                                          -userconfigfile ${USRFG} \
                                          -userkeyfile ${KEYLE} \
                                          -stop \
                                          -name ${CMP}
					  -usenonexclusivelock='true'"

                                                java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
                       fi

                       if [ ${ACTION} = "deploy" ]
                          then
                               SIGN=`openssl dgst -md5 ${5}`
                               echo " The Signature of the component (MD5) ${3}  to deploy is : ${SIGN}"
                               echo " "
                               echo " DEPLOYING  ${CMP} ...."


                                    COMAND="-adminurl t3://${URL} \
                                            -userconfigfile ${USRCFGFILE} \
                                            -userkeyfile ${KEYFILE} \
                                            -deploy \
                                            -name ${CMP} \
                                            -source ${PATH_ORIGIN} \
                                            -targets ${TRGI} \
                                            -stage" 

                                             ${JAVA_HOME}/bin/java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log

                       fi
               fi
    done

fi


# ----------------------------------------------------------------------------------------------------------------------------------
# -- IF EXECUTE deployme.sh with parameters
# ----------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "wl10" ]
 then
	 #BEA_HOME="/opt/apps/wl10mp3/user_projects/domains/wlsnxt"
	 JAVA_HOME="/opt/apps/jvm/java1.6"
	 WL_HOME="/opt/apps/middleware/wl10mp3/wlserver_10.3"
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

	              validate_comp ${URL}	    

		       if [ ${ACTION} = "stop" ]
		          then
				echo " STOPING  ${CMP} ...."
				echo ""

				  COMAND="-adminurl t3://${URL} \
					  -userconfigfile ${USRFG} \
					  -userkeyfile ${KEYLE} \
					  -stop \
					  -name ${CMP}"

						java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
                       fi

                       if [ ${ACTION} = "start" ]
			  then
				 echo " STARTING  ${CMP} ...."
				 echo ""

				   COMAND="-adminurl t3://${URL} \
 				           -userconfigfile ${USRFG} \
					   -userkeyfile ${KEYLE} \
					   -start \
					   -name ${CMP}"

					        java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log
		       fi

		       if [ ${ACTION} = "deploy" ]
			  then
			       SIGN=`openssl dgst -md5 ${5}`
			       echo " The Signature of the component (MD5) ${3}  to deploy is : ${SIGN}"
			       echo " "
			       echo " DEPLOYING  ${CMP} ...."


				    COMAND="-adminurl t3://${URL} \
				   	    -userconfigfile ${USRCFGFILE} \
					    -userkeyfile ${KEYFILE} \
					    -deploy \
				   	    -name ${CMP} \
				   	    -source ${PATH_ORIGIN} \
					    -targets ${TRGI} \
 					    -stage"

					     java weblogic.Deployer ${COMAND} 2>&1 | tee -a ${DEPLOYME_HOME}/logs/deployme.log

		       fi


			if [ ${ACTION} = "undeploy" ]
			   then
			       echo " "
				echo " UNDEPLOYING  ${CMP} ...."
				#making backup... 
				cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE}

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

#Comenzará la nueva version 1.6
