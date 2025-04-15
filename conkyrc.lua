conky.config = {
    lua_load = '~/.config/conky/scripts/interface.lua',
    lua_draw_hook_pre = 'main',

    alignment = 'bottom_left',
    border_width = 20,

    max_text_width = 75,
    maximum_width = 600,

    gap_x = 25,
    gap_y = 160,

    default_color = '#3F3F46',
    default_outline_color = 'white',
    default_shade_color = 'white',

    double_buffer = true,

    draw_outline = false,
    draw_shades = false,

    minimum_height = 165,
    minimum_width = 320,

    border_inner_margin	= 20,

    net_avg_samples = 2,
    no_buffers = true,

    own_window = true,
    own_window_transparent = true,
    own_window_argb_visual = true,
    own_window_type = 'desktop',

    update_interval = 1.0,
    use_xft = true,
}

conky.text = [[]]

