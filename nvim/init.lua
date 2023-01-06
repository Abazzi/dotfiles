vim.g.mapleader = " "

vim.api.nvim_set_keymap('i','jk','<ESC>', {noremap = true})

vim.o.relativenumber = true

local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4


require('packer-plugins')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('mason').setup()
require('treesitter')
require('lualine').setup()
