-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
opt.relativenumber = false
opt.number = true

vim.g.colorscheme = "kanagawa-dragon"

-- Use 4 spaces for tabs and indentation
vim.opt.tabstop = 4 -- A tab character appears as 4 spaces
vim.opt.shiftwidth = 4 -- >>, <<, and autoindent use 4 spaces
vim.opt.softtabstop = 4 -- Tab key inserts/removes 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true
