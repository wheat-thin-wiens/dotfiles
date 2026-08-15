return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  opts = {
    cmdline = {
      format = {
        search_down = {
          view = "cmdline"
        },
        search_up = {
          view = "cmdline"
        }
      }
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini"
    },
    notify = {
      enabled = false
    },
    lsp = {
      hover = {
        enabled = false,
        silent = true
      },
      progress = {
        enabled = false
      },
      message = {
        enabled = false
      },
      signature = {
        enabled = false
      }
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
          reverse = false,
        }
      },
    }
  }
  -- config = function()
  --   require("noice").setup({
  --     -- cmdline = {},
  --     messages = {
  --       enabled = true,
  --       view = 'mini', -- notify, mini
  --     },
  --     notify = {
  --       enabled = false,
  --     },
  --     lsp = {
  --       hover = {
  --         enabled = false
  --       },
  --       progress = {
  --         enabled = false,
  --       },
  --       message = {
  --         enabled = false,
  --       },
  --     },
  --     views = {
  --       cmdline_popup = {
  --         position = {
  --           row = 5,
  --           col = '50%',
  --         },
  --         size = {
  --           width = 60,
  --           height = 'auto',
  --         },
  --       mini = {
  --           align = 'message-right',
  --           position = {
  --             row = 1,
  --             col = 1
  --           },
  --           reverse = true,
  --         }
  --       },
  --     },
  --   })
  -- end
}
