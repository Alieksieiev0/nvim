local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
        gopls = function()
            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            shadow = true,
                            unusedparams = true
                        },
                        staticcheck = true,
                        gofumpt = true
                    }
                }
            })
        end,
    }
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
    })
})
