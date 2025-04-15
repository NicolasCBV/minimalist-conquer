function Draw_date(cr)
    local x = 43
    local y = 0
    local size = 80

    cairo_set_source_rgba(cr, 0.63, 0.63, 0.70, 0.5)
    cairo_rectangle(cr, x, y, size, size)
    cairo_fill(cr)
 
    cairo_set_source_rgb(cr, 0.13, 0.13, 0.18, 1)
    cairo_select_font_face(cr, "Poppins Light", CAIRO_FONT_SLANT_NORMAL)
    cairo_set_font_size(cr, 50)

    local day = os.date("%d")
    local day_size = cairo_text_extents_t:create()
    cairo_text_extents(cr, day, day_size)
    local pos_x = x + (size - day_size.width) / 2 - day_size.x_bearing

    cairo_move_to(cr, pos_x, 51)
    cairo_show_text(cr, day)

    cairo_select_font_face(cr, "Poppins Normal", CAIRO_FONT_SLANT_NORMAL)
    cairo_set_font_size(cr, 13)

    local month = os.date("%B")
    month = string.upper(string.sub(month, 1, 1)) .. string.sub(month, 2)
    local month_size = cairo_text_extents_t:create()
    cairo_text_extents(cr, month, month_size)
    pos_x = x + (size - month_size.width) / 2 - month_size.x_bearing

    cairo_move_to(cr, pos_x, 70)
    cairo_show_text(cr, month)
end
