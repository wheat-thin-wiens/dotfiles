return {
  {
    "rei.nvim",
    dev = true,
    opts = {
      styles = {
        functions = { italic = true, bold = true },
        loops = { italic = true },
        comments = { italic = true },
      },
      extras = {
        transparency = false,
        -- high_contrast = true,
        telescope_theme = "default",
      },
    }
  },
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"catppuccin/nvim",
  	name = "catppuccin",
		priority = 1000,
    opts = {
      -- transparent_background = true,
      styles = {
        comments = { 'italic' },
        functions = { 'italic' },
        loops = { 'italic' },
      },
    }
	},
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        styles = {
          comments = { italic = true },
          functions = { italic = true },
          loops = { italic = true },
        },
        highlight_overrides = {
          ["@constructor.go"] = { fg = "#85b5ba" }
        },
      })
    end
  },
  {
    "sam4llis/nvim-tundra",
    name = "tundra",
    config = function()
      require('nvim-tundra').setup({
        transparent_background = false,
      })
    end
  },
  -- {
  --   "rose-pine/neovim",
  --   name = 'rose-pine',
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main"
  --     })
  --   end
  -- },
  -- {
  --   "bluz71/vim-moonfly-colors",
  --   name = 'moonfly',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   "xeind/nightingale.nvim",
  --   lazy = false,
  --   priority = 1000
  -- },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim"
  -- },
  -- {
  --   "mcauley-penney/techbase.nvim",
  -- },
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {}
  -- },
  -- {
  --   "sainnhe/everforest",
  -- },
}
