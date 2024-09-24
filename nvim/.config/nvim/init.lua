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

-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Other Priority Settings
vim.opt.termguicolors = true

-- Setting Dependencies
require("lazy").setup("plugins")
require("vim-options")
require("theme-picker")

-- Ignore Check Health Warnings
