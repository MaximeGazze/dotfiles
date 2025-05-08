return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mason.nvim",
		},
		event = {
			"BufWritePre",
		},
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				-- lsp_format = 'fallback',
			},
			formatters_by_ft = {
				lua = {
					"stylua",
				},
				rust = {
					"rustfmt",
				},
				go = {
					"gofmt",
					"goimports",
				},
			},
			format_on_save = {
				-- lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
				filetypes = {
					lua = true,
					rust = true,
					go = true,
				},
			},
		},
	},
}
