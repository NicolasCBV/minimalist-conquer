function Draw_greeting(cr)
    local username = os.getenv("USER")
    local hour = tonumber(os.date("+%H"))
    local msg = ""

    if string.find(os.getenv("LANG"), "^pt_BR") ~= nil then
        if hour < 6 then
            msg = "Boa madrugada, " .. username .. "!"
        elseif hour < 12 then
            msg = "Bom dia, " .. username .. "!"
        elseif hour < 18 then
            msg = "Boa tarfe, " .. username .. "!"
        else
            msg = "Boa noite, " .. username .. "!"
        end
    else
        if hour < 12 and hour > 6 then
            msg = "Good morning, " .. username .. "!"
        elseif hour < 18 and hour > 6 then
            msg = "Good afternoon, " .. username .. "!"
        else
            msg = "Good evening, " .. username .. "!"
        end
    end

    cairo_select_font_face(cr, "Finlandica", CAIRO_FONT_SLANT_NORMAL)
    cairo_set_source_rgb(cr, 0.13, 0.13, 0.18, 1)
    cairo_set_font_size(cr, 19)

    cairo_move_to(cr, 43, 190)
    cairo_show_text(cr, msg)
end
