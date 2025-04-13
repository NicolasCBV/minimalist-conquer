#!/usr/bin/env bash

cred=$(cat $HOME/.config/conky/cred.json | jq -r '.api_key')
RES=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=-19.9029&lon=-43.9572&appid=${cred}")

if [ -z "$RES" ]; then 
  TEMP_CELSIUS=""
else
  RAW_TEMP=$(jq -r .main.temp <<< "${RES}")
  TEMP_CELSIUS="$(bc <<< "${RAW_TEMP} - 273.15")󰔄"
fi

TIME=$(date +'%H')
IS_DAY=true

if [ "${TIME}" -ge 18 ] || [ "${TIME}" -le 6 ]; then
  IS_DAY=false
fi	

ID=$(jq -r '.weather[0] | .id' <<< "${RES}")

case $ID in
# Clouds 8xx
  800)
    if [ $IS_DAY == true ]; then
      ICON=""
    else
      ICON=""
    fi 
  ;;
  
  801)
    if [ ${IS_DAY} == true ]; then
      ICON=""
    else
      ICON=""
    fi 
  ;;

  802)
    if [ $IS_DAY == true ]; then
      ICON="" 
    else
      ICON=""
    fi 
  ;;

  803)    
    if [ $IS_DAY == true ]; then 
      ICON=""
    else
    
      ICON=""
    fi
  ;;

  804)
    ICON=""
  ;;

# Thunderstorm
  200 | 201 | 202 | 210 | 211 | 212 | 221 | 230 | 231 | 232)
    ICON=""
  ;;

# Drizzle
  300 | 301 | 302 | 310 | 311 | 312 | 313 | 314 | 321)
    if [ $IS_DAY == true ]; then 
      ICON=""
    else
    
      ICON=""
    fi
  ;;

# Rains 5xx
  500)
    ICON=""
  ;;

  501)
    ICON=""
  ;;

  502)
    ICON=""
  ;;

  503 | 520 | 521)
    ICON=""
  ;;

  504 | 522 | 531)
    ICON=""
  ;; 

  511)
    ICON=""
  ;;

# Snow 6xx
  600 | 601 | 602 | 611 | 612 | 613 | 615 | 616 | 620 | 621 | 622)
    ICON=""
  ;;

# Atmosphere
  701 | 711 | 721 | 731 | 741 | 751 | 761 | 762 | 771 | 781)
    ICON=""
  ;;

  *)
    ICON=""
  ;;
esac

MESSAGE="${ICON} ${TEMP_CELSIUS}"

echo $MESSAGE
