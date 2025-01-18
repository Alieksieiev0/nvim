return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
	},
	config = function()
		require("go").setup({
			tag_options = "",
			run_in_floaterm = true,
		})
		vim.keymap.set("n", "<leader>gj", function()
			vim.cmd.GoAddTag()
		end)
		vim.keymap.set("n", "<leader>th", "<cmd>silent !go tool cover -html cover.cov -o cover.html<CR>")
		vim.keymap.set("n", "<leader>to", "<cmd>!xdg-open cover.html<CR>")
		vim.keymap.set("n", "<leader>tv", function()
			vim.cmd("GoAltV!")
		end)
		vim.keymap.set("n", "<leader>ie", function()
			vim.cmd.GoIfErr()
		end)
		vim.keymap.set("n", "<leader>fs", function()
			vim.cmd.GoFillStruct()
		end)
		vim.keymap.set("n", "<leader>fw", function()
			vim.cmd.GoFillSwitch()
		end)
		vim.keymap.set("n", "<leader>fp", function()
			vim.cmd.GoFixPlurals()
		end)
		-- vim.keymap.set('n', '<leader>gd', ":new | setlocal buftype=nofile | .!go doc ")
		vim.keymap.set("n", "<leader>gi", ":GoImpl ")
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
