-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================
-- General
-- =========================================================

-- Save file
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<Esc><cmd>w<cr>a", { desc = "Save File" })

-- Quit all
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<cr><Esc>", { desc = "Clear Search Highlight" })

-- Join lines and keep cursor position
map("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Keep cursor centered when searching
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- =========================================================
-- Window Navigation
-- =========================================================

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- =========================================================
-- Splits
-- =========================================================

map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal Split" })
map("n", "<leader>sc", "<cmd>close<cr>", { desc = "Close Split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize Splits" })

-- Find files and open in vertical split
map("n", "<leader>fv", function()
  require("telescope.builtin").find_files()
end, { desc = "Find Files (use Ctrl-v for split)" })

-- =========================================================
-- Buffers
-- =========================================================

map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- =========================================================
-- Tabs
-- =========================================================

map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Jump to tabs 1-9
for i = 1, 9 do
  map("n", "<leader>" .. i, i .. "gt", { desc = "Go to Tab " .. i })
end

-- Move tabs left/right
map("n", "<leader>t,", "<cmd>-tabmove<cr>", { desc = "Move Tab Left" })
map("n", "<leader>t.", "<cmd>+tabmove<cr>", { desc = "Move Tab Right" })

-- =========================================================
-- Editing
-- =========================================================

-- Move lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move Line Down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move Line Up" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move Line Down" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move Line Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Paste without overwriting register
map("x", "<leader>p", [['_dP]], { desc = "Paste Without Yanking" })

-- =========================================================
-- Clipboard
-- =========================================================

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank Line to System Clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete Without Yanking" })

-- =========================================================
-- Diagnostics
-- =========================================================

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- =========================================================
-- Quickfix
-- =========================================================

map("n", "<C-n>", "<cmd>cnext<cr>zz", { desc = "Next Quickfix Item" })
map("n", "<C-p>", "<cmd>cprev<cr>zz", { desc = "Previous Quickfix Item" })

-- =========================================================
-- Terminal
-- =========================================================

map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- =========================================================
-- File Explorer
-- =========================================================

map("n", "<leader>e", "<cmd>Neotree reveal toggle<cr>", { desc = "Toggle Explorer" })

-- =========================================================
-- Telescope
-- =========================================================

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- =========================================================
-- Git
-- =========================================================

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- =========================================================
-- AI
-- =========================================================

map("n", "<leader>ac", "<cmd>CopilotChat<cr>", { desc = "Copilot Chat" })

-- =========================================================
-- Utilities
-- =========================================================

-- Make current file executable
map("n", "<leader>x", "<cmd>!chmod +x %<cr>", { desc = "Make File Executable" })

-- Open current file with default macOS application
map("n", "<leader>ob", "<cmd>!open %<cr>", { desc = "Open in Default App" })
