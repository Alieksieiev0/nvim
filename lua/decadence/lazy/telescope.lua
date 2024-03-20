return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').load_extension('projects')
        require('telescope').load_extension('noice')

        vim.keymap.set('n', '<leader>tf', builtin.find_files)
        vim.keymap.set('n', '<leader>to', builtin.oldfiles)
        vim.keymap.set('n', '<leader>tg', builtin.live_grep)
        vim.keymap.set('n', '<leader>tc', builtin.git_commits)
        vim.keymap.set('n', '<leader>tn', function() vim.cmd.Telescope("noice") end)
        vim.keymap.set('n', '<leader>tp', ":lua require'telescope'.extensions.projects.projects{}<CR>")
    end
}
