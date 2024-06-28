return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup({
			enabled = false,
		})
		vim.keymap.set("n", "<leader>gb", function()
			vim.cmd.GitBlameToggle()
		end)
	end,
}
