return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-go",
    },
    config = function()
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-go")({
                    recursive_run = true,
                }),
            },
        })
        vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
        vim.keymap.set('n', '<leader>ta', function() neotest.watch.toggle(vim.fn.getcwd()) end)
        vim.keymap.set('n', '<leader>tp', function() neotest.output_panel.open() end)
        vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
        vim.keymap.set('n', '[t', function() neotest.jump.prev({ status = "failed" }) end)
        vim.keymap.set('n', ']t', function() neotest.jump.next({ status = "failed" }) end)
    end
}
