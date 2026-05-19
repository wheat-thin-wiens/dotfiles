return {

  -- AUTOPAIRS
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- AUTOTAG
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
        }
      })
    end
  },

  -- COMMENT
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- GITSIGNS
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },

  -- INDENT BLANKLINE
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({})
    end,
  },

  -- NVIM-TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
  --   build = ":TSUpdate",
  --   config = function()
  --     local config = require("nvim-treesitter.configs")
  --     config.setup({
  --       auto_install = true,
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end
  },

  -- TREESITTER - MANAGER
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = { "lua" },
        auto_install = true,
        highlight = true,
      })
    end
  },

  -- VIM / TMUX NAVIGATOR
  {
    'christoomey/vim-tmux-navigator',
  },
}
