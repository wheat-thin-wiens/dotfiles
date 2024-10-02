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
        enabled = false,
      },
      notify = {
        enabled = false,
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
        },
      },
    })
  end
}
