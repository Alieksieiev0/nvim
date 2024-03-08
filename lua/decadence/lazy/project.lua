return {
    'ahmedkhalf/project.nvim',
    config = function()
        local project = require("project_nvim")
        project.setup {
            patterns = { ".git", ".mod", },
            ignore_lsp = { "lua_ls", "pylsp", "tsserver", "cssls", "html" },
        }

        vim.keymap.set("n", "<leader>pr", function()
            vim.cmd("ProjectRoot")
        end)
    end
}
