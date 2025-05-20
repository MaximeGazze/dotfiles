return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	opts = function()
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()

		return {
			auto_brackets = {},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			preselect = false,
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<tab>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			sorting = defaults.sorting,
		}
	end,
}
