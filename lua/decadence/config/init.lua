require("decadence.config.remap")
require("decadence.config.autocmd")
if not vim.g.vscode then
    require("decadence.config.lazy")
end
require("decadence.config.set")
require("decadence.config.neovide")
