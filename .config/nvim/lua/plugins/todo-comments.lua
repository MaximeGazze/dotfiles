return {
    'folke/todo-comments.nvim',
    opts = {
        highlight = {
            pattern = [[.*<(KEYWORDS)]],
        },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
}
