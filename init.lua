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
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.cursorline = true

--clipboard
vim.opt.clipboard:append('unnamedplus') --use system clipboard as default register

vim.opt.scrolloff = 10
vim.opt.mouse = 'a'

vim.opt.showmode = false --does not show modes since it's already available in status line
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
vim.opt.completeopt = { "menu", "menuone", "noselect" }

require('vim._core.ui2').enable({})

------------------------------------------------KEYMAPS-----------------------------------------------------------
--leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', 'j', 'gj', { desc = 'move visual lines instead of real lines' })
vim.keymap.set('n', 'k', 'gk', { desc = 'move visual lines instead of real lines' })

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
------------------------------------------------TREESITTER-----------------------------------------------------------
-- NEOVIM Docs: https://neovim.io/doc/user/treesitter/#treesitter
-- Install treesitter CLI from: https://github.com/tree-sitter/tree-sitter/releases
-- Add tree-sitter executable to PATH and make sure it's working
-- List of parser repositories is available here: https://github.com/tree-sitter/tree-sitter/wiki/List-of-parsers
-- Clone the repo down and generate/build the parser using `tree-sitter generate/build` command
-- Put the compiled parser under nvim-data/site/parser directory
-- It will be picked up automatically or check `:chechhealth vim.treesitter`
--
-- To add new parsers with custom file path we can use:
-- vim.treesitter.language.add('python', { path = "/path/to/python.so" })
--
-- To register a named parser for specific filetype, we can use:
-- vim.treesitter.language.register('xml', { 'svg', 'xslt' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*.cpp', '*.hpp', '*.h' },
  callback = function(ev)
    vim.treesitter.start(ev.buf, 'cpp')
    vim.bo[ev.buf].syntax = 'ON' -- only if additional legacy syntax is needed
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function(ev)
    vim.treesitter.start(ev.buf, 'python')
    vim.bo[ev.buf].syntax = 'ON' -- only if additional legacy syntax is needed
  end
})

------------------------------------------------LSP---------------------------------------------------------------
---NEOVIM LSP Docs: https://neovim.io/doc/user/lsp/#lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- If we see poor performance on workspaces then uncomment below 3 lines
-- if capabilities.workspace then
--   capabilities.workspace.didChangeWatchedFiles = nil
-- end

--LUA LS: https://github.com/LuaLS/lua-language-server
--Installation instructions:
--1. Download the latest release from their github page
--2. make sure /bin/ folder is in the PATH variable and `lua-language-server` command is accessible
--3. configure the lsp as shown below
vim.lsp.config['lua_ls'] = {
  -- Command and args to start the server
  cmd = { 'lua-language-server' },
  --Filetypes to automatically attach to
  filetypes = { 'lua' },
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
  },

  capabilities = capabilities,
}

vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

------------------------------------------------PACKAGES-----------------------------------------------------------
---Documentation: https://neovim.io/doc/user/pack/
local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('tpope/vim-fugitive'),
  gh('stevearc/oil.nvim'),

  --telescope
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),

  gh('miikanissi/modus-themes.nvim'),

  gh('lewis6991/gitsigns.nvim'),
  gh('nvim-mini/mini.statusline'),
})

vim.cmd([[colorscheme modus]])

require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
})

require('oil').setup({
  view_options = {
    show_hidden = true,
  }
})

require('mini.statusline').setup({})

require('telescope').setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
