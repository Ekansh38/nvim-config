return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
        end,
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--no-ignore" },
                },
            },
        },
    },

    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 2,
            },
        },
    },

}
