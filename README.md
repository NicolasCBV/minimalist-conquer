# Minimalist Conquer
This is a simple conky theme, if you are curiosity to check how it are, check this example:

<img alt="demonstration image" src="./example.png">

## Dependencies
Actually this repository is totally personal and all dependencies need to be installed manually.

- lua-utf8: used in upper case process conversion
- lua-dkjson: used in json file parsing

## Installation
Run ```make``` to install this theme in your device, this will set crons for continuous executions every 15 minutes and every boot, to change your Open Weather API key, please edit ```/etc/minimalist_conquer/cred.json```.

> Note: you can collect cached weather data for another usage through ```/tmp/weather.json```.

> Note: to uninstall this theme, just run ```./uninstall.sh```, this will disable crons and remove your credencials.
