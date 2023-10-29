return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-dap.nvim",
    "folke/trouble.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    -- local trouble = require("trouble.providers.telescope")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
    telescope.load_extension("fzf")
    -- telescope.load_extension("dap")
  end,
}
