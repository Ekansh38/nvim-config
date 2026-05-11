local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

return {
    cmd = { "jdtls", "-data", workspace_dir },
    filetypes = { "java" },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
        on_dir(root or vim.fn.getcwd())
    end,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            format = { enabled = true },
        },
    },
}
