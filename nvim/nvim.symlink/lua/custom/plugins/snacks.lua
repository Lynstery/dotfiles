return {
  "folke/snacks.nvim",
  lazy = false,
  config = function()
    require("custom.config.snacks")

    local map = function(mode, key, func, desc)
      vim.keymap.set(mode, key, func, { desc = desc })
    end

    -- all keymaps for snacks.picker
    map("n", "<leader>ff", Snacks.picker.smart, "[Snacks] Smart find file")
    map("n", "<leader>fo", Snacks.picker.recent, "[Snacks] Find recent file")
    map("n", "<leader>fw", Snacks.picker.grep, "[Snacks] Find content")
    map("n", "<leader>fh", function()
      Snacks.picker.help({ layout = "dropdown" })
    end, "[Snacks] Find in help")
    map("n", "<leader>fl", Snacks.picker.picker_layouts, "[Snacks] Find picker layout")
    map("n", "<leader>fk", function()
      Snacks.picker.keymaps({ layout = "dropdown" })
    end, "[Snacks] Find keymap")
    map("n", "<leader><leader>", function()
      Snacks.picker.buffers({ sort_lastused = true })
    end, "[Snacks] Find buffers")
    map("n", "<leader>fm", Snacks.picker.marks, "[Snacks] Find mark")
    map("n", "<leader>fn", function()
      Snacks.picker.notifications({ layout = "dropdown" })
    end, "[Snacks] Find notification")
    map("n", "<leader>fS", Snacks.picker.lsp_workspace_symbols, "[Snacks] Find workspace symbol")
    map("n", "<leader>fs", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_clients({ bufnr = bufnr })

      local function has_lsp_symbols()
        for _, client in ipairs(clients) do
          if client.server_capabilities.documentSymbolProvider then
            return true
          end
        end
        return false
      end

      if has_lsp_symbols() then
        Snacks.picker.lsp_symbols({
          layout = "dropdown",
          tree = true,
          -- on_show = function()
          --   vim.cmd.stopinsert()
          -- end,
        })
      else
        Snacks.picker.treesitter()
      end
    end, "[Snacks] Find symbol in current buffer")
    map("n", "<leader>fi", Snacks.picker.icons, "[Snacks] Find icon")
    map("n", "<leader>fb", Snacks.picker.lines, "[Snacks] Find lines in current buffer")
    map("n", "<leader>fd", Snacks.picker.diagnostics_buffer, "[Snacks] Find diagnostic in current buffer")
    map("n", "<leader>fH", Snacks.picker.highlights, "[Snacks] Find highlight")
    map("n", "<leader>fc", function()
      Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end, "[Snacks] Find nvim config file")
    map("n", "<leader>f/", Snacks.picker.search_history, "[Snacks] Find search history")
    map("n", "<leader>fj", Snacks.picker.jumps, "[Snacks] Find jump")
    map("n", "<leader>ft", function()
      if vim.bo.filetype == "markdown" then
        Snacks.picker.grep_buffers({
          finder = "grep",
          format = "file",
          prompt = " ",
          search = "^\\s*- \\[ \\]",
          regex = true,
          live = false,
          args = { "--no-ignore" },
          on_show = function()
            vim.cmd.stopinsert()
          end,
          buffers = false,
          supports_live = false,
          layout = "ivy",
        })
      else
        Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "HACK" }, layout = "select" })
      end
    end, "[Snacks] Find todo")
    -- LSP
    map("n", "gd", Snacks.picker.lsp_definitions, "[Snacks] Goto definition")
    map("n", "gD", Snacks.picker.lsp_declarations, "[Snacks] Goto declaration")
    map("n", "gr", Snacks.picker.lsp_references, "[Snacks] References")
    map("n", "gI", Snacks.picker.lsp_implementations, "[Snacks] Goto implementation")
    map("n", "gy", Snacks.picker.lsp_type_definitions, "[Snacks] Goto type definition")
    -- Words
    map({ "n", "v" }, "]]", function()
      Snacks.words.jump(vim.v.count1)
    end, "[Snacks] Next References")
    map({ "n", "v" }, "[[", function()
      Snacks.words.jump(-vim.v.count1)
    end, "[Snacks] Prev References")
    map("n", "<leader>z", function()
      Snacks.zen()
    end, "[Snacks] Toggle Zen Mode")
    map("n", "<leader>Z", function()
      Snacks.zen.zoom()
    end, "[Snacks] Toggle Zoom")
    -- other snacks features
    map("n", "<leader>bc", Snacks.bufdelete.delete, "[Snacks] Delete buffers")
    map("n", "<leader>bC", Snacks.bufdelete.other, "[Snacks] Delete other buffers")
    map("n", "<leader>gg", function()
      Snacks.lazygit({ cwd = Snacks.git.get_root() })
    end, "[Snacks] Open lazygit")
    map("n", "<leader>n", Snacks.notifier.show_history, "[Snacks] Show Notification history")
    map("n", "<leader>N", Snacks.notifier.hide, "[Snacks] Hide Notification history")
    map("n", "<leader>gb", Snacks.git.blame_line, "[Snacks] Git blame line")

    -- Create some toggle mappings
    Snacks.toggle.dim():map("<leader>tD")
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
    Snacks.toggle.diagnostics():map("<leader>td")
    Snacks.toggle.line_number():map("<leader>tl")
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
      :map("<leader>tc")
    Snacks.toggle.treesitter():map("<leader>tT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
    Snacks.toggle.inlay_hints():map("<leader>th")
    Snacks.toggle.indent():map("<leader>tg")
    Snacks.toggle.dim():map("<leader>tD")
    -- Toggle the profiler
    Snacks.toggle.profiler():map("<leader>tpp")
    -- Toggle the profiler highlights
    Snacks.toggle.profiler_highlights():map("<leader>tph")
  end,
}
