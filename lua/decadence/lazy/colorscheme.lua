return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "night" },
    },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "savq/melange-nvim"
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                highlight_groups = {
                    TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    TelescopeNormal = { bg = "none" },
                    TelescopePromptNormal = { bg = "base" },
                    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    TelescopeSelection = { fg = "text", bg = "base" },
                    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                    NotifyERRORBorder = { fg = "highlight_high", bg = "none" },
                    NotifyWARNBorder = { fg = "highlight_high", bg = "none" },
                    NotifyINFOBorder = { fg = "highlight_high", bg = "none" },
                    NotifyDEBUGBorder = { fg = "highlight_high", bg = "none" },
                    NotifyTRACEBorder = { fg = "highlight_high", bg = "none" },
                    HarpoonActive = { fg = 'text', bg = 'none' },
                    HarpoonInactive = { fg = 'subtle', bg = 'none' },
                    HarpoonNumberActive = { fg = 'text', bg = 'none' },
                    HarpoonNumberInactive = { fg = 'subtle', bg = 'none' },
                    TabLineFill = { fg = 'highlight_high', bg = 'none' },
                }
            })
        end,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic'.load()
        end
    }
}
