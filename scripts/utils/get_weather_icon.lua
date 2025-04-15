function Get_weather_icon(id)
    hour=tonumber(os.date("%H"))
    is_day=true

    if hour > 18 or hour < 6 then
        is_day=false
    end

    if id == 800 then
        if is_day then
            return ""
        else
            return ""
        end
    elseif id == 801 then
        if is_day then
            return ""
        else
            return ""
        end
    elseif id == 802 then
        if is_day then
            return ""
        else
            return ""
        end
    elseif id == 803 then 
        if is_day then
            return ""
        else
            return ""
        end
    elseif id == 804 then
        return ""
    elseif id == 200 or 
        id == 201 or 
        id == 202 or 
        id == 210 or 
        id == 211 or 
        id == 212 or 
        id == 221 or 
        id == 230 or 
        id == 231 or 
        id == 232 
    then
        return ""
    elseif id == 300 or 
        id == 301 or 
        id == 302 or 
        id == 310 or 
        id == 311 or 
        id == 312 or 
        id == 313 or 
        id == 314 or 
        id == 321 
    then 
        if is_day then
            return ""
        else 
            return ""
        end
    elseif id == 500 then
        return ""
    elseif id == 501 then 
        return ""
    elseif id == 502 then 
        return ""
    elseif id == 503 or id == 520 or id == 521 then 
        return ""
    elseif id == 504 or id == 522 or id == 531 then 
        return ""
    elseif id == 511 then 
        return ""
    elseif id == 600 or 
        id == 601 or 
        id == 602 or 
        id == 611 or 
        id == 612 or 
        id == 613 or 
        id == 615 or 
        id == 616 or 
        id == 620 or 
        id == 621 or 
        id == 622 
    then 
        return ""
    elseif id == 701 or 
        id == 711 or 
        id == 721 or 
        id == 731 or 
        id == 741 or 
        id == 751 or 
        id == 761 or 
        id == 762 or 
        id == 771 or 
        id == 781 
    then 
        return ""
    else 
        return ""
    end
end
