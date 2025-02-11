-- Vim Options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.backup = false
vim.opt.swapfile = false -- ~/.local/state/nvim/swap
vim.opt.undofile = true -- ~/.local/state/nvim/undo

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.ruler = false
vim.opt.fillchars = { eob = "~" }
vim.opt.wrap = false

-- Appearance
vim.cmd.colorscheme('oldworld')

local LineNumAbove = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })
local LineNum = vim.api.nvim_get_hl(0, { name = "Function", link = true })
local LineNumBelow = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })
local eobCol = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = LineNumAbove.fg })
vim.api.nvim_set_hl(0, "LineNr", { fg = LineNum.fg })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = LineNumBelow.fg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = eobCol.fg })

-- EoB Character Color

-- NVIM Window Navigation
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("n", "<leader>lurn", ":Lazy update rudder.nvim <CR>", {})

-- Common Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Esc>", "<Esc>", opts)
vim.keymap.set("i", "<Esc>", "<Esc>", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>")
vim.keymap.set("n", "<leader>n", "<cmd> noh <CR>")
vim.keymap.set("n", "<leader>bw", "<cmd> bw <CR>")
-- vim.keymap.set('n', '<', '<S-<><')
-- vim.keymap.set('n', '<leader>pf', '<cmd> Ex <CR>')

-- LSP Keymaps
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efintion"})
-- vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
-- vim.keymap.set({ "n" }, "<leader>vrn", vim.lsp.buf.rename, {desc = "[V]im [R]e[N]ame"})

-- NVIM / TMUX Navigator
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")

-- Telescope
local builtin = require("telescope.builtin")
-- vim.keymap.set('n', '<C-p>', ':Telescope find_files <CR>')
vim.keymap.set("n", "<C-p>", function()
	builtin.find_files({ cwd = vim.fn.getcwd(), prompt_title = vim.fn.getcwd() })
end, {})
vim.keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "<leader>lg", "<cmd> Telescope live_grep <CR>", { desc = "[L]ive [G]rep" })
vim.keymap.set("n", "<leader>tu", "<cmd> Telescope undo <CR>", { desc = "[T]elescope [U]ndo" })
vim.keymap.set("n", "<leader>tb", "<cmd> Telescope buffers <CR>", { desc = "[T]elescope [B]uffers" })
vim.keymap.set("n", "<leader>td", function()
	builtin.find_files({ cwd = "~/dotfiles", prompt_title = "// dotfiles //" })
end, { desc = "[T]elescope [D]otfiles" })
vim.keymap.set("n", "<leader>tn", function()
	builtin.find_files({ cwd = "~/dotfiles/nvim/.config/nvim", prompt_title = "// neovim //" })
end, { desc = "[T]elescope [N]eovim" })

-- Neotree
vim.keymap.set("n", "<C-n>", "<cmd> Neotree toggle <CR>", {})

-- Searchbox
-- vim.keymap.set('n', '<leader>ff', ':SearchBoxIncSearch<CR>', {desc = "[FF]ind", noremap = true})
-- vim.keymap.set('n', '<leader>fr', ':SearchBoxReplace <CR>', {desc = "[F]ind [R]eplace", noremap = true})
-- vim.keymap.set('n', '<leader>fc', ':SearchBoxReplace confirm=menu <CR>', {desc = "[F]ind [C]onfirm"})

-- Colortils
vim.keymap.set("n", "<leader>ct", "<cmd> Colortils <CR>")
vim.keymap.set("n", "<leader>cd", "<cmd> Colortils darken <CR>")
vim.keymap.set("n", "<leader>cl", "<cmd> Colortils lighten <CR>")

-- Live Server
vim.keymap.set("n", "<leader>ss", "<cmd> LiveServerStart <CR>", { desc = "[S]erver [S]tart" })
vim.keymap.set("n", "<leader>sq", "<cmd> LiveServerStop <CR>", { desc = "[S]erver [Q]uit" })

-- dewey
vim.keymap.set("n", "<leader>da", "<cmd> DeweyAppend <CR>", { desc = "[D]ewey [A]ppend" })
vim.keymap.set("n", "<leader>ds", "<cmd> DeweyStats <CR>", { desc = "[D]ewey [S]tats" })
