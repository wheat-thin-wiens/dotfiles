-- Common Keymaps --
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Esc>", "<Esc>", opts)
vim.keymap.set("i", "<Esc>", "<Esc>", opts)

-- quick scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", {})
vim.keymap.set("v", "<leader>y", "\"+y", {})

-- remove highlighted text from search
vim.keymap.set("n", "<leader>n", "<cmd> noh <CR>")

-- close buffer
vim.keymap.set("n", "<leader>bw", "<cmd> bw <CR>")

-- close terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- vim.keymap.set('n', '<', '<S-<><')

-- enter netRW
-- vim.keymap.set('n', '<leader>pf', '<cmd> Ex <CR>')

-- LSP Keymaps
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efintion"})
-- vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
-- vim.keymap.set({ "n" }, "<leader>vrn", vim.lsp.buf.rename, {desc = "[V]im [R]e[N]ame"})
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "[D]iagnostic [O]pen"})

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
vim.keymap.set("n", "<leader>th", "<cmd> Telescope highlights <CR>", { desc = "[T]elescope [H]ighlights"})

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
vim.keymap.set("n", "<leader>cg", "<cmd> Colortils greyscale <CR>")

-- Live Server
-- vim.keymap.set("n", "<leader>ss", "<cmd> LiveServerStart <CR>", { desc = "[S]erver [S]tart" })
-- vim.keymap.set("n", "<leader>sq", "<cmd> LiveServerStop <CR>", { desc = "[S]erver [Q]uit" })

-- Stat Bastard
-- vim.keymap.set("n", "<leader>sbf", "<cmd> StatBastardFile <CR>", {})

-- Themery
vim.keymap.set("n", "<leader>th", "<cmd> Themery <CR>", {})
