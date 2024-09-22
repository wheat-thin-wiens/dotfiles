local function normalize_path(path)
  return path:gsub("\\", "/")
end

local function normalize_cwd()
  return normalize_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
  local normalized_path = normalize_path(path)
  local normalized_cwd = normalize_cwd()
  local filename = normalized_path:match("[^/]+$")

  if is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

local function path_display(_, path)
  local stripped_path, filename = split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s ~ %s", filename, stripped_path)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
		config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- local CallTelescope = function(input)
      --   local theme = require('telescope.themes').get_dropdown({})
      --   input(theme)
      -- end

      -- vim.keymap.set('n', '<C-p>', function() CallTelescope(require('telescope.builtin').find_files) end)
      -- vim.keymap.set('n', '<leader>gs', function() CallTelescope(require('telescope.builtin').git_status) end)
      -- vim.keymap.set('n', '<leader>lg', function() CallTelescope(require('telescope.builtin').live_grep) end)

      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          sorting_strategy = "descending",
          path_display = path_display,
          layout_strategy = "flex",
          layout_config = {
            flex = { flip_columns = 110 },
            horizontal = {
              mirror = false,
              prompt_position = "top",
              width = { padding = 20 },
              height = { padding = 3 },
              preview_cutoff = 10,
              preview_width = 0.6,
              },
            vertical = {
              mirror = true,
              prompt_position = "top",
              preview_cutoff = 10,
              preview_height = 0.4,
            }
          },
          mappings = {
            i = {
              -- ["<C-h>"] = require("telescope.actions.which_key").which_key,
              ["<C-o>"] = require("telescope.actions.layout").toggle_preview,
              ["<C-r>"] = require("telescope-undo.actions").restore,
            },
          },
        },
        opts = {
          pickers = {
            find_files = {
              hidden = true,
            }
          }
        }
      })
      telescope.load_extension("undo")
    end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
      local telescope = require("telescope")

			telescope.setup({
				extensions = {
				},
        pickers = {
          find_files = {
            hidden = true
          }
        }
			})
			telescope.load_extension("ui-select")
		end,
	},
}
