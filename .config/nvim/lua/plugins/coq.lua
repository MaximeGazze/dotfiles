return {
	"ms-jpq/coq_nvim",
	enabled = false,
	branch = "coq",
	init = function()
		vim.g.coq_settings = {
			auto_start = "shut-up",
			clients = {
				snippets = {
					warn = {},
				},
			},
			completion = {
				sticky_manual = false,
			},
			keymap = {
				recommended = false,
			},
		}

		vim.api.nvim_set_keymap(
			"i",
			"<Esc>",
			[[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]],
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"i",
			"<C-c>",
			[[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]],
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
		vim.api.nvim_set_keymap(
			"i",
			"<CR>",
			[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"i",
			"<Tab>",
			[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><Tab>" : "\<C-y>") : "\<Tab>"]],
			{ expr = true, silent = true }
		)
	end,
}
