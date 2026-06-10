-- Binds --
local main_mod = "SUPER"

-- Actions
local close_window = hl.bind(main_mod .. " + W", hl.dsp.window.close())
close_window:set_enabled(true)

hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1"))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

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

hl.bind("ALT + h", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind("ALT + j", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind("ALT + k", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
hl.bind("ALT + l", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Device Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pactl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +1"))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 1-"))

hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("ALT + RETURN",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
