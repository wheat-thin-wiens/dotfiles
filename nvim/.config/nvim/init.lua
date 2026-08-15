-- Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.deprecate = function() end

-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Other Priority Settings
vim.opt.termguicolors = true

-- Source Plugins
require("lazy").setup("plugins")

-- Source Local Plugins
require("local.float_term")

-- Source Additional Settings
require("settings.autocmd")
require("settings.colors")
require("settings.keymap")
require("settings.options")

-- require("settings.test")
