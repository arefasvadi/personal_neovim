return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "c",
        "cpp",
        "cuda",
        "go",
        "rust",
        "hack",
        "latex",
        "php",
        "proto",
        "python",
        "scala",
        "sql",
        "toml",
        "csv",
        "tsv",
        "zig",
        "perl",
        "dockerfile",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
      },
    })
  end,
}
