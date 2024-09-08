-- Theme Picker, with option for transparent background
function ColorPick(color)
  color = color or "nightfox"
  vim.cmd.colorscheme(color)

  --vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

end

ColorPick("rose-pine-main")

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
