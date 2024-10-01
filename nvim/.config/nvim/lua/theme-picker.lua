-- Theme Picker, with option for transparent background

function ColorPick(color)
  color = color or "nightfox"
  vim.cmd.colorscheme(color)

  -- Background
  --vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
  --vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "None" })
  --vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "None" })

  -- Line Number Color
  local LineNumAbove = vim.api.nvim_get_hl(0, {
    name = "StatusLine",
    link = true,
  })
  local LineNum = vim.api.nvim_get_hl(0, {
    name = "Function",
    link = true,
  })
  local LineNumBelow = vim.api.nvim_get_hl(0, {
    name = "StatusLine",
    link = true,
  })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = LineNumAbove.fg } )
  vim.api.nvim_set_hl(0, "LineNr", { fg = LineNum.fg } )
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = LineNumBelow.fg } )

  -- EoB Character Color
  local eobCol = vim.api.nvim_get_hl(0, {
    name = "StatusLine",
    link = true,
  })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = eobCol.fg } )

end

ColorPick("catppuccin-mocha")

-- To get names of highlight groups, run :highlight

-- carbonfox
-- catppuccin-frappe
-- catppuccin-latte
-- catppuccin-macchiato
-- catppuccin-mocha
-- kanagawa
-- nightfox
-- night-owl
-- rose-pine-main
-- rose-pine-moon
-- rose-pine-dawn
