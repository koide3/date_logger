#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Must be run with sudo"
  exit 1
fi

root_path="/usr/local/share/date_logger"

echo "Installing date_logger..."
mkdir -p $root_path
cp date_logger.sh $root_path/
cp date_setter.sh $root_path/
cp date_logger.service /etc/systemd/system/
cp date_setter.service /etc/systemd/system/

echo "Registering date_logger service..."
systemctl enable date_logger.service
systemctl daemon-reload
systemctl restart date_logger.service
systemctl status date_logger.service

echo "Registering date_setter service..."
systemctl enable date_setter.service
systemctl daemon-reload
systemctl restart date_setter.service
systemctl status date_setter.service
