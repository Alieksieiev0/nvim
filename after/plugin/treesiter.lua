require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "rust", "python", "c", "lua", "vim", "vimdoc", "go", "bash", "json", "json5" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true
    }
}
