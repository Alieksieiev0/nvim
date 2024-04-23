return {
    'theprimeagen/harpoon',
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()
        require('harpoon-tabline').setup({
            use_editor_color_scheme = false,
        })


        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-z>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-x>", function() harpoon:list():select(4) end)

        vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
    end,
}
