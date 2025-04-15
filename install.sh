#!/bin/bash

printf '%b' "\nSetting fonts...\n"
script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
sudo cp -r $script_dir/fonts/* /usr/share/fonts

read -sp "Please insert your Open Weather API Key: " key

if [ ! -d /etc/minimalist_conquer ]; then
	sudo mkdir /etc/minimalist_conquer
fi

file=/etc/minimalist_conquer/cred.json
if [ -f $file ]; then
	sudo rm $file
fi

if [ -z $key ]; then
	printf '%b' "\nAPI key should not be empty!"
	exit 1
fi

json="{\"api_key\": \"${key}\"}"
printf '%b' $json | sudo tee -a $file > /dev/null

printf '%b' "\nSetting cron job and daemon for Open Weather...\n"
executor_path=$HOME/.config/conky/scripts/cron/executor.sh
sudo cp $executor_path /usr/bin/weather.collect
final_executor_path=/usr/bin/weather.collect

crontab -l | grep -v "$final_executor_path" | crontab -
(crontab -l ; echo "*/15 * * * * $final_executor_path") | crontab

sudo cp $script_dir/scripts/daemon/service.conf /etc/systemd/system/weather-daemon.service
sudo systemctl daemon-reload
sudo systemctl enable --now weather-daemon.service

if [ $(($?)) -ne 0 ]; then
	printf '%b' "\nCould not run first execution, please check your network connection and your API key!\n"
	exit 1
fi
printf '%b' "\nEverything is ready to be used!\n"
