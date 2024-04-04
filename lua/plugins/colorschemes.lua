return {
	{
	  "tjdevries/colorbuddy.nvim",
	  priority = 1000, --make sure this loads before all other plugins
	  init = function()
		  vim.cmd.colorscheme 'gruvbuddy'
	  end
	}
}
