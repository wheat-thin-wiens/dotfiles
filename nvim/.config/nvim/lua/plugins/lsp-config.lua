return {
  "neovim/nvim-lspconfig",
  dependencies = {},
  lazy = true,
  opts = {
    inlay_hints = { enabled = true },
  },
  config = function()
    -- C LSP
    -- vim.lsp.config['clangd'] = {
    --   cmd = { 'clangd' },
    -- }

    vim.lsp.enable('clangd')

    -- CSS LSP
    vim.lsp.config['cssls'] = {
      cmd = { 'vscode-css-languageserver' },
    }

    vim.lsp.enable('cssls')

    -- Go LSP
    vim.lsp.config['gopls'] = {
      cmd = { 'gopls' },
      filetypes = { 'go' },
    }

    vim.lsp.enable('gopls')

    -- Java
    vim.lsp.config['jdtls'] = {
      cmd = { 'jdtls' },
      filetypes = { 'java' }
    }

    vim.lsp.enable('jdtls')

    -- JSON LSP
    vim.lsp.config['jsonls'] = {
      cmd = { 'vscode-json-languageserver' },
    }

    vim.lsp.enable('jsonls')

    -- Lua LSP
    vim.lsp.config['luals'] = {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.expand "${3rd}/love2d/library"] = true,
            }
          }
        }
      }
    }

    vim.lsp.enable('luals')

    -- C# LSP
    -- vim.lsp.config['omnisharp-roslyn'] = {
    --   cmd = {},
    -- }

    -- vim.lsp.enable('omnisharp')

    -- Python LSP
    -- vim.lsp.config['pyright'] = {
    --   cmd = { 'pyright' },
    -- }

    vim.lsp.enable('pyright')

    -- tailwind LSP
    -- vim.lsp.config['tailwindcss'] = {
    --   cmd = { 'tailwindcss-language-server' },
    -- }

    vim.lsp.enable('tailwindcss')

    -- TypeScript LSP
    -- vim.lsp.config['ts_ls'] = {
    --   cmd = { 'typescript-language-server' },
    -- }

    vim.lsp.enable('ts_ls')

    -- vim.lsp.config.omnisharp.setup({
    --   capabilities = capabilities,
    --   cmd = { "dotnet", "/Users/ethanwiens/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"},
    -- })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efinition"})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]et [R]eferences"})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ctions"})
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {desc = "[C]ode [F]ormat"})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {desc = "[R]e[N]ame"})
  end,
}
