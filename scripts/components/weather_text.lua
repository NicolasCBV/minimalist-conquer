require 'scripts.utils.write_text'

local function build_text(weather_data)
    local temp = string.format("%.2f", weather_data.main.temp - 273.15)
    local speed = string.format("%.2f", weather_data.wind.speed * 3.6)
    local humidity = tostring(weather_data.main.humidity)

    if string.find(os.getenv("LANG"), "^pt_BR") == nil then
        return "The current temperature at "
            .. weather_data.name ..
            " is "
            .. temp ..
            "°C, with a wind speed of "
            .. speed .. " km/h and humidity at "
            .. humidity .. "%."
    else
        return "A temperatura atual em "
            .. weather_data.name ..
            " é de "
            .. temp ..
            "°C, com velocidade do vento de "
            .. speed .. " km/h e umidade de "
            .. humidity .. "%."
        end
end

function Draw_weather_text(cr, weather_data)
    local weather_text = build_text(weather_data)

    cairo_set_source_rgba(cr, 0.63, 0.63, 0.70, 0.5)
    cairo_rectangle(cr, 43, 210, 2, 38)
    cairo_fill(cr)

    cairo_select_font_face(cr, "Poppins Normal", CAIRO_FONT_SLANT_NORMAL)
    cairo_set_source_rgb(cr, 0.13, 0.13, 0.18, 1)
    cairo_set_font_size(cr, 12)

    x = 55
    y = 225
    cairo_move_to(cr, x, y)
    Write_text(cr, weather_text, x, y, 320, 13)
end
