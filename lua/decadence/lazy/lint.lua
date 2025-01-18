return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			go = { "golangcilint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			terraform = { "tflint" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}
		local golang = require("lint").linters.golangcilint
		golang.cmd = "custom-gcl"
		golang.args = {
			"run",
			"--max-issues-per-linter=0",
			"--max-same-issues=0",
			"--out-format",
			"json",
			"--show-stats=false",
			"--print-issued-lines=false",
			"--print-linter-name=false",
			function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
			end,
		}
		vim.keymap.set("n", "<leader>l", function()
			require("lint").try_lint()
		end)
	end,
}
