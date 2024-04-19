return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require('refactoring').setup({
            -- prompt for return type
            prompt_func_return_type = {
                go = true,
            },
            -- prompt for function parameters
            prompt_func_param_type = {
                go = true,
            },

            show_success_message = true
        })

        vim.keymap.set("x", "<leader>rf", ":Refactor extract ")
        vim.keymap.set("n", "<leader>rF", ":Refactor inline_func")
        vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
        vim.keymap.set({ "n", "x" }, "<leader>rV", ":Refactor inline_var")
        vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
        vim.keymap.set(
            "n",
            "<leader>rpf",
            function() require('refactoring').debug.printf({ below = false }) end
        )
        vim.keymap.set({ "x", "n" }, "<leader>rpv", function() require('refactoring').debug.print_var() end)
        vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end)
    end,
}
