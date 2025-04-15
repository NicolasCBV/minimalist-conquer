local status_ok = pcall(require, "cairo_xlib")
if not status_ok then
    print("ERROR: Could not find cairo_xlib dependency!")
end

status_ok = pcall(require, "cairo")
if not status_ok then
    print("ERROR: Could not find cairo dependency!")
end

function Write_text(cr, text, x, y, max_width, spacing)
    local lines = {}
    local current_line = ""
    for word in string.gmatch(text, "%S+") do
        if current_line == "" then
            current_line = word
        else
            local extents = cairo_text_extents_t:create()
            cairo_text_extents(cr, current_line .. " " .. word, extents)
            if extents.width > max_width then
                table.insert(lines, current_line)
                current_line = word
            else
                current_line = current_line .. " " .. word
            end
        end
    end

    if current_line ~= "" then
        table.insert(lines, current_line)
    end

    for i, line in ipairs(lines) do
        cairo_move_to(cr, x, y + (i-1)*spacing)
        cairo_show_text(cr, line)
    end
end
