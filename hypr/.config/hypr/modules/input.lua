-- Input
hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    repeat_rate = 45,
    repeat_delay = 450,

    follow_mouse = true,
    sensitivity = 0.2,

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.3,
      tap_to_click = false,
      clickfinger_behavior = 1
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
