return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
        "size",
      },
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
      },
    })
  end,

  -- Open Parent Directory in Oil
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
