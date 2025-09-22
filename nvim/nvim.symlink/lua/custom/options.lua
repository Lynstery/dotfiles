-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tab related options
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.wo.number = true

-- enable soft line wrap
vim.opt.wrap = true

-- only one statusline
vim.opt.laststatus = 3

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeout = false

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Big file limit
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- clipboard sync setting
--vim.g.clipboard = 'osc52'
-- 仅把 yank 通过 OSC52 送到本机剪贴板；粘贴用终端的 Cmd+V
vim.g.clipboard = ""
local osc = require("vim.ui.clipboard.osc52")
local copy_plus = osc.copy("+")
-- Yank 后把 0 号寄存器的内容通过 OSC52 发到本地剪贴板
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.operator == "y" then
      local lines = vim.fn.getreg("0", 1, true) -- list<string>
      local regtype = vim.fn.getregtype("0") -- 'v', 'V', or CTRL-V + count
      copy_plus(lines, regtype)
    end
  end,
})

-- input method switch
_G.last_im_select = ""

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    _G.last_im_select = vim.fn.system("im-select")
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if _G.last_im_select ~= "" then
      vim.cmd("silent !im-select " .. _G.last_im_select)
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("silent !im-select com.apple.keylayout.ABC")
  end,
})
