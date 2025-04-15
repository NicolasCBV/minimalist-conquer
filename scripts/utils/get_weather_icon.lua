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
    elseif 801 then
        if is_day then
            return "" 
        else
            return ""
        end
    elseif 802 then
        if is_day then
            return ""
        else
            return ""
        end
    elseif 803 then 
        if is_day then
            return ""
        else
            return ""
        end
    elseif 804 then
        return ""
    elseif 200 or 201 or 202 or 210 or 211 or 212 or 221 or 230 or 231 or 232 then
        return ""
    elseif 300 or 301 or 302 or 310 or 311 or 312 or 313 or 314 or 321 then 
        if is_day then
            return ""
        else 
            return ""
        end
    elseif 500 then
        return ""
    elseif 501 then 
        return ""
    elseif 502 then 
        return ""
    elseif 503 or 520 or 521 then 
        return ""
    elseif 504 or 522 or 531 then 
        return ""
    elseif 511 then 
        return ""
    elseif 600 or 601 or 602 or 611 or 612 or 613 or 615 or 616 or 620 or 621 or 622 then 
        return ""
    elseif 701 or 711 or 721 or 731 or 741 or 751 or 761 or 762 or 771 or 781 then 
        return ""
    else 
        return ""
    end
end
