return {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()

            vim.cmd[[colorscheme tokyonight]]
            vim.cmd[[highlight LineNr guifg=#4993cc]]

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

    }
