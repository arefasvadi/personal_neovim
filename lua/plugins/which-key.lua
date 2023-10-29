return {
  "folke/which-key.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local whichkey = require("which-key")
    local ts_builtin = require("telescope.builtin")

    whichkey.setup()
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    local mapping = {
      e = {
        name = "File explorer options",
        e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
        f = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
      },
      s = {
        name = "Search options",
        f = { ts_builtin.find_files, "Find files" },
        r = { ts_builtin.oldfiles, "Recent files" },
        b = { ts_builtin.buffers, "Find buffers" },
        s = { ts_builtin.live_grep, "Find string" },
        i = { ts_builtin.current_buffer_fuzzy_find, "Find string in current buffer" },
        g = {
          name = "Git options",
          f = {
            function()
              ts_builtin.git_files({ show_untracked = true })
            end,
            "Find git files",
          },
          s = { ts_builtin.git_status, "Find git status" },
          c = { ts_builtin.git_commits, "Find git commits" },
          a = { ts_builtin.git_bcommits, "Find current buffer git commits" },
          b = { ts_builtin.git_branches, "Find git branches" },
          l = { "<cmd>LazyGit<cr>", "Lazy git" },
        },
        k = { ts_builtin.keymaps, "Find keymaps" },
        l = {
          name = "LSP options",
          d = { ts_builtin.diagnostics, "Find diagnostics" },
          s = { ts_builtin.lsp_workspace_symbols, "Find workspace symbols" },
        },
        t = { ts_builtin.treesitter, "Find treesitter" },
        v = {
          name = "Neovim command options",
          c = { ts_builtin.commands, "Find neovim command" },
          k = { ts_builtin.keymaps, "Find neovim keymaps" },
          h = { ts_builtin.help_tags, "Find neovim" },
          o = { ts_builtin.vim_options, "Find options" },
        },
      },
      b = {
        name = "Buffer options",
        d = { "<cmd>bd<cr>", "Close current buffer" },
        n = { "<cmd>bn<cr>", "Next buffer" },
        p = { "<cmd>bp<cr>", "Previous buffer" },
        s = { "<cmd>w<cr>", "Save buffer" },
        a = { "<cmd>wa<cr>", "Save all buffers" },
      },
      w = {
        name = "Winodow options",
        d = { "<cmd>q<cr>", "Close the current window" },
        h = { "<cmd>sp<cr>", "Split window horizontally" },
        v = { "<cmd>vsp<cr>", "Split window vertically" },
        ["="] = { "<cmd>wincmd =<cr>", "Balance windows equally" },
        m = { "<cmd>wincmd _ | wincmd |<cr>", "Maximize window height and width" },
        r = { "<cmd>wincmd r<cr>", "Rotate the window down/right" },
        R = { "<cmd>wincmd R<cr>", "Rotate the window up/left" },
      },
      t = {
        name = "Tab options",
        e = { "<cmd>tabnew<cr>", "Open a new empty tab" },
        o = {
          "<cmd>tabnew | buffer # | bd #<CR>",
          "Open current buffer in a new tab",
        },
        d = { "<cmd>tabclose<cr>" },
      },
      Q = { "<cmd>qa<cr>", "Quit All (Safely)" },
      q = { "<cmd>q<cr>", "Quit buffer" },
      T = { "<cmd>terminal<cr>", "New terminal" },
    }
    whichkey.register(mapping, opts)
  end,
  opts = {},
}
