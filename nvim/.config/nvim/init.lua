-- Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.deprecate = function() end

-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Require Plugins
require("lazy").setup("plugins")

-- Require Additional Settings
require("settings.keymap")
require("settings.options")
