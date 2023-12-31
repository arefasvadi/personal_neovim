return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },
    })
  end,
}
