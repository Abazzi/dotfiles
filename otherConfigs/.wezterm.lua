-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha (Gogh)"

-- Font
config.font = wezterm.font("CodeNewRoman Nerd Font Mono")
config.font_size = 16
config.line_height = 1.2

-- Etc.
config.warn_about_missing_glyphs = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.check_for_updates = false

-- and finally, return the configuration to wezterm
return config
