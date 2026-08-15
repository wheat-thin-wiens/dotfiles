return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
      settings = {
        save_on_toggle = true,
        save_on_close = false,
      },
    })

    vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, {desc = "Harpoon [A]dd"})
    vim.keymap.set('n', '<leader>hc', function() harpoon:list():clear() end, {desc = "[H]arpoon [C]lear"})
    vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, {desc = "Harpoon [1]"})
    vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, {desc = "Harpoon [2]"})
    vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, {desc = "Harpoon [3]"})
    vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, {desc = "Harpoon [4]"})
    vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end, {desc = "Harpoon [5]"})
    vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)

    -- Clear Harpoon on Startup
    -- local clear = function()
    --   harpoon:list():clear()
    -- end
    --
    -- clear()

    -- Use Telescope UI
    -- Comment to line 83 to use standard UI
    -- local conf = require("telescope.config").values       -- [48-gcc]
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --       table.insert(file_paths, item.value)
    --   end
    --
    --   local make_finder = function()
    --     local paths = {}
    --     for _, item in ipairs(harpoon_files.items) do
    --       table.insert(paths, item.value)
    --     end
    --
    --     return require("telescope.finders").new_table(
    --       {
    --         results = paths
    --       }
    --     )
    --   end
    --
    --   require("telescope.pickers").new({}, {
    --     prompt_title = "Harpoon",
    --     path_display = { "tail" },
    --     finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --     }),
    --     previewer = conf.file_previewer({}),
    --     sorter = conf.generic_sorter({}),
    --     attach_mappings = function(prompt_buffer_number, map)
    --       map(
    --         "i",
    --         "<C-r>",
    --         function()
    --           local state = require("telescope.actions.state")
    --           local selected_entry = state.get_selected_entry()
    --           local current_picker = state.get_current_picker(prompt_buffer_number)
    --
    --           table.remove(harpoon_files.items, selected_entry.index)
    --           current_picker:refresh(make_finder())
    --         end
    --       )
    --
    --       return true
    --     end
    --   }):find()
    -- end
    --
    -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    -- vim.keymap.set('n', "<leader>hr", function() harpoon:list():remove() end, {desc = "[H]arpoon [R]emove"})
  end,
}
