local abbreviateString = function(str, maxwidth, ellipsis_char)
  if vim.fn.strchars(str) > maxwidth then
    return vim.fn.strcharpart(str, 0, maxwidth) .. ellipsis_char
  end

  return str
end

local cmp_format = function(opts)
  opts = opts or {}
  -- if opts.preset or opts.symbol_map then
  --   opt_symbol_map(opts)
  -- end

  if not opts.maxwidth or type(opts.maxwidth) == "number" or type(opts.maxwidth) == "function" then
    opts.maxwidth = {
      abbr = opts.maxwidth,
      menu = opts.maxwidth,
    }
  end

  return function(entry, vim_item)
    if opts.before then
      vim_item = opts.before(entry, vim_item)
    end

    if opts.menu then
      vim_item.menu = (opts.menu[entry.source.name] ~= nil and opts.menu[entry.source.name] or "")
      .. ((opts.show_labelDetails and vim_item.menu ~= nil) and vim_item.menu or "")
    end

    local ellipsis_char = opts.ellipsis_char or ""

    if opts.maxwidth.menu then
      local maxwidth = opts.maxwidth.menu
      maxwidth = type(maxwidth) == "function" and maxwidth() or maxwidth
      vim_item.menu = abbreviateString(vim_item.menu, maxwidth, ellipsis_char)
    end

    if opts.maxwidth.abbr then
      local maxwidth = opts.maxwidth.abbr
      maxwidth = type(maxwidth) == "function" and maxwidth() or maxwidth
      vim_item.abbr = abbreviateString(vim_item.abbr, maxwidth, ellipsis_char)
    end
    
    return vim_item
  end
end

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
          completion = {
            border = "rounded",
          },
          documentation = {
            border = "rounded",
          },
          -- completion = {
          --   winhighlight = "Normal:Pmenu,FloatBorder:None,Search:None",
          --   col_offset = -3,
          --   side_padding = 0
          -- },
  			  -- completion = cmp.config.window.bordered({}),
					-- documentation = cmp.config.window.bordered(),
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
