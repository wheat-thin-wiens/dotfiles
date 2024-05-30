return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto'
      }
    })
--  return require "catppuccin.utils.lualine" "macchiato"
  end
}
