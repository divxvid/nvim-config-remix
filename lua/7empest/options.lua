local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smarttab = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- clipboard
opt.clipboard:append 'unnamedplus' -- use system clipboard as default register

opt.list = true
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↴" }
-- opt.listchars:append 'eol:↴'
opt.listchars:append 'eol:~'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

opt.mouse = 'a' --Enable mouse mode. Useful in resizing splits etc

--Don't show the mode since it's already in the status line
opt.showmode = false

-- Enable break indent
opt.breakindent = true

--keep signcolumn on by default
opt.signcolumn = 'yes'

--Decrease Update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Preview substitutions live as we type
opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <ESC> in normal mode
-- ESC part is set in keymaps file
opt.hlsearch = true
