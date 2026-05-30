return {

  -- COLORTILS
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function ()
      require("colortils").setup({
        mappings = {
          replace_default_format = "rdf",
          replace_choose_format = "rcf",
        }
      })
    end,
  },

  -- RENDER MARKDOWN
  {
    "MeanderingProgrammer/render-markdown.nvim",
    main = "render-markdown",
    opts = {},
    --name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.nvim"
    },
  },

  -- SUDO
  {
    "denialofsandwich/sudo.nvim",
    cmd = { "SudoRead", "SudoWrite", "SudoEdit" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      commands = true
    }
  },

  -- TAILWIND TOOLS
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   opts = {}
  -- },

  -- TROUBLE
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    }
  },
}
