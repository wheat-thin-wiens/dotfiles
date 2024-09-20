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
            transparent_background = false,
          })
		    end
	},
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("night-owl").setup()
      --vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
      require("rose-pine").setup({
        variant = "main" --(main, moon, dawn)
      })
      --vim.cmd.colorscheme("rose-pine")
    end,
  }
}
