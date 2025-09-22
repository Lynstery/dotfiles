-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vsc_custom.options")
  require("vsc_custom.keymaps")
else
  require("custom.autocmds")
  require("custom.options")
  require("custom.keymaps")
  require("custom.lazy")
end
