return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
    },
    config = function()
        require("go").setup({
            tag_options = '',
            run_in_floaterm = true
        })
        vim.keymap.set('n', '<leader>gj', function() vim.cmd.GoAddTag() end)
        vim.keymap.set('n', '<leader>gta', function() vim.cmd.GoTest("-v") end)
        vim.keymap.set('n', '<leader>gtf', function() vim.cmd.GoTestFile("-v") end)
        vim.keymap.set('n', '<leader>gtn', function() vim.cmd.GoAddTest() end)
        vim.keymap.set('n', '<leader>gts', function() vim.cmd("GoAlt!") end)
        vim.keymap.set('n', '<leader>gtv', function() vim.cmd("GoAltV!") end)
        vim.keymap.set('n', '<leader>ge', function() vim.cmd.GoIfErr() end)
        vim.keymap.set('n', '<leader>gi', function() vim.cmd.GoToggleInlay() end)
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
