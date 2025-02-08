return {
	{
		"williamboman/mason.nvim",
    lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "markdown_oxide",
          "pyright",
          "ts_ls"
        }
      })
    end,
    lazy = false,
		opts = {
      auto_install = true
    },
	},
	{
		"neovim/nvim-lspconfig",
    dependencies = {},
    lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
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
			lspconfig.rnix.setup({
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
			-- lspconfig.tailwindcss.setup({
			-- 	capabilities = capabilities
			-- })
        lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
      })

		end,
	},
}
