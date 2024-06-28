return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set('n', '[d', function() require("trouble").prev({ skip_groups = true, jump = true }) end)
        vim.keymap.set('n', ']d', function() require("trouble").next({ skip_groups = true, jump = true }) end)
        vim.keymap.set('n', '<leader>tw', function() trouble.toggle("diagnostics") end)
    end
}
