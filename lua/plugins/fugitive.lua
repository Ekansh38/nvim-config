return {
  'tpope/vim-fugitive',
  config = function()

	  vim.keymap.set("n", "<leader>g", vim.cmd.Git)
	  vim.keymap.set("n", "<leader>gs", ":Git log<CR>")

  end
}
