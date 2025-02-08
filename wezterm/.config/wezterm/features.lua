local wezterm = require("wezterm")
local action = require("wezterm.action")

local M = {}

M.scriptsPath = os.getenv("HOME") .. "/.config/wezterm"

M.fzfSwitcher = function(window, pane, script, command)
  local fzfCommand = "fzf ==color=bg+:-1 --reverse --preview-window=down,1 --preview'" .. script .. " {}'"

  window:perform_action(
    action.SplitPane({
      direction = "Right",
      command = {
        args = {
          "zsh",
          "-c",
          command .. fzfCommand,
        },
      },
      size = { Percent = 25 },
    }),
    pane
  )
end

M.theme_picker = function(window, pane)
  local builtinSchemes = wezterm.get_builtin_color_schemes()

  local schemes = {}

  for key, _ in pairs(builtinSchemes) do
    table.insert(schemes, tostring(key))
  end

  table.sort(schemes, function(c1, c2)
    return c1 < c2
  end)

  local schemesCommand = 'echo -e "' .. table.concat(schemes, "\n") .. '" | '

  M.fzfSwitcher(window, pane, M.scriptsPath .. "/updateScheme.lua", schemesCommand)
end

return M
