return {
  "fbuchlak/telescope-directory.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  config = function()
    require('telescope-directory').setup(opts)
  end
}
