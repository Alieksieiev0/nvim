local project = require("project_nvim")
project.setup {
    patterns = { ".git", ".mod", },
    ignore_lsp = {"lua_ls", "pylsp", "tsserver", "cssls", "html"},
}
