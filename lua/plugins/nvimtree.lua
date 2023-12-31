return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")

        require("nvim-tree").setup ({})
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Toggle Nvim Tree
        map('n', '<Leader>pv', ':NvimTreeToggle<CR>', opts)

        -- Focus on Nvim Tree
        map('n', '<Leader>n', ':NvimTreeFocus<CR>', opts)

        vim.keymap.set('n', '?', api.tree.toggle_help, opts)



    end,
}
