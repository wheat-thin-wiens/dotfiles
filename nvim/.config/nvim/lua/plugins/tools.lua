return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = true
  },
  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true
        }
      })
    end
  },
  -- Colortils
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup({
        mappings = {
          replace_default_format = "rdf",
          replace_choose_format = "rcf",
        }
      })
    end
  },
  -- Git Signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  -- Indent Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({})
    end
  },
  -- Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    main = "render-markdown",
    opts = {},
    -- name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.nvim"
    }
  },
  -- NVIM / TMUX Navigator
  {
    "christoomey/vim-tmux-navigator"
  },
  -- Tailwind
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim",
  --     "neovim/nvim-lspconfig"
  --   },
  --   opts = {}
  -- },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
