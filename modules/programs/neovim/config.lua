-- Better Defaults
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.mouse = 'a'

-- Custom keybinds
vim.keymap.set('n', '<A-Down>', '<Cmd>m+1<CR>', { desc = 'Swap line with line below' })
vim.keymap.set('n', '<A-Up>', '<Cmd>m-2<CR>', { desc = 'Swap line with line above' })
vim.keymap.set('n', 'Y', 'yy', { desc = 'Copy entire line' })
