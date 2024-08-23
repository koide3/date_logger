#!/bin/bash

max_date=1724387234  # 2024-08-23

for file in logs/date_log*.txt; do
  log_date=$(date -d "$(cat $file)" "+%s" || echo "0")
  echo $log_date
  if [ $max_date -lt $log_date ]; then
    max_date=$log_date
  fi
done

date -s "@$max_date"
