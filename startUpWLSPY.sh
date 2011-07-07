#! /bin/sh


export WL_HOME="/opt/apps/wl10mp3/bea/wlserver_10.3"
export BEA_HOME="/opt/apps/wl10mp3/bea/user_projects/domains"
export JAVA_HOME="/opt/java6/bin"
export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
export PATH=$JAVA_HOME:$PATH


if [ "$1" = "deploy" ]
 then
   java weblogic.WLST WLDeploy.py 
fi

if [ "$1" = "undeploy" ]
 then
   java weblogic.WLST WLUnDeploy.py
fi

if [ "$1" = "stopapp" ]
 then
   java weblogic.WLST WLStopCompDeploy.py
fi

if [ "$1" = "startapp" ]
 then
   java weblogic.WLST WLStartCompDeploy.py
fi

