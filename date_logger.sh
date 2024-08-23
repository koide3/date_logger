#!/bin/bash

log_path="/usr/local/share/date_logger/logs"
mkdir -p $log_path

for ((i=0; i<1000000; i++)); do
  if [ $(date "+%s") -lt 1000000 ]; then
    echo date seems not set $(date "+%F %T" )
    sleep 15
    continue
  fi

  n=$(($i%10))
  date "+%F %T" > $log_path/date_log$n.txt
  echo $n : $(cat $log_path/date_log$n.txt)
  sleep 60
done
