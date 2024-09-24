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
      'VonHeikemen/lsp-zero.nvim',
      "neovim/nvim-lspconfig",
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
    },
		config = function()
			local cmp = require("cmp")
      -- local cmp_action = require('lsp-zero').cmp_action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
  				completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
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
