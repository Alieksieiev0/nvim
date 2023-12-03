return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        event = "VeryLazy",
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
        }
    },
    { 'L3MON4D3/LuaSnip' },
    { 'mfussenegger/nvim-dap' },
    { 'olexsmir/gopher.nvim' },
    { 'mfussenegger/nvim-lint' },
    { 'windwp/nvim-ts-autotag' },
}
