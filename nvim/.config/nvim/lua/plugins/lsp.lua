return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    lazy = true,
    opts = {
      inlay_ints = { enabled = true },
    },
    config = function()
      -- C
      vim.lsp.enable('clangd')

      -- CSS
      vim.lsp.config['cssls'] = {
        cmd = { 'vscode-css-languageserver --stdio' },
      }

      -- vim.lsp.enable('cssls')

      -- Go
      vim.lsp.config['gopls'] = {
        cmd = { 'gopls' },
        filetypes = { 'go' },
        root_markers = { 'go.mod', 'go.sum' },
        settings = {
          gopls = {
            completionBudget = "500ms",
          }
        }
      }

      vim.lsp.enable('gopls')

      -- Java
      vim.lsp.config['jdtls'] = {
        cmd = { 'jdtls' },
        filetypes = { 'java' },
        root_markers = { 'build.gradle', 'settings.gradle' },
        settings = {
          java = {
            configuration = {
              'updateBuildConfiguration'
            },
            import = {
              gradle = {
                enabled = true
              }
            }
          }
        }
      }

      vim.lsp.enable('jdtls')

      -- JSON
      vim.lsp.config['jsonls'] = {
        cmd = { 'vscode-json-languageserver --stdio' },
      }

      vim.lsp.enable('jsonls')

      -- Kotlin
      vim.lsp.config['kotlin'] = {
        cmd = { 'kotlin-language-server' }
      }

      vim.lsp.enable('kotlin')

      -- Lua
      vim.lsp.config['luals'] = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = {
          '.luarc.json',
          '.luarc.jsonc',
        },
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'hl' },
            },
            workspace = {
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"]         = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                [vim.fn.expand "${3rd}/love2d/library"]   = true,
                [vim.fn.expand "/usr/share/hypr/stubs"]   = true,
              }
            }
          }
        }
      }

      vim.lsp.enable('luals')

      -- Python
      vim.lsp.enable('pyright')

      -- Tailwind
      vim.lsp.enable('tailwindcss')

      -- Typescript
      vim.lsp.enable('ts_ls')

      -- Keymaps
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover { border = "single" } end, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efinition"})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]et [R]eferences"})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ctions"})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {desc = "[C]ode [F]ormat"})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {desc = "[R]e[N]ame"})
    end,
  },
  -- Completions
  {
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "neovim/nvim-lspconfig",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
      },
      config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        require("luasnip.loaders.from_vscode").lazy_load()

        local kind_icons = {
          Text = "",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰇽",
          Variable = "󰀫", -- 󰀫, 󱃠
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "󰅲",
        }

        cmp.setup({
          completion = { completeopt = "noselect" },
          preselect = 'None',
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          window = {
            completion = {
              border = 'rounded',
            },
            documentation = {
              border = 'rounded',
            },
            -- completion = cmp.config.window.bordered({}),
            -- documentation = cmp.config.window.bordered(),
          },
          formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
              vim_item.kind = string.format('%s (%s)', kind_icons[vim_item.kind], vim_item.kind)
              local strings = vim.split(vim_item.kind, "%s", { trimempty = false })
              vim_item.kind = "" .. (strings[1] or "") .. " "
              vim_item.menu = " " .. (strings[2] or "") .. ""
              return vim_item
            end
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            -- ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "tailwindcss" },
          }, {
            { name = "buffer" },
          }),
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
          }),
        })
      end,
    },
  },
  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.mypy.with({
            extra_args = function()
              local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
              return { "--python-executable", virtual .. "/bin/python3"}
            end,
          }),
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettier,
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
