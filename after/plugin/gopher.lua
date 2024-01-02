local gopher = require("gopher")
gopher.setup {
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
    },
}


vim.keymap.set('n', '<leader>gj', function() vim.cmd("GoTagAdd json") end)
vim.keymap.set('n', '<leader>gts', function() vim.cmd("GoTestAdd") end)
vim.keymap.set('n', '<leader>gta', function() vim.cmd("GoTestsAll") end)
