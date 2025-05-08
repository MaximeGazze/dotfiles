return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        spec = {
            mode = { 'n', 'v' },
            { '<leader><leader>', '<CMD>Telescope commands<CR>',   desc = 'Command' },
            { '<leader>f',        group = 'file' },
            { '<leader>ff',       '<CMD>Telescope find_files<CR>', desc = 'Find File' },
            { '<leader>fr',       '<CMD>Telescope oldfiles<CR>',   desc = 'Find Recent File' },
            { '<leader>fg',       '<CMD>Telescope live_grep<CR>',  desc = 'Find Pattern In Files' },
            { '<leader>fs',       '<CMD>w<CR>',                    desc = 'Save File' },
            { '<leader>b',        group = 'buffer' },
            { '<leader>bb',       '<CMD>Telescope buffers<CR>',    desc = 'Buffers' },
            { '<leader>bd',       '<CMD>b#<bar>bd#<CR>',           desc = 'Delete Buffer' },
            { '<leader>bp',       '<CMD>bprevious<CR>',            desc = 'Previous Buffer' },
            { '<leader>bn',       '<CMD>bnext<CR>',                desc = 'Next Buffer' },
        },
    },
    keys = {
        { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)' },
    },
}
