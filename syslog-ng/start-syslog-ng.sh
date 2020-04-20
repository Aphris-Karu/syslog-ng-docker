#!/bin/bash
shopt -s nocasematch
if [[ $LOGROTATE = "yes" || $LOGROTATE -eq 1 ]]
  then
    service cron start
  case $ROTATE_WHEN in
      hour | hourly)
       cp /srv/logrotate /etc/cron.hourly/logrotate ;;
      day | daily)
       cp /srv/logrotate /etc/cron.daily/logrotate ;;
      week | weekly)
       cp /srv/logrotate /etc/cron.weekly/logrotate ;;
      month | monthly)
       cp /srv/logrotate /etc/cron.monthly/logrotate ;;
      *)
        service cron stop
        echo "Rotation not set"
      ;;
   esac
 fi

/usr/sbin/syslog-ng -F
