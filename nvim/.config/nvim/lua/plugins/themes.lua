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
        transparency = true,
        -- high_contrast = true,
        telescope_theme = "borderless",
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
          }
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
  {
    "rose-pine/neovim",
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        variant = "main"
      })
    end
  },
  {
    "bluz71/vim-moonfly-colors",
    name = 'moonfly',
    lazy = false,
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
    "mcauley-penney/techbase.nvim",
  },
  {
    "vague2k/vague.nvim",
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {}
  -- },
  -- {
  --   "sainnhe/everforest",
  -- },
}
