return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local ls = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-s>"] = cmp.mapping(function(fallback)
					if cmp.visible() and ls.expandable() then
						ls.expand()
					else
						fallback()
					end
				end),
				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif ls.locally_jumpable(-1) then
						ls.jump(-1)
					end
				end, { "i", "s" }),
				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
					elseif ls.locally_jumpable(1) then
						ls.jump(1)
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("lspconfig").gdscript.setup({
			filetypes = { "gd", "gdscript", "gdscript3" },
		})
		require("fidget").setup({})
		require("neodev").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "gopls", "lua_ls" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				gopls = function()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup({
						settings = {
							gopls = {
								analyses = {
									shadow = true,
									nilness = true,
									unusedparams = true,
									unusedvaribale = true,
									structtag = false,
								},
								staticcheck = true,
								annotations = {
									escape = true,
								},
							},
						},
					})
				end,
				svelte = function()
					local lspconfig = require("lspconfig")
					lspconfig.svelte.setup({
						on_attach = function(client)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,
				sqls = function()
					local lspconfig = require("lspconfig")
					lspconfig.sqls.setup({
						on_attach = function(client, bufnr)
							require("sqls").on_attach(client, bufnr) -- require sqls.nvim
						end,
					})
				end,
			},
		})
	end,
}
