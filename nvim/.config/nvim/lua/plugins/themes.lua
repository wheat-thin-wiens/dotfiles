return {
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"catppuccin/nvim",
  	name = "catppuccin",
		priority = 1000,
    opts = {
      transparent_background = true,
      styles = {
        comments = { 'italic' },
        functions = { 'italic' },
        loops = { 'italic' },
      },
    }
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
    "oxfist/night-owl.nvim",
    priority = 1000,
    config = function ()
      require("night-owl").setup()
    end,
  },
  {
    "rei.nvim",
    dev = true,
    opts = {
      styles ={
        functions = { italic = true, bold = true },
        comments = { italic = true },
        loops = { italic = true }
      },
      integrations = {
        telescope = "borderless",
      },
      transparency = true,
      highlight_overrides = {}
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  }
}
