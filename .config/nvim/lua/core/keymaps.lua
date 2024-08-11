vim.g.mapleader = " "

-- Copy and Paste to clipboard keymaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Move Selected lines up and down
vim.keymap.set("v", "J", [[:move '>+1<CR>gv=gv]], { silent = true })
vim.keymap.set("v", "K", [[:move '<-2<CR>gv=gv]], { silent = true })
vim.keymap.set({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Other file related keymaps
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

--Help/Debug/Conceal keymaps
vim.keymap.set("n", "<leader>Hch", ":set conceallevel=1<cr>", { desc = "hide/conceal" })
vim.keymap.set("n", "<leader>Hcs", ":set conceallevel=0<cr>", { desc = "show/unconceal" })

--Splitting Keymaps
vim.keymap.set("n", "<leader>sv", "<cmd>:vs<cr>", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>:sp<cr>", { desc = "Split Window Horizontally" })

-- Take Screenshot of code with nvim-silicon
vim.keymap.set("v", "<leader>ss", "<cmd>Silicon<cr>", { desc = "Take Screenshot of Code" })
