-- https://dotfiles.substack.com/p/whats-new-in-neovim-012

---------------------------------------------------OPTIONS---------------------------------------------------------
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true

-- disable line wraps
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true --ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.cursorline = true

--clipboard
vim.opt.clipboard:append('unnamedplus') --use system clipboard as default register

vim.opt.scrolloff = 10
vim.opt.mouse = 'a'

-- vim.opt.showmode = false --does not show modes since it's already available in status line
vim.opt.breakindent = true
vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 300

-- preview substitutions as we type
vim.opt.inccommand = 'split'

-- set highlight on search but clean on pressing <ESC> in normal mode
vim.opt.hlsearch = true

vim.opt.termguicolors = true

------------------------------------------------KEYMAPS-----------------------------------------------------------
--leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', 'j', 'gj', {desc = 'move visual lines instead of real lines'})
vim.keymap.set('n', 'k', 'gk', {desc = 'move visual lines instead of real lines'})

-- clears the search highlight on pressing <ESC> in normal mode
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

--Diagnostics keymap
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show [C]ode [D]iagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostics [Q]uickfix list' })

--add a closing bracket with indent, good for lots of stuff
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')

------------------------------------------------AUTOCMDs-----------------------------------------------------------
-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

