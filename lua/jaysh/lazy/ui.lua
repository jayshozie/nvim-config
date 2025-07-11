return {

    -- Colorchemes
    {
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup({
                style = 'moon', -- storm, moon, night, day
                transparent = true,  -- disable setting the background color
                terminal_colors = true, --configure colors used when `:terminal`
                styles = {
                    -- hate italics
                    comments = { italic = false },
                    keywords = { italic = false },

                    -- background styles: dark, transparent, normal
                    sidebars = 'dark', -- style for sidebars
                    floats = 'dark', -- style for floating windows
                }
            })
            vim.api.nvim_command('colorscheme tokyonight')
        end
        -- 'catppuccin/nvim',
        -- name = 'catppuccin',
        -- priority = 1000,
        -- config = function()
        --     require('catppuccin').setup({
        --         background = { dark = 'mocha', },
        --         color_overrides = {
        --             mocha = {
        --             },
        --         },
        --         transparent_background = true,
        --         show_end_of_buffer = false,
        --     })
        --     vim.api.nvim_command('colorscheme catppuccin')
        -- end,
    },

    -- Extras
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                },
            })
        end
    }


}
