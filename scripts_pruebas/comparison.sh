#! /bin/sh

IPWL=`grep IP parametros.conf | cut -d "=" -f 2`
USR=`grep USER parametros.conf | cut -d "=" -f 2`
APP=`grep APP parametros.conf | cut -d "=" -f 2`
CMP=`grep COMP parametros.conf | cut -d "=" -f 2`
CMD=`grep COMD parametros.conf | cut -d "=" -f 2`
WL=`grep WEBLC parametros.conf | cut -d "=" -f 2`

LOC_PATH='/opt/apps/pythosn'

echo ${LOC_PATH}


#Realizamos las validaciones de los componentes

listNOE=( CartaRTFWeb.war FillOrderWeb.war \
          MktIX.war NOEMovil.war NOEMPlumaDigital.war \
          NOEReports.war ProviderWeb.war RenautWeb.war scv.warsiven.war )

listSOE=( AtsEJBEAR.ear MARMDBEAR.ear MARServices.war \
          MARServiciosPrepago.war MARWeb.war CPCWeb.war \
          NOEMovilServices.war ServiciosASP.war ServiciosBC.war \
          ServiciosOE.war ServiciosTDC.war )


 if [ "${APP}" = "NOE" ]
    then
	for linea in ${listNOE[@]} ; do
		if [ "${CMP}" = "${linea}" ]
 			then
                             # echo $linea
                             export TARGETS="svmnoe01,svmnoe02"
                             echo $TARGETS
		fi
	done
 fi


 if [ "${APP}" = "SOE" ]
    then
        for linea in ${listSOE[@]} ; do
                if [ "${CMP}" = "${linea}" ]
                        then
                              #echo $linea
                             export TARGETS="svmsoe01,svmsoe02" 
                             echo $TARGETS
                fi
        done
 fi


