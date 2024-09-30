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
      cmdline = {},
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
    })
  end
}
