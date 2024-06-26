return {
  {
    --Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    --opts = {} is equivalent to require('Comment').setup({})
    'numToStr/Comment.nvim',
    opts = {},
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  'christoomey/vim-tmux-navigator',
}
