require("binds")
require("input")
require("monitors")

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE '$HYPRLAND_INSTANCE_SIGNATURE'")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  hl.exec_cmd("waybar")

  -- Wallpaper
  -- hl.exec_cmd("hyprpaper")

  -- Animated Wallpaper
  local paper_file = "japanrain.gif"
  local paper_path = "$HOME/dotfiles/backgrounds/animted/" .. paper_file
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("awww img -o DP-1" .. paper_path)
  hl.exec_cmd("awww img -o HDMI-A-1" .. paper_path)


end)

-- Env Vars
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("HYPRCURSOR_THEME", "Posy_Cursor_Black")
hl.env("HYPRCURSOR_SIZE", "24")

-- Screen Sharing
hl.workspace_rule({
  workspace = "name:screen_sharing",
})

-- Look + Feel
hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 1,

    col = {
      active_border = { colors = { "rgb(d1d5db)" }, angle = 45 },
      inactive_border = { colors = { "rgba(121212cc)" }, angle = 45}
    },

    allow_tearing = false,
    layout = "master", -- dwindle
  },

  decoration = {
    rounding = 12,

    blur = {
      enabled = true,
      size = 9,
      passes = 3,
      ignore_opacity = true
    },

    shadow = {
      enabled = true,
      range = 10
    },
  },

  animations = {
    enabled = true
  },

  xwayland = {
    enabled = true,
    force_zero_scaling = true
  },
})

hl.curve("quick", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1} }})

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "quick" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "quick", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "quick", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default", style = "slidefade 20%" })

hl.config({
  dwindle = {
    preserve_split = true
  },

  master = {
    new_status = "slave" -- master
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },
})
