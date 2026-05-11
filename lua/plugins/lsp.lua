return {
    {
        "mason-org/mason.nvim",
        event = "VeryLazy",
        opts = {}
    },

    {
        "mason-org/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",
                "ruff",
                "gopls",
                "marksman",
                "lua_ls",
                "clangd",
                "jdtls",
                "zls",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        main = "nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua", "python", "go", "gomod", "gosum", "c", "java", "zig",
                "markdown", "markdown_inline",
                "vim", "vimdoc", "bash", "json", "yaml", "toml",
            },
            highlight = { enable = true },
            indent = { enable = true },
            injections = { enable = true },
        },
    },
}
