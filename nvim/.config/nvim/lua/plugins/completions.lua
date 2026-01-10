return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
     -- config = function()
     --  require("luasnip").filetype_extend("javascript")
		  -- require("luasnip.loaders.from_vscode").lazy_load()
     -- end,
	},
	{
		"hrsh7th/nvim-cmp",
    dependencies = {
      -- 'VonHeikemen/lsp-zero.nvim',
      "neovim/nvim-lspconfig",
      'hrsh7th/cmp-nvim-lsp',
      -- 'hrsh7th/cmp-buffer',
      -- 'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- 'onsails/lspkind.nvim',
      -- { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
		config = function()
			local cmp = require("cmp")
      -- local cmp_action = require('lsp-zero').cmp_action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      -- local lspkind = require("lspkind")

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
            vim_item.kind = string.format('%s (%s)', kind_icons[vim_item.kind], vim_item.kind)
            -- vim_item.menu = ({
            --   buffer = "[Buffer]",
            --   nvim_lsp = "[LSP]",
            --   luasnip = "[LuaSnip]",
            --   nvim_lua = "[Lua]",
            --   latex_symbols = "[LaTeX]",
            -- })[entry.source_name]
            local strings = vim.split(vim_item.kind, "%s", { trimempty = false })
            vim_item.kind = "" .. (strings[1] or "") .. " "
            vim_item.menu = " " .. (strings[2] or "") .. ""
            return vim_item
          end
        },
        -- formatting = {
        --   fields = { "kind", "abbr", "menu" },
        --   expandable_indicator = true,
        --   format = function(entry, vim_item)
        --     local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        --     local strings = vim.split(kind.kind, "%s", { trimempty = false })
        --     kind.kind = " " .. (strings[1] or "") .. " "
        --     kind.menu = " (" .. (strings[2] or "") .. ") "
        --     vim_item.dup = nil
        --     return kind
        --   end
        -- },
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
          { name = "path" },
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
}
