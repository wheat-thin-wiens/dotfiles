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
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
      require("rose-pine").setup({
        variant = "main" --(main, moon, dawn)
      })
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      transparency = false,
      styles = {}
    }
  },
  {
    "steguiosaur/fullerene.nvim",
    lazy = false,
    priority = 1000
  },
}
