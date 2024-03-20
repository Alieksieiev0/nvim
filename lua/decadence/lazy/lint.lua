return {
    'mfussenegger/nvim-lint',
    config = function()
        require("lint").linters_by_ft = {
            go = { 'golangcilint' },
            javascript = { 'eslint_d' },
        }
        vim.keymap.set("n", "<leader>l", function() require("lint").try_lint() end)
    end
}
