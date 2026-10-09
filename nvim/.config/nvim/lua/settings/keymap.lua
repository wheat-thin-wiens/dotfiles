-- Common Keymaps --
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Esc>", "<Esc>", opts)
vim.keymap.set("i", "<Esc>", "<Esc>", opts)

-- quick scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>")
vim.keymap.set("n", "<leader>wqa", "<cmd> wqa! <CR>")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", {})
vim.keymap.set("v", "<leader>y", "\"+y", {})

-- remove highlighted text from search
vim.keymap.set("n", "<leader>n", "<cmd> noh <CR>")

-- close buffer
vim.keymap.set("n", "<leader>bw", "<cmd> bw <CR>")

-- close terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

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
