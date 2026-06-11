vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, bufopts)
        keymap.set("n", "gd", lsp.buf.definition, bufopts)
        keymap.set("n", "gi", lsp.buf.implementation, bufopts)
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
        keymap.set("n", "<space>ca", lsp.buf.code_action, bufopts)
        keymap.set("n", "K", lsp.buf.hover, bufopts)
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)

        keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, bufopts)
        keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, bufopts)
        keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
    end
})

-- auto imports
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = 0,
            callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" }, diagnostics = {} }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
            end,
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadPost", "InsertEnter" }, {
    once = true,
    callback = function()
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
            root_dir = function(bufnr, on_dir)
                on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
            end,
        })
        vim.lsp.config("harper_ls", {
            filetypes = { "markdown" },
            settings = {
                ["harper-ls"] = {
                    linters = {
                        spell_check     = true,
                        spelled_numbers = false,
                        an_a            = true,
                        sentence_capitalization = false,  -- too noisy for notes
                        unclosed_quotes = true,
                        correct_number_suffix = true,
                        long_sentences  = false,          -- too noisy
                    },
                },
            },
        })
        vim.lsp.enable({ "pyright", "ruff", "gopls", "marksman", "harper_ls", "lua_ls", "clangd", "jdtls", "zls" })
    end,
})
