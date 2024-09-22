return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
		config = function()
			--local builtin = require("telescope.builtin")
			--vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			--vim.keymap.set("n", "<space>fg", builtin.live_grep, {})
      --vim.keymap.set('n', 'gs', builtin.git_status, {})
      require("telescope").setup({
        opts = {
          extensions = {
            undo = {
              side_by_side = true,
              layout_strategy = "vertical",
              layout_config = {
                preview_height = 0.8
              },
              mappings = {
                ["<C-r>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        }
      })
      require("telescope").load_extension("undo")
    end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
        pickers = {
          find_files = {
            --theme = "dropdown",
            hidden = true
          }
        }
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
