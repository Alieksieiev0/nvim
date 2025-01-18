return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { { "prettierd", "prettier", stop_after_first = true } },
				typescript = { { "prettierd", "prettier", stop_after_first = true } },
				python = { "autopep8" },
				javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				terraform = { "terraform_fmt" },
				hcl = { "terragrunt_hclfmt" },
				html = { "htmlbeautifier" },
				svelte = { { "prettierd", "prettier", stop_after_first = true } },
				css = { "prettierd" },
				java = { "google-java-format" },
				json = { "jq" },
				lua = { "stylua" },
				elixir = { "mix" },
			},
			format_after_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.bo.filetype == "templ" or vim.bo.filetype == "zig" then
					return
				end
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { lsp_fallback = false }
			end,
			formatters = {
				["google-java-format"] = {
					command = "google-java-format",
					prepend_args = { "--aosp" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true })
		end)

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
