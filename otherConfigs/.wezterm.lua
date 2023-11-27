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
config.color_scheme = "Dracula"

-- Font
config.font = wezterm.font("Agave Nerd Font Mono")
config.font_size = 16

-- Keybindings
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }

-- and finally, return the configuration to wezterm
return config
