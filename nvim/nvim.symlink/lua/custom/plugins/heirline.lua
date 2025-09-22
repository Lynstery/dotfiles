return {
  "rebelot/heirline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
    { "linrongbin16/lsp-progress.nvim", opts = {} },
    config = function()
      require("custom.config.heirline.lspprogress")
    end,
  },
  config = function()
    vim.opt.cmdheight = 0
    require("heirline").setup({
      statusline = require("custom.config.heirline.statusline"),
      winbar = require("custom.config.heirline.winbar"),
    })
  end,
}
