local wezterm = require("wezterm")
-- local features = require("features")

local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "mellow"

config.font = wezterm.font(
  -- "Fantasque Sans Mono",
  -- "MesloLGS Nerd Font Mono",
  "Jetbrains Mono",
  -- "SauceCodePro Nerd Font",
  { weight = "Bold", italic = false }
)
config.font_size = 11
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 1
config.macos_window_background_blur = 30

config.keys = {
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = act.DisableDefaultAssignment,
  }
}

return config
