#!/bin/bash

mkdir -p logs
for ((i=0; i<1000000; i++)); do
  n=$(($i%10))
  date "+%F %T" > logs/date_log$n.txt
  echo $n : $(cat logs/date_log$n.txt)
  sleep 300
done