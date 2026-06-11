-- clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- telescope
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

-- oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- buffer stuff

vim.keymap.set('n', '<leader>n', ':bnext<CR>')
vim.keymap.set('n', '<leader>p', ':bprev<CR>')

-- auto center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- spell

vim.keymap.set('n', '<leader>c', '1z=')


-- diagnostics

vim.keymap.set('n', '<leader>xd', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })


-- for leetcode/grinding
vim.keymap.set('n', '<leader>z', function()
    vim.g.focus_mode = not vim.g.focus_mode
    vim.notify(vim.g.focus_mode and "focus on" or "focus off", vim.log.levels.INFO)
end, { desc = 'Toggle focus mode (autocomplete off)' })


-- quickfix

vim.keymap.set('n', ']q', ':cnext<CR>zz')
vim.keymap.set('n', '[q', ':cprev<CR>zz')




vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

