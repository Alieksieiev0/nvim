vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("lint").try_lint()
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("ProjectRoot")
    end
})
