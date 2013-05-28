#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------------------
# --  by Daniel Gonzalez Valdivia <dagonzalv@gmail.com>  Deployme V1.0   2012 01 15
# ----------------------------------------------------------------------------------------------------------------------------------


WL=${1}
IP_SERVER_PORT=${2}
ACTION=${3}
COMP=${4}
PATH_ORIGIN=${5}
TARG=${6}

DATE=`date "+%Y%m%d%H%M"`
DEPLOYME_HOME="/opt/apps/deployme"


# ----------------------------------------------------------------------------------------------------------------------------------
# -- Header's preload
# ----------------------------------------------------------------------------------------------------------------------------------
sh ${DEPLOYME_HOME}/scripts/test/backups/welcome.sh


# ----------------------------------------------------------------------------------------------------------------------------------
# -- IF JUST EXECUTE deployme.sh
# ----------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "" ]
 then
     echo "Examples : \
                       
     DEPLOY   
     	deployme wl10 127.0.0.1:9001 deploy FillOrderWeb /var/samba/public/VERSIONES/Componentes_E2E/NOE/FillOrderWeb.war svm01,svm02 \
     
     
     UNDEPLOY 
        deployme wl10 127.0.0.1:9001 undeploy FillOrderWeb \
     
     
     START 
        deployme wl10 127.0.0.1:9001 start FillOrderWeb \
     
     
     STOP  
        deployme wl10 127.0.0.1:9001 stop FillOrderWeb  "
fi


# ----------------------------------------------------------------------------------------------------------------------------------
# -- IF EXECUTE deployme.sh with parameters
# ----------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "wl10" ]
 then


        BEA_HOME="/opt/apps/wl10mp3/user_projects/domains/wlsnxt"
		JAVA_HOME="/usr/java/java6"
		WL_HOME="/opt/apps/wl10mp3/bea/wlserver_10.3"
		. "${WL_HOME}/server/bin/setWLSEnv.sh"
		CLASSPATH="${CLASSPATH}:${WL_HOME}/common/eval/pointbase/lib/pbembedded57.jar:\
				${WL_HOME}/common/eval/pointbase/lib/pbtools57.jar:\
				${WL_HOME}/common/eval/pointbase/lib/pbclient57.jar"


		#echo ${USRCFGFILE}
        #echo ${KEYFILE}

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    D E P L O Y    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

       if [ "${ACTION}" = "deploy" ]
            then    
             SIGN=`openssl dgst -md5 ${5}`
	     echo " The Signature of the component (MD5) ${4}  to deploy is : ${SIGN}"
	     echo " "
	     echo " DEPLOYING  ${COMP} ...."
			  
                          export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTUAT.secure
		          		  export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTUAT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                                -source ${PATH_ORIGIN} \
                                -targets ${TARG} \
								-stage "

				                       java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log         

	     echo "DEPLOY FINISH  ............ SEE ${DEPLOYME_HOME}/logs/deployme.log  FOR MORE INFORMATION." 
       	 fi

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------   U N D E P L O Y    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

       	 if [ "${ACTION}" = "undeploy" ]
            then 
	       echo " "
	       echo " UNDEPLOYING  ${COMP} ...."
               
                export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
	        	export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure

                cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE}

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-undeploy \
								-name ${COMP}"

				                     java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log


	     echo "UNDEPLOY FINISH  ............ SEE   ${DEPLOYME_HOME}/logs/deployme.log  FOR MORE INFORMATION."

	 fi

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    S T A R T    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

       	 if [ "${ACTION}" = "start" ]
            then
		 echo " "
		 echo " STARTING  ${COMP} ...."
		
		export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
		export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-start \
								-name ${COMP}"

				                                java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

	   echo "START APLICATION ${COMP} FINISH ............ SEE ${DEPLOYME_HOME}/logs/deployme.log FOR MORE INFORMATION."
       	 fi


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    S  T O P    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------


         if [ "${ACTION}" = "stop" ]
            then
                echo " "
		echo " STOPPING  ${COMP} ...."

		export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
		export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-stop \
								-name ${COMP}"

				                                java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log


           echo "STOP APLICATION ${COMP} FINISH ............ SEE ${DEPLOYME_HOME}/logs/deployme.log FOR MORE INFORMATION."
         fi
fi


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ----------------------------------   W  E  B  L  O  G  I C       9           O  P  T  I O  N  S   -------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

