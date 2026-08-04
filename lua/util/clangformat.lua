local M = {}

local cache = {} -- keyed by .clang-format path

local function load_for(bufname)
    local dir = vim.fs.dirname(bufname)
    local found = vim.fs.find({ ".clang-format", "_clang-format" }, { path = dir, upward = true })[1]
    if not found then
        return nil
    end
    if cache[found] ~= nil then
        return cache[found]
    end

    local res = vim.system({
        "clang-format",
        "--style=file",
        "--assume-filename=" .. bufname,
        "--dump-config",
    }, { cwd = vim.fs.dirname(found), text = true }):wait()

    if res.code ~= 0 or not res.stdout then
        cache[found] = false
        return false
    end

    local cfg = {}
    for line in res.stdout:gmatch("[^\r\n]+") do
        local k, v = line:match("^([%w_]+):%s*(%S+)$") -- top-level keys only
        if k then
            cfg[k] = v
        end
    end
    cache[found] = cfg
    return cfg
end

function M.apply(buf)
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" or vim.bo[buf].buftype ~= "" then
        return
    end

    local cfg = load_for(name)
    if not cfg then
        return
    end

    local indent = tonumber(cfg.IndentWidth)
    local tabw = tonumber(cfg.TabWidth)
    local cols = tonumber(cfg.ColumnLimit)

    if indent then
        vim.bo[buf].shiftwidth = indent
        vim.bo[buf].softtabstop = indent
    end
    if tabw then
        vim.bo[buf].tabstop = tabw
    end
    if cfg.UseTab then
        vim.bo[buf].expandtab = cfg.UseTab == "Never"
    end
    if cols and cols > 0 then
        vim.bo[buf].textwidth = cols
    end
end

function M.clear_cache()
    cache = {}
end

function M.guard_autoformat(buf)
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" or not load_for(name) then
        return
    end
    vim.system({ "clang-format", "--style=file", "--dry-run", "-Werror", name }, { text = true }, function(res)
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) then
                vim.b[buf].autoformat = res.code == 0
            end
        end)
    end)
end

return M
