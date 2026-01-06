return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "rei",
          colorscheme = "rei",
        },
        {
          name = "catppuccin",
          colorscheme = "catppuccin-mocha",
        },
        {
          name = 'moonfly',
          colorscheme = 'moonfly'
        },
        {
          name = "nightfox",
          colorscheme = "nightfox",
        },
        {
          name = "oxocarbon",
          colorscheme = "oxocarbon",
        },
        {
          name = "oldworld",
          colorscheme = "oldworld",
        },
        {
          name = "rose-pine",
          colorscheme = "rose-pine",
        },
        {
          name = 'techbase',
          colorscheme = 'techbase',
        },
        {
          name = 'vague',
          colorscheme = 'vague',
        },
      },
      globalAfter = [[
        if vim.g.colors_name ~= "rei" then
          local LineNumAbove = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })
          local LineNum      = vim.api.nvim_get_hl(0, { name = "Function", link = true })
          local LineNumBelow = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })
          local eobCol       = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })

          vim.api.nvim_set_hl(0, "LineNrAbove", { fg = LineNumAbove.fg })
          vim.api.nvim_set_hl(0, "LineNr", { fg = LineNum.fg })
          vim.api.nvim_set_hl(0, "LineNrBelow", { fg = LineNumBelow.fg })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = eobCol.fg })
        end
      ]]
    })
  end
}
