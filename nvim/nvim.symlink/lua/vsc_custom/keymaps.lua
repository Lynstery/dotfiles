local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- inverse undo
keymap("n", "U", "<C-r>")
