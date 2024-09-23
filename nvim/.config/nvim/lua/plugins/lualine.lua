local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

local window = function()
  return vim.api.nvim_win_get_number(0)
end

M.config = function()
  local vim_icons = {
    function()
      return ""
    end,
  }

  local modes = {
    "mode",
    fmt = function(str) return str:sub(1, 1) end,
  }

  local filetype = {
    "filetype",
    icon_only = true,
    colored = true,
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

  local lsp = {
    function()
      return getLspName()
    end
  }

  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      disabled_filetypes = {"neo-tree"},
      section_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      -- component_separators = { left = "|", right = "|" },
    },
    sections = {
      lualine_a = { vim_icons, "mode", 'filename', },
      lualine_b = {},
      lualine_c = { 'branch', 'diff' },
      lualine_x = { 'diagnostics', filetype, },
      lualine_y = {},
      lualine_z = { lsp, 'location', },
    },
    inactive_sections = {
      lualine_a = { window },
      lualine_b = {},
      lualine_c = { { "filename", symbols = { modified = "[*]" } } },
      lualine_x = { "location", "progress" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }

  -- Better floating window colors
  -- local normal_float_bg = vim.fn.synIDattr(vim.fn.hlID("NormalFloat"), "bg")
  -- print(normal_float_bg)
  -- local normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  -- vim.cmd("highlight FloatBorder guifg=" .. normal_fg .. " guibg=" .. normal_float_bg)
end

return M
