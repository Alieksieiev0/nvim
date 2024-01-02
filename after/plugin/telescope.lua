local builtin = require('telescope.builtin')
require('telescope').load_extension('projects')

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>to', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', ":lua require'telescope'.extensions.projects.projects{}<CR>")
