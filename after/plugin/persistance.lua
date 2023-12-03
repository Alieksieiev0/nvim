local persistence = require("persistence")

persistence.setup({
    options = vim.opt.sessionoptions:get()
})

local keymap = vim.keymap

keymap.set("n", "<leader>qs", function() persistence.load() end) --Restore Session
keymap.set("n", "<leader>ql", function() persistence.load({ last = true }) end) --Restore Last Session
