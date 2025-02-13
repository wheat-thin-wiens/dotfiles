return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
     --config = function()
     --  require("luasnip").filetype_extend("javascript")
		 --  require("luasnip.loaders.from_vscode").lazy_load()
     --end,
	},
	{
		"hrsh7th/nvim-cmp",
    dependencies = {
      -- 'VonHeikemen/lsp-zero.nvim',
      "neovim/nvim-lspconfig",
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim'
    },
		config = function()
			local cmp = require("cmp")
      -- local cmp_action = require('lsp-zero').cmp_action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      -- local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
          -- completion = {
          --   winhighlight = "Normal:Pmenu,FloatBorder:None,Search:None",
          --   col_offset = -3,
          --   side_padding = 0
          -- },
  				completion = cmp.config.window.bordered({}),
					documentation = cmp.config.window.bordered(),
				},
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = "" .. (strings[1] or "") .. ""
            -- kind.menu = " (" .. (strings[2] or "") .. ")"
            return kind
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
}
