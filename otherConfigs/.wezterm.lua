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

-- Check for updates every week
config.check_for_updates = true
config.check_for_updates_interval_seconds = 604800

-- and finally, return the configuration to wezterm
return config
