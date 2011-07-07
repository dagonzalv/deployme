#! /bin/sh


export WL_HOME="/opt/apps/wl9mp2/bea/weblogic92"
export BEA_HOME=" /opt/apps/wl9mp2/bea/user_projects/domains"
export JAVA_HOME="/opt/java6/bin"
export CLASSPATH=$WL_HOME/server/lib/weblogic.jar:$CLASSPATH
export PATH=$WL_HOME/server/lib/weblogic.jar:$PATH
export PATH=$JAVA_HOME:$PATH


java weblogic.WLST 

#java weblogic.WLST WLConnect.py

