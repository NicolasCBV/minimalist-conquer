#!/bin/bash

cache_dir="/tmp/weather.json"
if [ -f $cache_dir ]; then
  rm $cache_dir
fi

geolocation=($(curl -s ipinfo.io | jq -r '.loc' | tr ',' ' '))
lat="${geolocation[0]}"
lon="${geolocation[1]}"

cred=$(cat /etc/minimalist_conquer/cred.json | jq -r '.api_key')
status=$(curl -w "%{http_code}" -s "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${cred}" -o $cache_dir)

if [ $((status)) -gt 399 ] || [ $((status)) -eq 0 ]; then
  msg="Could not read Open Weather API!"
  echo $msg
  echo $msg | systemd-cat -t weather -p "err"
fi

touch $cache_dir
echo $res >> $cache_dir
