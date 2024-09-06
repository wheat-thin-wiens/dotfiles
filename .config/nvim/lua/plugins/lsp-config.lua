return {
	{
		"williamboman/mason.nvim",
    lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
    lazy = false,
		opts = {
      auto_install = true
    },
	},
	{
		"neovim/nvim-lspconfig",
    lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

--      lspconfig.ast_grep.setup({
--        capabilities = capabilities
--      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.markdown_oxide.setup({
				capabilities = capabilities
			})
      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { "dotnet", "/Users/ethanwiens/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"},
      })
			lspconfig.pyright.setup({
				capabilities = capabilities
			})
--			lspconfig.rubocop.setup({
--				capabilities = capabilities
--			})
--      lspconfig.sourcekit.setup({
--        capabilities = {
--          workspace = {
--            didChangeWatchedFiles = {
--              dynamicRegistration = true,
--            },
--          },
--        },
--      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
