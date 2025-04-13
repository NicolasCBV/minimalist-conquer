#!/bin/bash

read -sp "Please insert your Open Weather API Key: " key

file=$HOME/.config/conky/cred.json
if [ -f $file ]; then
	rm $file
fi

if [ -z $key ]; then
	printf '%b' "\nAPI key should not be empty!"
	exit 1
fi

json="{\"api_key\": \"${key}\"}"
printf '%b' $json >> $file

printf '%b' "\nEverything is ready to be used!"
