-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Telescope (fuzzy finder)
vim.keymap.set('n', '<space>ff', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<space>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Live grep' })

vim.keymap.set('n', '<space>fG', function()
  require('telescope.builtin').live_grep({
    additional_args = function()
      return { "--fixed-strings" }
    end,
  })
end, { desc = 'Live grep (literal)' })

vim.keymap.set('n', '<space>fb', function() require('telescope.builtin').buffers() end, { desc = 'Find buffers' })
vim.keymap.set('n', '<space>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Find help tags' })

-- Oil (file explorer) — press - to open parent dir, q to close
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- In line navigation

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text', 'txt' },
    callback = function()
        vim.keymap.set({'n', 'o', 'x'}, 'j', 'gj', { buffer = true })
        vim.keymap.set({'n', 'o', 'x'}, 'k', 'gk', { buffer = true })
        vim.keymap.set({'n', 'o', 'x'}, '$', 'g$', { buffer = true })
        vim.keymap.set({'n', 'o', 'x'}, '0', 'g0', { buffer = true })
        vim.keymap.set({'n', 'o', 'x'}, '^', 'g^', { buffer = true })
        vim.keymap.set({'n', 'o', 'x'}, '_', 'g^', { buffer = true })
        vim.keymap.set('n', 'A', 'g$a', { buffer = true })
        vim.keymap.set('n', 'I', 'g0i', { buffer = true })
    end
})

-- Buffer Navigation

vim.keymap.set('n', '<leader>n', ':bnext<CR>')
vim.keymap.set('n', '<leader>p', ':bprev<CR>')

-- Half-page scrolling with auto-center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Spell

vim.keymap.set('n', '<leader>c', '1z=')


-- Quickfix

vim.keymap.set('n', ']q', ':cnext<CR>zz')
vim.keymap.set('n', '[q', ':cprev<CR>zz')




vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

