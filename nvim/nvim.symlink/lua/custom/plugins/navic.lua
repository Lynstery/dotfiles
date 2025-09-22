return {
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      lsp = {
        auto_attach = true,
        preference = nil,
      },
    },
  },
}
