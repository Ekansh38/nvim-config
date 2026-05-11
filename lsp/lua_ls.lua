return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                -- Makes lua_ls aware of all Neovim runtime files (vim.*, vim.api.*, etc.)
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
