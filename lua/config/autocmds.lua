-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.filetype.add({ extension = { icc = "cpp" } }) -- ROOT uses .icc

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("clang_format_style", { clear = true }),
    pattern = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    callback = function(ev)
        local cf = require("util.clangformat")
        cf.apply(ev.buf)
        cf.guard_autoformat(ev.buf)
    end,
})
