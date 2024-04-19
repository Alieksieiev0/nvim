return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').load_extension('projects')
        require('telescope').load_extension('noice')
        require("telescope").load_extension("git_worktree")
        require("telescope").setup {
            defaults = {
                file_ignore_patterns = { "node_modules" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                }
            }
        }

        vim.keymap.set('n', '<leader>fa', builtin.find_files)
        vim.keymap.set('n', '<leader>fl', builtin.live_grep)
        vim.keymap.set('n', '<leader>fm', builtin.man_pages)
        vim.keymap.set('n', '<leader>fk', builtin.keymaps)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fc', builtin.git_commits)
        vim.keymap.set('n', '<leader>fb', builtin.git_branches)
        vim.keymap.set('n', '<leader>fg', builtin.git_status)
        vim.keymap.set('n', '<leader>wa', function() vim.cmd.Telescope("git_worktree") end)
        vim.keymap.set('n', '<leader>wc', function() vim.cmd.Telescope("git_worktree", "create_git_worktree") end)
        vim.keymap.set('n', '<leader>nl', function() vim.cmd.Telescope("noice") end)
    end,
}
