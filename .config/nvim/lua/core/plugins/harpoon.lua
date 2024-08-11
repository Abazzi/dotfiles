return {
  "ThePrimeagen/harpoon",
  -- Harpoon Keybinds
  vim.keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Open Menu" }),
  vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add File" }),
  vim.keymap.set("n", "<leader>hr", "<cmd>lua require('harpoon.mark').remove_file()<cr>", { desc = "Remove File" }),
  vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Next File" }),
  vim.keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Previous File" }),
  vim.keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go To File 1" }),
  vim.keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go To File 2" }),
  vim.keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go To File 3" }),
  vim.keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Go To File 4" }),
  vim.keymap.set("n", "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Go To File 5" })
}
