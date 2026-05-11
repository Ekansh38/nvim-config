return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    init_options = {
        settings = {
            lineLength = 88,
            fixAll = true,
            organizeImports = true,
        },
    },
}
