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
