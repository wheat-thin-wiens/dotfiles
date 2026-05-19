return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

-- Last nvim-treesitter lazy-lock entry
-- shell parser broken on this version, but usability was much better
-- "nvim-treesitter": { "branch": "main", "commit": "cf12346a3414fa1b06af75c79faebe7f76df080a" },
