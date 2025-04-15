require 'scripts.utils.get_weather_icon'

function Draw_weather_icon(cr, status)
    local x = 150
    local y = 29
    local size = 50

    cairo_set_source_rgba(cr, 0.63, 0.63, 0.70, 0.5)
    cairo_rectangle(cr, x, y, size, size)
    cairo_fill(cr)

    cairo_set_source_rgb(cr, 0.13, 0.13, 0.18, 1)
    cairo_select_font_face(cr, "Hack Nerd Font", CAIRO_FONT_SLANT_NORMAL)
    cairo_set_font_size(cr, 25)

    local icon = Get_weather_icon(status)
    local icon_size = cairo_text_extents_t:create()
    cairo_text_extents(cr, icon, icon_size)
    local pos_x = x + (size - icon_size.width) / 2 - icon_size.x_bearing
    local pos_y = y + (size - icon_size.height) / 2 - icon_size.y_bearing

    cairo_move_to(cr, pos_x, pos_y)
    cairo_show_text(cr, icon) 
end

