return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      use_libuv_file_watcher = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
        }
      },
      default_component_configs = {
        indent = {
          with_expanders = "enabled",
        },
      },
    })
  end
}


