-- When inside [[ or #tag in markdown, suppress lsp/buffer/snippets/path
-- so only our vault/tag sources show. Outside those contexts they work normally.
local function in_notes_context()
    if vim.bo.filetype ~= "markdown" then return false end
    local col    = vim.api.nvim_win_get_cursor(0)[2]
    local before = vim.api.nvim_get_current_line():sub(1, col)
    -- Inside unclosed [[
    local wb = before:match(".*%[%[(.*)$")
    if wb and not wb:match("%]%]") then return true end
    -- After a # tag (not a markdown heading)
    if not before:match("^#+%s") then
        if before:match("%s#[%w%-_/]*$") or before:match("^#[%w%-_/]*$") then return true end
    end
    return false
end

return {
    {
        "saghen/blink.cmp",
        event = { "BufReadPre", "InsertEnter" },
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",
        opts = {
            enabled = function()
                return not vim.g.focus_mode
            end,

            keymap = {
                preset = "default",
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
                ["<CR>"] = { "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    markdown = { "vault", "tags", "lsp", "path", "snippets", "buffer" },
                },
                providers = {
                    vault = {
                        name   = "Notes",
                        module = "notes.blink_source",
                    },
                    tags = {
                        name   = "Tags",
                        module = "notes.tag_source",
                    },
                    -- Suppress standard sources inside [[ and #tag contexts
                    lsp      = { enabled = function() return not in_notes_context() end },
                    path     = { enabled = function() return not in_notes_context() end },
                    snippets = { enabled = function() return not in_notes_context() end },
                    buffer   = { enabled = function() return not in_notes_context() end },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                keyword = { range = "prefix" },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                trigger = { show_on_trigger_character = true },
                documentation = {
                    auto_show = true,
                },
            },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },

    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_filetypes = {
                markdown = false,
            }
            vim.g.copilot_no_tab_map = false
            vim.cmd("Copilot disable")
        end,
    },
}
