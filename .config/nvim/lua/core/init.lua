require("core.set")
require("core.keymaps")
require("core.helpers")

-- Load Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Mapping space as the leading key

require("lazy").setup("core.plugins")
vim.cmd.colorscheme("everforest")
