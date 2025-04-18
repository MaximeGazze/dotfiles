require("config.lazy")

vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme falcon]]

vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('x', 'p', 'P')
vim.api.nvim_set_hl(0, "Normal", {
    ctermbg = none,
    guibg = none,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.rs", "*.go" },
    callback = function()
        vim.lsp.buf.format()
    end,
})
