return {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    settings = {
        zls = {
            enable_inlay_hints = true,
            inlay_hints_show_builtin = true,
            inlay_hints_exclude_single_argument = false,
        },
    },
}
