return {
	"Juksuu/worktrees.nvim",
	config = function()
		require("worktrees").setup()
		vim.keymap.set("n", "<leader>wc", function()
			vim.cmd.GitWorktreeCreateExisting()
		end)
	end,
}
