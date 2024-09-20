vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.fillchars = { eob = "~" }
--vim.cmd("set textwidth=75")
--vim.opt.wrap=true

-- NVIM / TMUX Navigator
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Common Keymaps
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', '<C-a>', ":w <CR>")
vim.keymap.set('n', 'ZZ', ":wqa <CR>")
vim.keymap.set('n', '<leader>pf', ':Ex <CR>')
vim.keymap.set('n', '<leader>h', ':noh <CR>')

-- Plugin Keymaps
vim.keymap.set('n', '<C-n>', ':Neotree toggle <CR>', {})
vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fr', ':SearchBoxReplace <CR>', {noremap = true})
vim.keymap.set('n', '<leader>ct', ":Colortils <CR>")
vim.keymap.set('n', '<leader>lss', ":LiveServerStart <CR>")
vim.keymap.set('n', '<leader>lsq', ":LiveServerStop <CR>")