if [ "${WL}" = "wl9" ]
 then

	 #BEA_HOME=" /opt/apps/wl9mp2/bea/user_projects/domains/wlsnxt"
	 JAVA_HOME="/usr/java/java6"
	 WL_HOME="/opt/weblogi9/bea/weblogic92"
	 . "${WL_HOME}/server/bin/setWLSEnv.sh"
	 CLASSPATH="${CLASSPATH}:${WL_HOME}/common/eval/pointbase/lib/pbembedded51.jar:\
				 ${WL_HOME}/common/eval/pointbase/lib/pbtools51.jar:\
				 ${WL_HOME}/common/eval/pointbase/lib/pbclient51.jar"


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    D E P L O Y    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if [ "${ACTION}" = "deploy" ]
	   then
		    SIGN=`openssl dgst -md5 ${5}`
		    echo ""
		    echo " The Signature of the component (MD5) ${4}  to deploy is : ${SIGN}"
	  	    echo " "
		    echo " DEPLOYING  ${COMP} ....."

               #Validate the Web Application into the config fyle.
	           for line in $(cat ../conf/listwlsnxt.conf);
        	        do

	       			if  [ ${COMP} =  ${line} ] 
		  			then
 						export BEA_HOME="/opt/apps/wl9mp2/bea/user_projects/domains/wlsnxt/"
                                                export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
						export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure
                   
							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                             	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "
	               
				 				java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	     			fi
           	   done

                if [ ${COMP} = "NEXTEL" ]
		   			then 
 			  			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsnxtUAT"
			  			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTUAT.secure
		          		export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTUAT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                    	     	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

				                java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
                fi

                if [ ${COMP} = "ShotsOnLineApp" ]
		   			then 
 			   			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsSHOTS"
		           		export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSSHOTS.secure
			   			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSSHOTS.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                             	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

					            java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
				fi

                if [ ${COMP} = "Pis" ] || [ ${COMP} = "reportes" ]
		  			then
 			 			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsPIS"
			   			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSPIS.secure
			   			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSPIS.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                            	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

			                   java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	         	fi

		 		if [ ${COMP} = "NextelFiles" ]
                   then 
 			  			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlscreditUAT"			
			  			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSCREDITUAT.secure
			  			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSCREDITUAT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                             	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

					            java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
		 
                 fi

                if [ ${COMP} = "ReportesOperativos" ]               
                  then

 			 			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsnxtrt"
			 			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTRT.secure
			 			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTRT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                             	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

					            java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
               fi

	       		if [ ${COMP} = "banking" ]
		  			then 
 						export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsBankingIXuat"
						export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSBANKINGIXUAT.secure
						export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSBANKINGIXUAT.secure

							COMAND="-adminurl t3://${IP_SERVER_PORT} \
								-userconfigfile ${USRCFGFILE} \
								-userkeyfile ${KEYFILE} \
								-deploy \
								-name ${COMP} \
                             	-source ${PATH_ORIGIN} \
                           		-targets ${TARG} \
								-stage "

					           java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

               fi                    

	    echo ""
	    echo "DEPLOY FINISH  ............ SEE    ${DEPLOYME_HOME}/logs/deployme.log   FOR MORE INFORMATION."
	 fi

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    U N D E P L O Y    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------


         if [ "${ACTION}" = "undeploy" ]
	   then
    	    #cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE}
	    echo " "
	    echo " UNDEPLOYING  ${COMP} ....."

            for line in $(cat ../conf/listwlsnxt.conf);
                do

	       		if  [ ${COMP} =  ${line} ] 
		  		then

 			        export BEA_HOME="/opt/apps/wl9mp2/bea/user_projects/domains/wlsnxt"
 					export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
					export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure
                   
                    cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE}                                        

					COMAND="-adminurl t3://${IP_SERVER_PORT} \
						-userconfigfile ${USRCFGFILE} \
						-userkeyfile ${KEYFILE} \
						-undeploy \
						-name ${COMP}"
	               
				 		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	     		fi
			done

                if [ ${COMP} = "NEXTEL" ]
		   		   then 

 			  			 export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsnxtUAT"
			  			 export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTUAT.secure
		          		 export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTUAT.secure

                         cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				       		COMAND="-adminurl t3://${IP_SERVER_PORT} \
					       		-userconfigfile ${USRCFGFILE} \
					       		-userkeyfile ${KEYFILE} \
					       		-undeploy \
					       		-name ${COMP}"

				               		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
                fi

                if [ ${COMP} = "ShotsOnLineApp" ]
		   			then 

 			   			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsSHOTS"
		           		export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSSHOTS.secure
			   			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSSHOTS.secure

                        cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				      		COMAND="-adminurl t3://${IP_SERVER_PORT} \
		        		      		-userconfigfile ${USRCFGFILE} \
            				      	-userkeyfile ${KEYFILE} \
					      			-undeploy \
					      			-name ${COMP}"

					       			java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
				fi

                if [ ${COMP} = "Pis" ] || [ ${COMP} = "reportes" ]
		  			then

 			  			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsPIS"
			   			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSPIS.secure
			   			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSPIS.secure

                        cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				      		COMAND="-adminurl t3://${IP_SERVER_PORT} \
					      		-userconfigfile ${USRCFGFILE} \
					      		-userkeyfile ${KEYFILE} \
					      		-undeploy \
					      		-name ${COMP}"

					       		 java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	         	fi

		 		if [ ${COMP} = "NextelFiles" ]
                   then 


 			   			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlscreditUAT"			
			  			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSCREDITUAT.secure
			  			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSCREDITUAT.secure

                        cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				     	COMAND="-adminurl t3://${IP_SERVER_PORT} \
					    	 -userconfigfile ${USRCFGFILE} \
					     	 -userkeyfile ${KEYFILE} \
					     	 -undeploy \
					     	 -name ${COMP}"

					     		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
		 
                 fi

                if [ ${COMP} = "ReportesOperativos" ]               
                  then

 			   		export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsnxtrt"
				 	export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTRT.secure
			 		export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTRT.secure

                    cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				    	 COMAND="-adminurl t3://${IP_SERVER_PORT} \
					    		 -userconfigfile ${USRCFGFILE} \
                                 -userkeyfile ${KEYFILE} \
					     		 -undeploy \
					             -name ${COMP}"

					     		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
                fi

	       		if [ ${COMP} = "banking" ]
		  			then 
 			   			export BEA_HOME="/opt/weblogi9/bea/user_projects/domains/wlsBankingIXuat"
						export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSBANKINGIXUAT.secure
						export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSBANKINGIXUAT.secure

                         cp ${BEA_HOME}/config/config.xml ${BEA_HOME}/config/config.xml.rollback.${DATE} 

				    		COMAND="-adminurl t3://${IP_SERVER_PORT} \ 
					    		-userconfigfile ${USRCFGFILE} \
					    		-userkeyfile ${KEYFILE} \
					    		-undeploy \
					    		-name ${COMP}"

					    		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

               fi



           echo ""
           echo "UNDEPLOY FINISH  ............ SEE     ${DEPLOYME_HOME}/logs/deployme.log         FOR MORE INFORMATION."

         fi

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    S  T  O  P    A  C  T  I  O  N    ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

         if [ "${ACTION}" = "stop" ]
	   then
	       echo " "
	       echo " STOPPING  ${COMP} ...."

             #When the aplication list is long , we can create a aplication-file-list.conf to read the aplications nam

             for line in $(cat ../conf/listwlsnxt.conf);
                do

	       		if  [ ${COMP} =  ${line} ] 
		  		then
 					export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
					export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure
                   
					COMAND="-adminurl t3://${IP_SERVER_PORT} \
						-userconfigfile ${USRCFGFILE} \
						-userkeyfile ${KEYFILE} \
						-stop \
						-name ${COMP}"
	               
				 		java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	     		fi
		done

                if [ ${COMP} = "NEXTEL" ]
		   then 

			  export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTUAT.secure
		          export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTUAT.secure

				       COMAND="-adminurl t3://${IP_SERVER_PORT} \
					       -userconfigfile ${USRCFGFILE} \
					       -userkeyfile ${KEYFILE} \
					       -stop \
					       -name ${COMP}"

				               java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
                fi

                if [ ${COMP} = "ShotsOnLineApp" ]
		   then 

		           export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSSHOTS.secure
			   export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSSHOTS.secure

				      COMAND="-adminurl t3://${IP_SERVER_PORT} \
		        		      -userconfigfile ${USRCFGFILE} \
            				      -userkeyfile ${KEYFILE} \
					      -stop \
					      -name ${COMP}"

					       java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
		fi

                if [ ${COMP} = "Pis" ] || [ ${COMP} = "reportes" ]
		  then

			   export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSPIS.secure
			   export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSPIS.secure

				      COMAND="-adminurl t3://${IP_SERVER_PORT} \
					      -userconfigfile ${USRCFGFILE} \
					      -userkeyfile ${KEYFILE} \
					      -stop \
					      -name ${COMP}"

					       java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	         fi

		 if [ ${COMP} = "NextelFiles" ]
                   then 
			
			  export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSCREDITUAT.secure
			  export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSCREDITUAT.secure

				     COMAND="-adminurl t3://${IP_SERVER_PORT} \
					     -userconfigfile ${USRCFGFILE} \
					     -userkeyfile ${KEYFILE} \
					     -stop \
					     -name ${COMP}"

					     java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
		 
                 fi

                if [ ${COMP} = "ReportesOperativos" ]               
                  then

			 export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTRT.secure
			 export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTRT.secure

				     COMAND="-adminurl t3://${IP_SERVER_PORT} \
					     -userconfigfile ${USRCFGFILE} \
                                             -userkeyfile ${KEYFILE} \
					     -stop \
					     -name ${COMP}"

					     java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
               fi

	       if [ ${COMP} = "banking" ]
		  then 

			export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSBANKINGIXUAT.secure
			export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSBANKINGIXUAT.secure

				    COMAND="-adminurl t3://${IP_SERVER_PORT} \ 
					    -userconfigfile ${USRCFGFILE} \
					    -userkeyfile ${KEYFILE} \
					    -stop \
					    -name ${COMP}"

					    java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

               fi

               echo ""
	       echo "STOP APLICATION ${COMP} FINISH ............ SEE      ${DEPLOYME_HOME}/logs/deployme.log     FOR MORE INFORMATION."

	 fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ---------    S  T  A  R  T    A  C  T  I  O  N    -------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

 if [ "${ACTION}" = "start" ]
	   then
	        echo " "
	        echo " STARTING  ${COMP} ...."
        
            for line in $(cat ../conf/listwlsnxt.conf);
   	        do

			if [ ${COMP} = ${line} ]
		  		then

               				export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXT.secure
               				export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXT.secure


						COMAND="-adminurl t3://${IP_SERVER_PORT} \
							-userconfigfile ${USRCFGFILE} \
			        			-userkeyfile ${KEYFILE} \
							-start \
							-name ${COMP}"

							java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	
	       		fi
	      done

              if [ ${COMP} = "NEXTEL" ]
		   then

				     export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTUAT.secure
				     export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTUAT.secure
				  	              
					        COMAND="-adminurl t3://${IP_SERVER_PORT} \
					                -userconfigfile ${USRCFGFILE} \
					                -userkeyfile ${KEYFILE} \
							-start \
							-name ${COMP}"

							 java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	     fi



              if [ ${COMP} = "ShotsOnLineApp" ]
		       then

				  export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSSHOTS.secure
		       	          export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSSHOTS.secure

						COMAND="-adminurl t3://${IP_SERVER_PORT} \
						        -userconfigfile ${USRCFGFILE} \
						        -userkeyfile ${KEYFILE} \
						        -start \
							-name ${COMP}"

							 java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	      fi

              if [ ${COMP} = "Pis" ] || [ ${COMP} = "reportes" ]
		 then

			     export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSPIS.secure
			     export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSPIS.secure

					      COMAND="-adminurl t3://${IP_SERVER_PORT} \
						      -userconfigfile ${USRCFGFILE} \
						      -userkeyfile ${KEYFILE} \
						      -start \
						      -name ${COMP}"

               					       java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	      fi

	      if [ ${COMP} = "NextelFiles" ]
		  then
	  
			      export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSCREDITUAT.secure
			      export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSCREDITUAT.secure

					       COMAND="-adminurl t3://${IP_SERVER_PORT} \
						       -userconfigfile ${USRCFGFILE} \
						       -userkeyfile ${KEYFILE} \
						       -start \
						       -name ${COMP}"

						       java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

	     fi

             if [ ${COMP} = "ReportesOperativos" ]
		then

			     export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSNXTRT.secure
			     export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSNXTRT.secure

						COMAND="-adminurl t3://${IP_SERVER_PORT} \
						        -userconfigfile ${USRCFGFILE} \
						        -userkeyfile ${KEYFILE} \
							-start \
							-name ${COMP}"

							 java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log
	     fi

             if [ ${COMP} = "banking" ]
		then

			      export USRCFGFILE=${DEPLOYME_HOME}/keys/userWLSBANKINGIXUAT.secure
			      export KEYFILE=${DEPLOYME_HOME}/keys/pwdWLSBANKINGIXUAT.secure

						 COMAND="-adminurl t3://${IP_SERVER_PORT} \
							 -userconfigfile ${USRCFGFILE} \
							 -userkeyfile ${KEYFILE} \
							 -start \
							 -name ${COMP}"

							 java weblogic.Deployer ${COMAND} >> ${DEPLOYME_HOME}/logs/deployme.log

	     fi

	    echo ""
	    echo "START APLICATION ${COMP} FINISH ............ SEE     ${DEPLOYME_HOME}/logs/deployme.log      FOR MORE INFORMATION."
	 fi
fi

