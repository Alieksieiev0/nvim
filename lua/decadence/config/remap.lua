vim.g.mapleader = " "
local keymap = vim.keymap;
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "<leader>p", [["_dP]])

--ext greatest remap ever : asbjornHaland
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", function() 
    vim.lsp.buf.format({ async = false })
    vim.cmd("silent !golines . -w")
end
)
keymap.set("n", "<leader>l", function() require("lint").try_lint() end)
keymap.set("n", "<leader>gr", "<cmd>!go run .<CR>")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

keymap.set("n", "<leader>nd", function() require("noice").cmd("dismiss") end)
keymap.set("n", "<leader>nh", function() require("noice").cmd("history") end)


keymap.set("n", "<leader>pr", function() 
    vim.cmd("ProjectRoot")
end)
