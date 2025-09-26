---@diagnostic disable: missing-fields
require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = false },
  styles = {
    terminal = {
      relative = "editor",
      border = "rounded",
      position = "float",
      backdrop = 60,
      height = 0.9,
      width = 0.9,
      zindex = 50,
    },
    snacks_image = {
      relative = "editor",
      col = -1,
    },
  },
  image = {
    enabled = true,
    wo = {
      winhighlight = "FloatBorder:WhichKeyBorder",
    },
    doc = { inline = false, float = false, max_width = 80, max_height = 40 },
    math = { latex = { font_size = "small" } },
  },
  indent = {
    enabled = true,
    animate = {
      enabled = false,
    },
    indent = {
      only_scope = true,
    },
    scope = {
      enabled = true, -- enable highlighting the current scope
      underline = true, -- underline the start of the scope
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the top-level scope which will be rendered as a scope.
      enabled = true,
      char = {
        corner_top = "╭",
        corner_bottom = "╰",
        horizontal = "─",
        vertical = "│",
        arrow = "─",
      },
    },
  },
  input = { enabled = true },
  lazygit = {
    enabled = true,
    configure = false,
  },
  notifier = {
    enabled = true,
    style = "notification",
  },
  picker = {
    enabled = true,
    previewers = {
      diff = {
        builtin = false, -- use Neovim for previewing diffs (true) or use an external tool (false)
        cmd = { "delta" }, -- example to show a diff with delta
      },
      git = {
        builtin = false, -- use Neovim for previewing git output (true) or use git (false)
        args = {}, -- additional arguments passed to the git command. Useful to set pager options using `-c ...`
      },
    },
    sources = {
      spelling = {
        layout = { preset = "select" },
      },
    },
    win = {
      input = {
        keys = {
          ["<Tab>"] = { "select_and_prev", mode = { "i", "n" } },
          ["<S-Tab>"] = { "select_and_next", mode = { "i", "n" } },
          ["<A-Up>"] = { "history_back", mode = { "n", "i" } },
          ["<A-Down>"] = { "history_forward", mode = { "n", "i" } },
          ["<A-j>"] = { "list_down", mode = { "n", "i" } },
          ["<A-k>"] = { "list_up", mode = { "n", "i" } },
          ["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
          ["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
          ["<A-u>"] = { "list_scroll_up", mode = { "n", "i" } },
          ["<A-d>"] = { "list_scroll_down", mode = { "n", "i" } },
          ["<c-j>"] = {},
          ["<c-k>"] = {},
        },
      },
    },
    layout = {
      preset = "telescope",
    },
  },
  quickfile = { enabled = true },
  scroll = { enabled = false },
  -- Create keymappings of `ii` and `ai` for textobjects, and `[i` and `]i` for jumps

  statuscolumn = { enabled = true },
  terminal = {
    enabled = true,
  },
  words = { enabled = true },
})
