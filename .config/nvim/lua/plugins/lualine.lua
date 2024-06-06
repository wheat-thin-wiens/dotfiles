return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' },
      }
    })
--  return require "catppuccin.utils.lualine" "macchiato"
  end
}
