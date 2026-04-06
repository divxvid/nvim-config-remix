-- https://dotfiles.substack.com/p/whats-new-in-neovim-012

---------------------------------------------------OPTIONS---------------------------------------------------------
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

--adds autocomplete drop down from the current buffer
vim.opt.autocomplete = true

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
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show [C]ode [D]iagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostics [Q]uickfix list' })

--add a closing bracket with indent, good for lots of stuff
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')

--Open oil in the parent directory
vim.keymap.set('n', '-', '<CMD>Oil<CR>')
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

------------------------------------------------LSP---------------------------------------------------------------
---NEOVIM LSP Docs: https://neovim.io/doc/user/lsp/#lsp

--LUA LS: https://github.com/LuaLS/lua-language-server
--Installation instructions: 
--1. Download the latest release from their github page
--2. make sure /bin/ folder is in the PATH variable and `lua-language-server` command is accessible
--3. configure the lsp as shown below
vim.lsp.config['lua_ls'] = {
  -- Command and args to start the server
  cmd = { 'lua-language-server' },
  --Filetypes to automatically attach to
  filetype = { 'lua' },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.enable('lua_ls')

------------------------------------------------PACKAGES-----------------------------------------------------------
---Documentation: https://neovim.io/doc/user/pack/
local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('tpope/vim-fugitive'),
  gh('stevearc/oil.nvim'),
})

require('oil').setup({
  view_options = {
    show_hidden = true,
  }
})
