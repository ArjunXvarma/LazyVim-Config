local function transparent()
  local groups = {
    -- Main editor
    "Normal",
    "NormalNC",
    "EndOfBuffer",

    -- Line number column
    "LineNr",
    "CursorLineNr",
    "SignColumn",
    "FoldColumn",

    -- Floating windows
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",

    -- Status line
    "StatusLine",
    "StatusLineNC",

    -- Window separators
    "WinSeparator",
    "VertSplit",

    -- Popup menu
    "Pmenu",
    "PmenuSel",

    -- Telescope
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",

    -- Neo-tree
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator",
    "NeoTreeVertSplit",
    "NeoTreeFloatBorder",
    "NeoTreeFloatTitle",

    -- Which-key
    "WhichKeyFloat",

    -- Messages
    "MsgArea",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

-- Apply now
transparent()

-- Reapply whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = transparent,
})
