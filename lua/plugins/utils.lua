return {
    {
        "Ekansh38/notes.nvim",
        lazy   = false,
        config = function()
            require("notes").setup({
                git_auto_commit = true,
                git_auto_push   = true,
            })
        end,
    },

    {
        "echasnovski/mini.pairs",
        version = "*",
        opts = {
            modes = { insert = true, command = false, terminal = false },
            mappings = {
                -- Auto-pair backticks: ` → `|`  (works for both inline code and ``` fences)
                ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^`\\][%s\r]' },
            },
        }
    },


    { "echasnovski/mini.surround", version = "*",    opts = {} },

    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown" },
        init = function()
            vim.g.table_mode_corner = "|" -- GitHub/Obsidian-style tables
        end,
    },
    {
        "LunarVim/bigfile.nvim",
        lazy = false,
        opts = {
            filesize = 1, -- MiB threshold; files larger than this trigger big-file mode
            pattern  = { "*" },
            features = {
                "indent_blankline",
                "illuminate",
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
                "vimopts",
                "filetype",
            },
        },
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown" },
        opts = {
            heading = {
                icons       = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
                backgrounds = { "", "", "", "", "", "" },
                signs       = { enabled = false },
            },
            code = {
                style  = "normal",
                border = "none",
            },
            link = {
                image     = "",
                email     = "",
                hyperlink = "",
            },
        },
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd   = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft    = { "markdown" },
        build = "cd app && npm install",
        keys  = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", ft = "markdown", desc = "Markdown preview in browser" } },
    },

    { "ThePrimeagen/vim-be-good",  cmd = "VimBeGood" },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" } },
    }

}
