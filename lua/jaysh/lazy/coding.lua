return {
    {
        -- treesitter
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                -- a list of parser names, or 'all'
                ensure_installed = {
                    'vimdoc', 'javascript', 'typescript', 'c', 'lua', 'rust',
                    'jsdoc', 'bash', 'python',
                },
                auto_install = false,

                -- install parser synchronously (only applied to 'ensure_installed')
                sync_install = false,

                -- automatically install missing parsers when entering buffer
                -- recommendation: set to false if you don't have 'tree-sitter'
                --                 CLI installed locally

                indent = {
                    enable = true
                },

                highlight = {
                    enable = true,
                    additionaly_vim_regex_highlighting = { 'markdown' },
                },
            })

            local treesitter_parser_config = require('nvim-treesitter.parsers').get_parser_configs()
            treesitter_parser_config.templ = {
                install_info = {
                    url = 'https://github.com/vrischmann/tree-sitter-temlp.git',
                    files = { 'src/parser.c', 'src/scanner.c' },
                    branch = 'master',
                },
            }

            vim.diagnostic.config({ virtual_text = true })
            vim.treesitter.language.register('templ', 'templ')
        end
    },
    {
        -- trouble
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
        keys = {
            {
                '<leader>xx',
                '<CMD>Trouble diagnostics toggle <CR>',
                desc = 'Diagnosics (Trouble)',
            },
            {
                '<leader>xX',
                '<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>xQ',
                '<CMD>Trouble qflist toggle<CR>',
                desc = 'Quicfix List (Trouble)',
            },
        },
    },
    {
        -- undotree
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    {
        'jayshozie/Flominal.nvim',
        branch = 'main',
        opts = {
            -- i'm using the defaults of my own plugin, obviously
        },
    },
}
