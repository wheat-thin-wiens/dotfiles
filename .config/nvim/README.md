# NeoVim Configuration

For my configuration, I followed TypeCraft's build guide series on YouTube.
TypeCraft included the following plugins in [his build guide](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&ab_channel=typecraft):

- [alpha](https://github.com/goolord/alpha-nvim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [luasnip](https://github.com/L3MON4D3/LuaSnip)
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lsp-config](https://github.com/williamboman/mason-lspconfig.nvim)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [none-ls](https://github.com/nvimtools/none-ls.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lsp-config](https://github.com/neovim/nvim-lspconfig)
- [nvim-tmux navigator](https://github.com/christoomey/vim-tmux-navigator)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes)
- [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesittera)

I have added the following plugins:

- [autopairs](https://github.com/windwp/nvim-autopairs)
- [auto-save](https://github.com/pocco81/auto-save.nvim)
- [fine-cmdline](https://github.com/VonHeikemen/fine-cmdline.nvim)
- [searchbox](https://github.com/VonHeikemen/searchbox.nvim)
- [telescope-undo](https://github.com/debugloop/telescope-undo.nvim)
- [which-key](https://github.com/folke/which-key.nvim)

as well as these themes:

- [nightfox](https://github.com/EdenEast/nightfox.nvim)
- [cyberdream](https://github.com/scottmckendry/cyberdream.nvim)
- [blue-moon](https://github.com/kyazdani42/blue-moon)
- [rasmus](https://github.com/kvrohit/rasmus.nvim)

All of these packages are managed by Lazy and are stored in the
``/lua/plugins``
directory, making them modular and super easy to manage and configure.

I have also configured most of my keymaps in
``/lua/vim.options.lua``
which I have set to be loaded on startup in my init.lua file.
