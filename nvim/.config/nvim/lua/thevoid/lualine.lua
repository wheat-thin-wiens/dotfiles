local problematic = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "kdheepak/tabline.nvim"
  },
  config = function()
    local vim_icons = {
      function()
        return ""
      end,
      separator = { left = "", right = "" }
    }

    local space = {
      function()
        return " "
      end
    }

    local filename = {
      "filename",
      separator = { left = "", right = "" },
    }

    local filetype = {
      "filetype",
      icon_only = true,
      colored = true,
      separator = { left = "", right = "" },
    }

    local filetype_tab = {
      "filetype",
      icon_only = true,
      colord = true
    }

    local buffer = {
      require "tabline".tabline_tabs,
      separator = { left = "", right = "" },
    }

    local tabs = {
      require 'tabline'.tabline_tabs,
      separator = { left = "", right = "" },
    }

    local fileformat = {
      "fileformat",
      separator = { left = "", right = "" },
    }

    local encoding = {
      "encoding",
      separator = { left = "", right = "" },
    }

    local branch = {
      "branch",
      separator = { left = "", right = "" },
    }

    local diff = {
      "diff",
      separator = { left = "", right = "" },
    }

    local modes = {
      "mode",
      fmt = function(str) return str:sub(1, 1) end,
      separator = { left = "", right = "" },
    }

    local function getLspName()
      local msg = "No active LSP"
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()

      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name  --""
        end
      end
      return msg
    end

    local dia = {
      "diagnostics",
      separator = { left = "", right = "" },
    }

    local lsp = {
      function()
        return getLspName()
      end,
      separator = { left = "", right = "" },
    }

    require('lualine').setup {
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = {
          left = '',
          right = ''
        },
        section_separators = {
          left = '',
          right = ''
        },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },

      sections = {
        lualine_a = {
          modes,
          vim_icons,
        },
        lualine_b = {
          filename,
          space
        },
        lualine_c = {
          filetype,
          branch,
          diff,
        },
        lualine_x = {
          space
        },
        lualine_y = {
          --encoding,
          fileformat,
          dia,
          space,
        },
        lualine_z = {
          lsp,
        },
        inactive_section = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        winbar = {},
        inactive_winbar = {},
      }
    }
  end
}


return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()

    local function getLspName()
      local msg = ' '
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()

      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name  --""
        end
      end
      return msg
    end

    local lsp = {
      function()
        return getLspName()
      end
    }

    local filetype = {
      "filetype",
      icon_only = true,
      colored = true
    }

    local vim_icons = {
      function()
        return ""
      end,
    }

    require('lualine').setup({
      options = {
        theme = 'auto',
        disabled_filetypes = {"neo-tree"},
        component_separators = '',
        --section_separators = { left = '', right = '' },
        section_separators = ''
      },
      sections = {
        lualine_a = {vim_icons, 'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {filetype},
        lualine_y = {'diagnostics',},
        lualine_z = {lsp,}
      }
    })
  end
}

