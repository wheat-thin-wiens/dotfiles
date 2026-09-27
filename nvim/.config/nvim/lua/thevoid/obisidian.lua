return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = "*",
  lazy = true,
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/notes"
      }
    }
  }
}
