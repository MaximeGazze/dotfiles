return {
	"folke/todo-comments.nvim",
	enabled = false,
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)]],
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
