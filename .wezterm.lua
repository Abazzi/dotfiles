-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-frappe'

-- Font 
config.font = wezterm.font 'Agave Nerd Font Mono'
config.font_size = 16

-- Changing Shell
config.default_prog = {'C:\\Program Files\\Git\\bin\\bash.exe'};

-- Keybindings
config.leader = {key = ' ', mods = 'CTRL', timeout_milliseconds = 1000}
config.keys = {
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab {confirm = false},
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action({SplitHorizontal = {domain = "CurrentPaneDomain"}}),
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action({SplitVertical = {domain = "CurrentPaneDomain"}}),
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action({ActivatePaneDirection = "Left"}),
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action({ActivatePaneDirection = "Down"}),
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action({ActivatePaneDirection = "Up"}),
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action({ActivatePaneDirection = "Right"}),
  },
}
for i = 1,8 do
  table.insert(config.keys, {
    key = tostring(i),
  mods = 'CTRL',
  action = wezterm.action.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config
