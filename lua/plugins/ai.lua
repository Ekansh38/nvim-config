return {
    {
        "ThePrimeagen/99",
        config = function()
            local _99 = require("99")
            _99.setup({
                completion = {
                    source = "native",
                },
                md_files = { "AGENT.md" },
            })

            -- v = ask AI about visual selection
            -- s = search codebase with natural language
            -- x = kill running requests
            vim.keymap.set("v", "<leader>9v", _99.visual,             { desc = "99: AI on selection" })
            vim.keymap.set("n", "<leader>9s", _99.search,             { desc = "99: search codebase" })
            vim.keymap.set("n", "<leader>9x", _99.stop_all_requests,  { desc = "99: stop requests" })
        end,
    },
}
