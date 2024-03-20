return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "rust", "python", "c", "lua", "vim", "vimdoc", "templ", "go", "bash", "json", "json5", "javascript" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            autotag = {
                enable = true
            }
        })
    end,
}
