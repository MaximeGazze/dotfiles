return {
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'gopls',
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            local coq = require('coq')

            -- LUA
            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }))

            -- RUST
            lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))

            -- GO
            lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                    },
                },
            }))
        end,
    },
}
