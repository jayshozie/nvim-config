return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            -- local runtime_path = vim.fn.stdpath('runtime')
            -- local runtime_path = vim.api.nvim_get_runtime_dir()
            local runtime_path = vim.env.VIMRUNTIME
            local config_path = vim.fn.stdpath('config')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- lua_ls
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        workspace = {
                            checkThirdParty = true,
                            library = {
                                [runtime_path .. '/lua'] = true,
                                [runtime_path .. '/lua/vim/lsp'] = true,
                                [config_path .. '/lua'] = true,
                            },
                        },
                        diagnostics = {
                            globals = { 'vim' },
                            groupStyle = 'separate',
                        },
                        completion = {
                            callSnippet = 'Replace',
                        },
                        telemetry = {
                            enable = false,
                        }
                    }
                }
            })

            -- pyright
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'basic',
                            autoSearchPaths = true,
                        }
                    }
                }
            })
            --vim.l
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- uncomment if you're using clang or make to build treesitter parsers
                    -- return 'make install_jsregexp'
                end)(),
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end
            },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- LSP source (from cmp-nvim-lsp)
                    { name = 'luasnip' },  -- Snippet source (from cmp-luasnip)
                    { name = 'buffer' },   -- Words from current buffer (from cmp-buffer)
                    { name = 'path' },     -- File paths (from cmp-path)
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation window back
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation window forward
                    ['<C-Space>'] = cmp.mapping.complete(),  -- Manually trigger completion
                    ['<C-e>'] = cmp.mapping.abort(),         -- Abort completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item
                                                                        -- `select = false` for an IDE-like experience, where if the text matches
                                                                        -- the suggestion, it just closes. Set to true if you always want to insert.
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.extend_or_jumpable then
                            luasnip.extend_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' })
                }),
            })
        end
    },
}
