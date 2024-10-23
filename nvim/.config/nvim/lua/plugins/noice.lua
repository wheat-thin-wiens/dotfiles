return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  opts = {},
  config = function()
    require("noice").setup({
      -- cmdline = {},
      messages = {
        enabled = true,
        view = 'mini', -- notify, mini
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
        documentation = {},
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = '50%',
          },
          size = {
            width = 60,
            height = 'auto',
          },
        mini = {
            align = 'message-right',
            position = {
              row = 1,
              col = 1
            },
            reverse = true,
          }
        },
      },
    })
  end
}
