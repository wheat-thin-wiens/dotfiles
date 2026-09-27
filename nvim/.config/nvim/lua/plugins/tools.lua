return {
  --
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  -- Autotags
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

  -- Colortils
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
    --name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.nvim"
    },
  },

  -- Treesitter Manager
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

  -- NVIM / TMUX Navigator
  {
    "christoomey/vim-tmux-navigator",
  },

  -- Tailwind
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {}
  },
}
