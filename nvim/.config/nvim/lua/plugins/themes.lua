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
    "steguiosaur/fullerene.nvim",
    lazy = false,
    priority = 1000
  },
}
