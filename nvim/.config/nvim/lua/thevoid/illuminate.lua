return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex"
      },
      delay = 10,
    })

    vim.keymap.set('n', 'N', ':lua require("illuminate").goto_next_reference(wrap) <CR>', {desc = "Illuminate [N]ext"})
    vim.keymap.set('n', 'P', ':lua require("illuminate").goto_prev_reference(wrap) <CR>', {desc = "Illuminate [P]rev"})
  end
}
