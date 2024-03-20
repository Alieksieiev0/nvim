return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                go = { "goimports", "gofumt", "golines", "gomodifytags" },
                javascript = { { "prettierd", "prettier" } },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ async = false })
        end
        )
    end
}
