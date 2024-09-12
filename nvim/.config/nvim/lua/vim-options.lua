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

-- Command Keymaps
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")

--vim.keymap.set('n', "lp", vim.cmd.IlluminatePause)
--vim.keymap.set('n', "lr", vim.cmd.IlluminateResume)
--vim.keymap.set('n', "lt", vim.cmd.IlluminateToggle)
vim.keymap.set('n', '<leader>ct', vim.cmd.Colortils)
vim.keymap.set('n', 'ZZ', vim.cmd.wqa)
