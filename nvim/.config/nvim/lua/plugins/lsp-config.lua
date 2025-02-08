return {
	{
		"williamboman/mason.nvim",
    lazy = false,
    opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "markdown_oxide",
          "pyright",
          "ts_ls",
          "clangd"
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
    opts = {
      inlay_hints = { enabled = true },
    },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { "dotnet", "/Users/ethanwiens/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"},
      })
			lspconfig.pyright.setup({
				capabilities = capabilities
			})
--      lspconfig.sourcekit.setup({
--        capabilities = {
--          workspace = {
--            didChangeWatchedFiles = {
--              dynamicRegistration = true,
--            },
--          },
--        },
--      })
        lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efinition"})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]et [R]eferences"})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ctions"})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {desc = "[C]ode [F]ormat"})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {desc = "[R]e[N]ame"})
		end,
	},
}
