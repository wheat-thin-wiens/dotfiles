return {
  "kyza0d/xeno.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    contrast = 0.1
  },
  config = function(_, opts)
    require('xeno').new_theme('faded', {
      base = '#090D11',
      accent = '#8B9EBC',
    })
    vim.cmd('colorscheme faded')
  end
}
