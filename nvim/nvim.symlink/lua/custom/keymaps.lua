local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Windows
--keymap("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
--keymap("n", "<C-j>", "<C-w>j", { desc = "Focus down window" })
--keymap("n", "<C-k>", "<C-w>k", { desc = "Focus up window" })
--keymap("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
keymap("n", "<leader>q", "<C-w>c", { desc = "Close current window" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.keymap.set("n", "x", '"_x', opts)

-- paste preserves primal yanked piece
vim.keymap.set("v", "p", '"_dP', opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- better indent handling
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- removes highlighting after escaping vim search
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- inverse undo
vim.keymap.set("n", "U", "<C-r>")
