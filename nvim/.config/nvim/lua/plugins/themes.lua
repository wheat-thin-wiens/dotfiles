return {
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"catppuccin/nvim",
  	name = "catppuccin",
		priority = 1000,
		    config = function()
          require("catppuccin").setup({
            transparent_background = true,
        styles = {
          comments = { 'italic' },
          functions = { 'italic' },
          loops = { 'italic' },
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
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function ()
      require("kanagawa").setup({
        theme = "wave", --(wave, dragon, lotus)
      })
    end
  },
}
