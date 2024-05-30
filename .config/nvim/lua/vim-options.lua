vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')



--set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--  \,sm:block-blinkwait175-blinkoff150-blinkon175
