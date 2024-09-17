local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "nightfox"

config.font = wezterm.font(
  "MesloLGS Nerd Font Mono",
  { weight = "Bold", italic = false }
)
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 1
config.macos_window_background_blur = 50

return config
