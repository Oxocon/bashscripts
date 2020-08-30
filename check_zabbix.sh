# Zabbix Server Service Check
# By Endre Ottem, UENO
#
# Script to check if Zabbix server service is running, and restart it if it's not.
# The service status will be logged to the file defined as "LOGFILE" below.
# 
# To run script every five minutes, add a crontab (crontab -e) with the path and name of the script, i.e.:
# */5 * * * * /usr/local/check_zabbix.sh >/dev/null 2>&1

DATENOW=`date +"%Y%m%d"`
TIMENOW=`date +"%Y%m%d %H:%M:%S"`
LOGFILE="/var/log/zabbix_check/zabbixcheck-$DATENOW.log"

# Create the log directory if it doesn't exist already
mkdir -p /var/log/zabbix_check;

# Check if zabbix server is running and log the result. Restart service if it is not running.
SERVICE="zabbix_server"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$TIMENOW - $SERVICE is running" >> $LOGFILE
else
    echo "$TIMENOW - $SERVICE stopped - restarting" >> $LOGFILE
    systemctl start zabbix-server
fi
