return {
    {
        "Ekansh38/99",
        dependencies = { { "saghen/blink.compat", version = "2.*" } },
        config = function()
            local _99 = require("99")
            _99.setup({
                -- Route through opencode → OpenRouter. Requires:
                --   1. `opencode` installed (brew: `brew install sst/tap/opencode`)
                --   2. `OPENROUTER_API_KEY` exported in your shell
                --   3. `~/.config/opencode/opencode.json` build agent set to an
                --      `openrouter/<vendor>/<model>` id (see that file for defaults)
                provider = _99.Providers.OpenCodeProvider,
                model = "openrouter/z-ai/glm-5.2",
                completion = {
                    source = "blink",
                },
                md_files = { "AGENT.md" },
            })

            vim.keymap.set("v", "<leader>9v", _99.visual,                    { desc = "99: AI on selection" })
            vim.keymap.set("n", "<leader>9s", _99.search,                    { desc = "99: search codebase" })
            vim.keymap.set("n", "<leader>9x", _99.stop_all_requests,         { desc = "99: stop requests" })
            vim.keymap.set("n", "<leader>9o", _99.open,                      { desc = "99: open last interaction" })
            vim.keymap.set("n", "<leader>9l", _99.view_logs,                 { desc = "99: view logs" })
            vim.keymap.set("n", "<leader>9c", _99.clear_previous_requests,   { desc = "99: clear requests" })

            vim.keymap.set("n", "<leader>9i", _99.vibe,                      { desc = "99: vibe (implement)" })

            local Worker = _99.Extensions.Worker
            vim.keymap.set("n", "<leader>9w", Worker.set_work,              { desc = "99: set work item" })
            vim.keymap.set("n", "<leader>9W", Worker.search,                { desc = "99: worker search (what's left)" })
            vim.keymap.set("n", "<leader>9e", Worker.vibe,                  { desc = "99: worker vibe (implement what's left)" })

            vim.keymap.set("n", "<leader>9m", function()
                require("99.extensions.telescope").select_model()
            end, { desc = "99: pick model" })

            vim.keymap.set("n", "<leader>9p", function()
                require("99.extensions.telescope").select_provider()
            end, { desc = "99: pick provider" })
        end,
    },
}
