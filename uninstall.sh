#!/bin/bash

printf '%b' "Uninstalling theme...\n"
crontab -l | grep -v "/etc/cron.reboot/weather" | crontab -
if [ -d /etc/minimalist_conquer ]; then
	sudo rm -rf /etc/minimalist_conquer
fi

if [ -f /etc/cron.reboot/weather ]; then
	sudo rm /etc/cron.reboot/weather
fi

printf '%b' "Done!"
