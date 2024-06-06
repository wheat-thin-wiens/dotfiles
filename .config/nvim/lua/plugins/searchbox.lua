return {
  'VonHeikemen/searchbox.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
  },
  config = function ()
    vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>', {noremap = true})
  end
}
