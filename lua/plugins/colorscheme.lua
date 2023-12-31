return {
  'rose-pine/neovim', name = 'rose-pine', priority=1000, config = function()

	  local scheme = "rose-pine"
	  vim.cmd.colorscheme(scheme)

	  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

}
