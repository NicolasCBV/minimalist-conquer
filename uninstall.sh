#!/bin/bash

printf '%b' "Uninstalling theme...\n"
crontab -l | grep -v "/etc/cron.reboot/weather" | crontab -
if [ -d /etc/minimalist_conquer ]; then
	sudo rm -rf /etc/minimalist_conquer
fi

if [ -f /etc/cron.reboot/weather ]; then
	sudo rm /etc/cron.reboot/weather
fi

if [ -f /usr/bin/weather.collect ]; then
	sudo rm /usr/bin/weather.collect
fi

if [ -f /etc/systemd/system/weather-daemon.service ]; then
	sudo rm /etc/systemd/system/weather-daemon.service
	sudo rm /etc/systemd/system/multi-user.target.wants/weather-daemon.service
	sudo systemctl daemon-reload
fi

printf '%b' "Done!"
