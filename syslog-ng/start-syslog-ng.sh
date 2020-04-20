#!/bin/bash
if [[ $LOGROTATE = "Yes" || $LOGROTATE = "yes" || $LOGROTATE -eq 1 ]]
  then
    service cron start
  fi

/usr/sbin/syslog-ng -F
