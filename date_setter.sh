#!/bin/bash

max_date=1724387234  # 2024-08-23

echo now=$(date)

for ((i=0; i<10; i++)); do
  echo trial $i

  log_path=/usr/local/share/date_logger/logs
  for file in $log_path/*; do
    log_date=$(date -d "$(cat $file)" "+%s" || echo "0")
    echo $log_date
    if [ $max_date -lt $log_date ]; then
      max_date=$log_date
    fi
  done

  now=$(date "+%s")
  echo now=$now

  if [ $now -lt $max_date ]; then
    date -s "@$max_date"
    echo set date to $(date -d "@$max_date")
  fi

  sleep 1
done
