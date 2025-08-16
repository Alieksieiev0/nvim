return {

	{
		dir = "~/Programming/personal/lua/plugins/cfinity.nvim",
		config = function()
			require("cfinity")
			require("cfinity.di-go").setup()
		end,
	},
}
