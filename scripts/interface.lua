require 'cairo'
require 'cairo_xlib'

require 'scripts.utils.get_weather_data'
require 'scripts.components.date'
require 'scripts.components.weather_icon'
require 'scripts.components.weather_text'
require 'scripts.components.greeting'
require 'scripts.components.day'

function conky_main()
    if conky_window == nil then
        return
    end

    local cs = cairo_xlib_surface_create(
        conky_window.display,
        conky_window.drawable,
        conky_window.visual,
        conky_window.width,
        conky_window.height
    )
    local cr = cairo_create(cs)

    local weather_data = Get_weather_data()

    Draw_date(cr)
    Draw_weather_icon(cr, weather_data.weather[1].id)
    Draw_greeting(cr)
    Draw_day(cr)
    Draw_weather_text(cr, weather_data)

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
end
