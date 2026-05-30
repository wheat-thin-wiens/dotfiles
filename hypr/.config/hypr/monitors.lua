-- Monitors
hl.monitor({
  output   = "DP-1",
  mode     = "1920x1080@165",
  position = "0x0",
  scale    = 1
})

hl.monitor({
  output   = "HDMI-A-1",
  mode     = "1920x1080@75",
  position = "1920x0",
  scale    = 1
})

hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", })
hl.workspace_rule({ workspace = "6", monitor = "DP-1", })
hl.workspace_rule({ workspace = "7", monitor = "DP-1", })
hl.workspace_rule({ workspace = "8", monitor = "DP-1", })
hl.workspace_rule({ workspace = "9", monitor = "DP-1", })
hl.workspace_rule({ workspace = "10", monitor = "DP-1", })

hl.workspace_rule({ workspace = "11", monitor = "HDMI-A-1", default = true, layout = "dwindle" })
hl.workspace_rule({ workspace = "12", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "13", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "14", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "15", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "16", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "17", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "18", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "19", monitor = "HDMI-A-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "20", monitor = "HDMI-A-1", layout = "dwindle" })
-- hl.workspace_rule({ workspace = "2", layout = "dwindle" })
