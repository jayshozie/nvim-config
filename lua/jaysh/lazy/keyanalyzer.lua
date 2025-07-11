return {
    'jayshozie/key-analyzer.nvim',
    branch = 'uppercase-layout',
    config = function()
        require('key-analyzer').setup({
            command_name = 'KeyAnalyzer',
            highlights = {
                bracket_used = "KeyAnalyzerBracketUsed",
                letter_used = "KeyAnalyzerLetterUsed",
                bracket_unused = "KeyAnalyzerBracketUnused",
                letter_unused = "KeyAnalyzerLetterUnused",
                promo_highlight = "KeyAnalyzerPromo",

                -- set to false if you want to define highlights manually
                define_default_highlights = true,
            },

            -- keyboard layout to use
            -- available options are: qwerty, colemmak, colemak-dh, azerty,
            -- qwertz, dvorak
            layout = 'dvorak',

            -- should a link to https://x.com/OtivDev be displayed?
            promotion = false,
        })
    end
}
