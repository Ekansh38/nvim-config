vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.PATH = vim.fn.expand("~/.local/bin") .. ":" .. vim.env.PATH

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used for ALL
vim.opt.conceallevel = 2            -- hide conceal markers

-- tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spaces in tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces (BETTER)

-- UI stuff
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = true             -- show current mode in cmdline (INSERT, VISUAL, etc.)

-- search
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered


-- spell Check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.spellcapcheck = ''

-- wrapping
vim.opt.wrap = false

-- ruler
vim.opt.textwidth = 100          -- gw wraps to this width
vim.opt.colorcolumn = "100"

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text', 'txt' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
        -- Treat _ as part of a word so snake_case identifiers aren't split
        -- and spell-checked as fragments (S + IFREG → red noise)
        vim.opt_local.iskeyword:append("_")
    end
})

-- highlight
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function()
        vim.opt_local.cursorline = false
    end
})

local function set_custom_hls()
    vim.api.nvim_set_hl(0, 'CursorLine',  { bg = '#242830' })
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1a1a1a' })

end
set_custom_hls()
vim.api.nvim_create_autocmd('ColorScheme', { callback = set_custom_hls })


vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local light_themes = {
            'catppuccin-latte', 'gruvbox-light',
            'tokyonight-day', 'everforest-light'
        }
        local current = vim.g.colors_name
        for _, theme in ipairs(light_themes) do
            if current == theme then
                return
            end
        end
        vim.api.nvim_set_hl(0, 'Normal', { bg = '#0d0d0d' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#0d0d0d' })
    end
})

vim.opt.guicursor = ""
