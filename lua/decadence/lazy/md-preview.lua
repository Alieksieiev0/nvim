return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_close = 0
        vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <CR>", {})
    end,
}
