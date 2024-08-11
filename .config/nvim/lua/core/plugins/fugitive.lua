return {
  'tpope/vim-fugitive',
  -- Fugitive Keybinds
  vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>", { desc = "Fugitive: Open Horizontal" }),
  vim.keymap.set("n", "<leader>gv", "<cmd>vertical G<cr>", { desc = "Fugitive: Open Vertical" })
}
