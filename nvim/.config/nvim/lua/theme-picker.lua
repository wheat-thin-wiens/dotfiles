-- Theme Picker, with option for transparent background

function ColorPick(color)
  color = color or "nightfox"
  vim.cmd.colorscheme(color)

  -- Transparent Background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

  -- EoB Character Color
  local eobCol = vim.api.nvim_get_hl_by_name('Label', true)
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = eobCol.fg } )

end

ColorPick("catppuccin-mocha")

-- carbonfox
-- catppuccin-frappe
-- catppuccin-latte
-- catppuccin-macchiato
-- catppuccin-mocha
-- nightfox
-- night-owl
-- rose-pine-main
-- rose-pine-moon
-- rose-pine-dawn
