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

printf '%b' "\nSetting cron job for Open Weather...\n"
executor_path=$HOME/.config/conky/scripts/cron/executor.sh
boot_cron_list=/etc/cron.reboot
boot_cron_path=$boot_cron_list/weather

if [ ! -d $boot_cron_list ]; then
	sudo mkdir $boot_cron_list
fi

if [ -f $boot_cron_path ]; then
	sudo rm $boot_cron_path
fi

sudo ln $executor_path $boot_cron_path

crontab -l | grep -v "$boot_cron_path" | crontab -
(crontab -l ; echo "*/15 * * * * $boot_cron_path") | crontab

printf '%b' "\nEverything is ready to be used!\n"
