function ApplyColor(color)
	print(color)
	color = color or "rose-pine"
	vim.o.termguicolors = true
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(1, "NormalFloat", { bg = "none" })
end

ApplyColor()
