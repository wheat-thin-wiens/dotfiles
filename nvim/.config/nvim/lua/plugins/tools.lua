return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  -- Tree-Sitter Manager
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = { "lua" },
        auto_install = true,
        highlight = true,
      })
    end
  },
}
