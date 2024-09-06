return {
	{
		"EdenEast/nightfox.nvim",
--		    config = function()
--		      vim.cmd.colorscheme "nightfox"
--		    end
	},
	{
		"catppuccin/nvim",
  	name = "catppuccin",
--		priority = 1000,
--		    config = function()
--          require("catppuccin").setup({
--            flavor = "mocha",
--            transparent_background = true
--          })
--          vim.cmd.colorscheme "catppuccin"
--		    end
	},
	{
		"scottmckendry/cyberdream.nvim",
--		lazy = false,
--		priority = 1000,
--		    config = function ()
--		      require("cyberdream").setup({
--		        transparent = true,
--		        borderless_telescope = false
--		      })
--		      vim.cmd("colorscheme cyberdream")
--		    end
	},
	{
		"kyazdani42/blue-moon",
		--    config = function()
		--      vim.opt.termguicolors = true, vim.cmd("colorscheme blue-moon")
		--    end,
	},
	{
		"kvrohit/rasmus.nvim",
--		config = function()
--			vim.g.rasmus_bold_functions = true
--			vim.g.rasmus_italic_functions = false
--			vim.g.rasmus_italic_variables = false
--			vim.g.rasmus_transparent = true
--			vim.cmd("colorscheme rasmus")
--		end,
	},
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("night-owl").setup()
      vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
--    config = function ()
--      require("rose-pine").setup({
--        variant = "main"
--      })
--      vim.cmd.colorscheme("rose-pine")
--    end,
  }
}
