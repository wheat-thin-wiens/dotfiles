-- Vim Options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")

vim.opt.backup = false
vim.opt.swapfile = false -- ~/.local/state/nvim/swap
vim.opt.undofile = true -- ~/.local/state/nvim/undo

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.ruler = false
vim.opt.fillchars = { eob = "~" }
vim.opt.wrap = false
vim.opt.showmode = false

-- Additional Settings
vim.lsp.document_color.enable()

-- LSP Options
vim.diagnostic.config({ virtual_text = true })

-- Disable deprecated function warning
-- vim.deprecate = function() end
