return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
        vim.keymap.set("n", "<leader>ga", function() vim.cmd("Git add .") end);
        vim.keymap.set("n", "<leader>gc", function() vim.cmd("Git commit") end);
        vim.keymap.set("n", "<leader>gf", function() vim.cmd("Git diff") end);
    end
}
