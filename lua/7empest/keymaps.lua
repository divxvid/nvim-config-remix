--Setup the leader key

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- tells nvim that we are using nerd fonts
vim.g.have_nerd_font = true

local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>')
keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Open NetRW file explorer' })
keymap.set('n', '<leader>dd', ':bdelete<CR>', { desc = 'Deletes the current buffer' })

--clears the search highlight on pressing <ESC> in normal mode
keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostics keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show [C]ode [D]iagnotics' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- oil nvim config
keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in oil' })

-- add a closing bracket with indent, good for lots of stuff
keymap.set('i', '{<CR>', '{<CR>}<ESC>O')
