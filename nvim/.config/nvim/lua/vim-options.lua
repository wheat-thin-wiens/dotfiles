-- Vim Options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.backup = false
vim.opt.swapfile = false    -- ~/.local/state/nvim/swap
vim.opt.undofile = true     -- ~/.local/state/nvim/undo

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.fillchars = { eob = "~" }
--vim.cmd("set textwidth=75")
--vim.opt.wrap=true

-- NVIM Window Navigation
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Common Keymaps
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', '<C-s>', ":w <CR>")
vim.keymap.set('n', '<leader>pf', ':Ex <CR>')
vim.keymap.set('n', '<leader>n', ':noh <CR>')

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efintion"})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
vim.keymap.set({ "n" }, "<leader>vrn", vim.lsp.buf.rename, {desc = "[V]im [R]e[N]ame"})

-- Plugin Keymaps
vim.keymap.set('n', '<C-p>', ':Telescope find_files <CR>')
vim.keymap.set('n', '<leader>gs', ':Telescope git_status <CR>', {desc = "[G]it [S]tatus"})
vim.keymap.set("n", "<leader>lg", ':Telescope live_grep <CR>', {desc = "[L]ive [G]rep"})
vim.keymap.set('n', '<space>u','<cmd>Telescope undo<cr>', {desc = "[U]ndo"})

vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>')

vim.keymap.set('n', '<C-n>', ':Neotree toggle <CR>')

vim.keymap.set('n', '<leader>ff', ':SearchBoxIncSearch<CR>', {desc = "[FF]ind", noremap = true})
vim.keymap.set('n', '<leader>fr', ':SearchBoxReplace <CR>', {desc = "[F]ind [R]eplace", noremap = true})
vim.keymap.set('n', '<leader>fc', ':SearchBoxReplace confirm=menu <CR>', {desc = "[F]ind [C]onfirm"})

vim.keymap.set('n', '<leader>ct', ":Colortils <CR>")

vim.keymap.set('n', '<leader>ss', ":LiveServerStart <CR>", {desc = "[S]erver [S]tart"})
vim.keymap.set('n', '<leader>sq', ":LiveServerStop <CR>", {desc = "[S]erver [Q]uit"})

