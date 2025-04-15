local status_ok, utf8 = pcall(require, "lua-utf8")
if not status_ok then
    print("Could not find lua-utf8 dependency!")
end

function Draw_day(cr)
    local msg = utf8.upper(os.date("%A"))

    cairo_select_font_face(cr, "Finlandica", CAIRO_FONT_SLANT_BOLD)
    cairo_set_source_rgb(cr, 0.13, 0.13, 0.18, 1)
    cairo_set_font_size(cr, 58)

    cairo_move_to(cr, 43, 150)
    cairo_show_text(cr, msg)
end
