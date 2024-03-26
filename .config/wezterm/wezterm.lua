local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.font "FiraCode Nerd Font"

config.window_background_opacity = 0.999 -- workaround for macos stutter

-- and finally, return the configuration to wezterm
return config
