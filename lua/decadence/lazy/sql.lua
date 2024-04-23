return {
    'nanotee/sqls.nvim',
    config = function()
        vim.keymap.set("n", "<leader>qc", "<cmd>:SqlsSwitchConnection<CR>")
        vim.keymap.set("n", "<leader>qd", "<cmd>:SqlsSwitchDatabase<CR>")
        vim.keymap.set("n", "<leader>qt", "<cmd>:SqlsShowTables<CR>")
        vim.keymap.set("x", "<leader>qe", "<cmd>:SqlsExecuteQuery<CR>")
    end
}
