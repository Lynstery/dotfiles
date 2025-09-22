return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>e",
        function()
          local api = require("nvim-tree.api")
          local view = require("nvim-tree.view")

          if not view.is_visible() then
            api.tree.open()
          else
            local current_win = vim.api.nvim_get_current_win()
            local tree_win = view.get_winnr()

            if current_win ~= tree_win then
              vim.api.nvim_set_current_win(tree_win)
            else
              api.tree.close()
            end
          end
        end,
        desc = "[NvimTree] Toggle or Focus NvimTree",
      },
    },
    opts = {},
  },
}
