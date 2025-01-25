local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }
-- Font Settings
config.font_size = 13
config.font = wezterm.font('DankMono Nerd Font Mono')
config.line_height = 1.3

-- Colorscheme and Terminal Settings
config.color_scheme = 'Catppuccin Macchiato (Gogh)'
config.initial_cols = 150
config.initial_rows = 50
config.max_fps = 120

-- Tab bar Settings
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.hide_tab_bar_if_only_one_tab = true

-- Window Settings
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_background_opacity = 0.8
config.win32_system_backdrop = 'Auto'
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '1cell',
  bottom = '1cell',
}

-- Catppuccin Retro Tab Bar
config.colors = {
    tab_bar = {
        background = '#24273a',
        active_tab = {
            bg_color = '#c6a0f6',
            fg_color = '#24273a',
            intensity = 'Normal',
            underline = 'None',
            italic = true,
            strikethrough = false,
        },
        inactive_tab = {
            bg_color = '#24273a',
            fg_color = '#c6a0f6',
            intensity = 'Normal',
            underline = 'None',
            italic = false,
            strikethrough = false,
        },
        inactive_tab_hover = {
            bg_color = '#24273a',
            fg_color = '#c6a0f6',
            intensity = 'Normal',
            underline = 'None',
            italic = false,
            strikethrough = false,
        },
        new_tab = {
            bg_color = '#24273a',
            fg_color = '#c6a0f6',
            intensity = 'Normal',
            underline = 'None',
            italic = false,
            strikethrough = false,
        },
    },
}


-- History
config.scrollback_lines = 10000
-- Shell Domains

-- Keybindings
config.keys = {
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentTab {confirm = false},
    },
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 't',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnTab 'DefaultDomain',
    },
    {
        key = '1',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnTab 'DefaultDomain',
    },
    {
        key = '2',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnTab {DomainName  = 'WSL:Ubuntu'},
    },
    {
        key = '3',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnTab {DomainName  = 'local'},
    },
    {
        key = '4',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnTab {DomainName  = 'WSL:podman-machine-default'},
    },
    {
        key = 'F11',
        mods = 'CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
}

return config
