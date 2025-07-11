return {
    {
        'github/copilot.vim',
        config = function()
            vim.keymap.set('n', '<leader>c',
                function()
                    if vim.b.copilot_enabled == true or vim.b.copilot_enabled == nil then
                        vim.cmd('Copilot disable')
                        vim.b.copilot_enabled = false
                        vim.notify('System : Copilot disabled.')
                    elseif vim.b.copilot_enabled == false then
                        vim.cmd('Copilot enable')
                        vim.b.copilot_enabled = true
                        vim.notify('System : Copilot enabled.')
                    end
                end,
                { noremap = false, silent = true, desc = 'Toggle Copilot' }
            )
        end,
    }
--    {
--        'nvim-lua/plenary.nvim',
--        name = 'plenary'
--    },
}
