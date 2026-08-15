return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  event = "VeryLazy",
  config = function()
    require("fine-cmdline").setup({
      cmdline = {
        prompt = ": ",
      },
      popup = {
        position = {
        row = '20%',
        col = '50%',
        },
        size = {
          width = '40%'
        },
      },

      vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    })
  end
}
