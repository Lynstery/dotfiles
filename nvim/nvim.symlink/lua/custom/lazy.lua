-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  rocks = {
    -- hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
  },
  spec = {
      { import = "custom.plugins" },
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true, notify = false },
  ui = {
    border = "rounded",
  },
})

vim.keymap.set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "[Lazy] Open Lazy.nvim" })
