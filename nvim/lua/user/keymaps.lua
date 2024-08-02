

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader key
local leader_key = "<Space>"
local leader_val = " "

-- Remap leader key
keymap("", leader_key, "<Nop>", opts)
vim.g.mapleader = leader_val
vim.g.maploacalleader = leader_val

-- Breadcrumbs? navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

-- Execute last command
function execute_last_command()
  local last_command = vim.fn.getreg(":")
  vim.api.nvim_command(last_command)
end
keymap("n", "<leader>".."ø", ":lua execute_last_command()<CR>", opts)

-- Editing
keymap("i", "<S-Tab>", "<C-d>", opts) -- dedent rebind
keymap("i", "<C-h>", "<C-w>", opts)

-- Better mulit-window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)

-- -- Quicksave
-- function quicksave()
--   print("[Info] Quicksaved")
--   vim.api.nvim_command(":w")
-- end
-- keymap("n", "<C-s>", ":lua quicksave()<CR>", opts)
-- keymap("i", "<C-s>", ":lua quicksave()<CR>", opts)


--keymap("n", "h", "<Nop>", opts)

-- Unmap keys
--keymap("n", "h", "<Nop>", opts)
--keymap("n", "j", "<Nop>", opts)
--keymap("n", "k", "<Nop>", opts)
--keymap("n", "l", "<Nop>", opts)
-- XXX I don't know what *some* of these do
--keymap("n", "i", "<Nop>", opts)
--keymap("n", "o", "<Nop>", opts)

-- Custom navigation keys
--o_pressed = false
--local function o_pressed():
--  o_pressed = true

--keymap("n", "o", "<cmd>lua o_pressed()<cmd>", opts)

--keymap("n", "j", "h", opts)
--keymap("n", "i", "l", opts)
--keymap("n", "oj", "j", opts)
--keymap("n", "oi", "k", opts)

-- Enter insert mode
--keymap("n", "h", "i", opts)
-- Exit insert mode
--keymap("i", "ji", "<ESC>", opts)
--keymap("i", "ij", "<ESC>", opts)

