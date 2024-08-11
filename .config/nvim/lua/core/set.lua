-- neovim global options
vim.g.have_nerd_font = true

-- neovim options
vim.opt["guicursor"] = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.textwidth = 80

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true

vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.opt.conceallevel = 1
