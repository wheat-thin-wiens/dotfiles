-- Binds --
local main_mod = "SUPER"

-- Actions
local close_window = hl.bind(main_mod .. " + W", hl.dsp.window.close())
close_window:set_enabled(true)

hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("hyprshot -m output -m DP-1"))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("hyprshutdown"))

-- Programs
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd("wezterm"))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd("nemo"))

-- Windows
hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))

  hl.bind(main_mod .. " + CTRL + " .. key, hl.dsp.focus({ workspace = i + 10}))
  hl.bind(main_mod .. " + SHIFT + CTRL + " .. key, hl.dsp.window.move({ workspace = i + 10}))
end

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Device Controls
local vol_up = "XF86AudioRaiseVolume"
local vol_down = "XF86AudioLowerVolume"
local play = "XF86AudioPlay"
local pause = "XF86AudioPause"

hl.bind(vol_up, hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind(vol_down, hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("SHIFT + " .. vol_up, hl.dsp.exec_cmd("ddcutil setvcp 10 + 5"))
hl.bind("SHIFT + " .. vol_down, hl.dsp.exec_cmd("ddcutil setvcp 10 - 5"))

hl.bind(play, hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(pause,  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
