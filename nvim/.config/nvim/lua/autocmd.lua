-- Auto Enable Tree-sitter Highlights
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'go',
    'java',
    'javascript',
    'javascriptreact',
    'lua',
    'python',
    'sh',
    'typescript',
    'typescriptreact'
  },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})
