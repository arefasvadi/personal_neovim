-- Accessors
local g = vim.g
local opt = vim.opt
local keymap = vim.api.nvim_set_keymap
local api = vim.api
-- Basic options
g.mapleader = " "
g.maplocalleader = " "
-- g.clipboard = unnamedplus
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.cursorline = true -- highlight the current cursor line
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- turn off swapfile
opt.swapfile = false
-- Keymaps
local km_opts = { noremap = true, silent = true }
keymap("", "<SPACE>", "<NOP>", km_opts)
local term_km_opts = { silent = true }
keymap(
  "i",
  "jk",
  "<ESC>",
  { noremap = km_opts.noremap, silent = km_opts.silent, desc = "Go to normal mode" }
)
-- kinda messes with which-key prefix
-- keymap("n", "<leader>", ":WhichKey<CR>", km_opts)
keymap("v", "p", '"_dP"', km_opts)
keymap("n", "H", "<C-w>h", km_opts)
keymap("n", "L", "<C-w>l", km_opts)
keymap("n", "J", "<C-w>j", km_opts)
keymap("n", "K", "<C-w>k", km_opts)
