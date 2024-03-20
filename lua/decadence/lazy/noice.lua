return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            routes = {
                {
                    view = "split",
                    filter = { event = "msg_show", min_height = 20 },
                },
            },
        })
        vim.keymap.set("n", "<leader>nd", function()
            require("noice").cmd("dismiss")
        end)

        vim.keymap.set("n", "<leader>nh", function()
            require("noice").cmd("history")
        end)
    end
}
