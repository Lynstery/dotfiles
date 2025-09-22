vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "neo-tree", "aerial", "Outline" },
  callback = function()
    vim.opt_local.winbar = nil
  end,
})

local uv = vim.uv

vim.api.nvim_create_autocmd({ "VimEnter", "VimLeave" }, {
  callback = function()
    if vim.env.TMUX_PLUGIN_MANAGER_PATH then
      vim.loop.spawn("uv", {
        args = {
          "run",
          "--quiet",
          vim.env.TMUX_PLUGIN_MANAGER_PATH .. "/tmux-window-name/scripts/rename_session_windows.py",
        },
      })
    end
  end,
})
