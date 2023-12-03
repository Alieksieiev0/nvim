vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })
        require("lint").try_lint()
    end
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.go",
    callback = function()
        vim.cmd("silent !golines . -w")
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("ProjectRoot")
    end
})
