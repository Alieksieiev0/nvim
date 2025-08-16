return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			go = { "golangcilint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			terraform = { "tflint" },
			svelte = { "eslint_d" },
			python = { "ruff" },
		}

		local ns = require("lint").get_namespace("eslint_d")
		vim.diagnostic.config({ underline = false }, ns)
		vim.keymap.set("n", "<leader>l", function()
			require("lint").try_lint()
		end)
		vim.api.nvim_create_user_command("CfinityLintEnable", function(args)
			local golang = require("lint").linters.golangcilint
			golang.cmd = "custom-gcl"
			golang.ignore_exitcode = true
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
		end, {
			desc = "Enable cfinity linter",
			bang = true,
		})
		vim.api.nvim_create_user_command("CfinityLintDisable", function(args)
			local golang = require("lint").linters.golangcilint
			golang.cmd = "golangci-lint"
		end, {
			desc = "Enable cfinity linter",
			bang = true,
		})
	end,
}
