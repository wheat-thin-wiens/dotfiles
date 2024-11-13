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
        styles = {
          comments = { 'italic' },
          functions = { 'italic' },
          loops = { 'italic' },
        }
          })
		    end
	},
  -- {
  --   "oxfist/night-owl.nvim",
  --   priority = 1000,
  --   config = function ()
  --     require("night-owl").setup()
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function ()
  --     require("rose-pine").setup({
  --       variant = "main" --(main, moon, dawn)
  --     })
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa",
  --   config = function ()
  --     require("kanagawa").setup({
  --       theme = "wave", --(wave, dragon, lotus)
  --     })
  --   end
  -- },
  -- {
  --   "bluz71/vim-moonfly-colors",
  --   name = "moonfly",
  --   lazy = false,
  --   priority = 1000
  -- }
}
