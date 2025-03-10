return {
  {
    'RRethy/base16-nvim',
    init = function()
      vim.cmd.colorscheme 'base16-black-metal-gorgoroth'
    end,
  },
  -- {
  --   'vague2k/vague.nvim',
  --   config = function()
  --     -- NOTE: you do not need to call setup if you don't want to.
  --     require('vague').setup {
  --       transparent = false, -- don't set background
  --       style = {
  --         -- "none" is the same thing as default. But "italic" and "bold" are also valid options
  --         boolean = 'bold',
  --         number = 'none',
  --         float = 'none',
  --         error = 'bold',
  --         comments = 'italic',
  --         conditionals = 'none',
  --         functions = 'none',
  --         headings = 'bold',
  --         operators = 'none',
  --         strings = 'none',
  --         variables = 'none',
  --
  --         -- keywords
  --         keywords = 'none',
  --         keyword_return = 'italic',
  --         keywords_loop = 'none',
  --         keywords_label = 'none',
  --         keywords_exception = 'none',
  --
  --         -- builtin
  --         builtin_constants = 'bold',
  --         builtin_functions = 'none',
  --         builtin_types = 'bold',
  --         builtin_variables = 'none',
  --       },
  --       -- plugin styles where applicable
  --       -- make an issue/pr if you'd like to see more styling options!
  --       plugins = {
  --         cmp = {
  --           match = 'bold',
  --           match_fuzzy = 'bold',
  --         },
  --         dashboard = {
  --           footer = 'italic',
  --         },
  --         lsp = {
  --           diagnostic_error = 'bold',
  --           diagnostic_hint = 'none',
  --           diagnostic_info = 'italic',
  --           diagnostic_warn = 'bold',
  --         },
  --         neotest = {
  --           focused = 'bold',
  --           adapter_name = 'bold',
  --         },
  --         telescope = {
  --           match = 'bold',
  --         },
  --       },
  --       -- Override colors
  --       colors = {
  --         bg = '#141415',
  --         fg = '#cdcdcd',
  --         floatBorder = '#878787',
  --         line = '#252530',
  --         comment = '#606079',
  --         builtin = '#b4d4cf',
  --         func = '#c48282',
  --         string = '#e8b589',
  --         number = '#e0a363',
  --         property = '#c3c3d5',
  --         constant = '#aeaed1',
  --         parameter = '#bb9dbd',
  --         visual = '#333738',
  --         error = '#df6882',
  --         warning = '#f3be7c',
  --         hint = '#7e98e8',
  --         operator = '#90a0b5',
  --         keyword = '#6e94b2',
  --         type = '#9bb4bc',
  --         search = '#405065',
  --         plus = '#8cb66d',
  --         delta = '#f3be7c',
  --       },
  --     }
  --   end,
  --   init = function()
  --     vim.cmd.colorscheme 'vague'
  --   end,
  -- },
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup {
  --       variant = 'auto', -- auto, main, moon, or dawn
  --       dark_variant = 'main', -- main, moon, or dawn
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,
  --
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true, -- Handle deprecated options automatically
  --       },
  --
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         transparency = false,
  --       },
  --
  --       groups = {
  --         border = 'muted',
  --         link = 'iris',
  --         panel = 'surface',
  --
  --         error = 'love',
  --         hint = 'iris',
  --         info = 'foam',
  --         note = 'pine',
  --         todo = 'rose',
  --         warn = 'gold',
  --
  --         git_add = 'foam',
  --         git_change = 'rose',
  --         git_delete = 'love',
  --         git_dirty = 'rose',
  --         git_ignore = 'muted',
  --         git_merge = 'iris',
  --         git_rename = 'pine',
  --         git_stage = 'iris',
  --         git_text = 'rose',
  --         git_untracked = 'subtle',
  --
  --         h1 = 'iris',
  --         h2 = 'foam',
  --         h3 = 'rose',
  --         h4 = 'gold',
  --         h5 = 'pine',
  --         h6 = 'foam',
  --       },
  --
  --       highlight_groups = {
  --         Comment = { italic = true },
  --         -- VertSplit = { fg = "muted", bg = "muted" },
  --       },
  --
  --       before_highlight = function(group, highlight, palette)
  --         -- Disable all undercurls
  --         -- if highlight.undercurl then
  --         --     highlight.undercurl = false
  --         -- end
  --         --
  --         -- Change palette colour
  --         -- if highlight.fg == palette.pine then
  --         --     highlight.fg = palette.foam
  --         -- end
  --       end,
  --     }
  --     vim.cmd 'colorscheme rose-pine'
  --   end,
  -- },
  -- {
  --   'blazkowolf/gruber-darker.nvim',
  --   opts = {
  --     bold = true,
  --     invert = {
  --       signs = false,
  --       tabline = false,
  --       visual = false,
  --     },
  --     italic = {
  --       strings = false,
  --       comments = true,
  --       operators = false,
  --       folds = true,
  --     },
  --     undercurl = true,
  --     underline = true,
  --   },
  --   init = function()
  --     vim.cmd.colorscheme 'gruber-darker'
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     terminal_colors = true, -- add neovim terminal colors
  --     undercurl = true,
  --     underline = true,
  --     bold = false,
  --     italic = {
  --       strings = false,
  --       emphasis = true,
  --       comments = true,
  --       operators = false,
  --       folds = true,
  --     },
  --     strikethrough = true,
  --     invert_selection = false,
  --     invert_signs = false,
  --     invert_tabline = false,
  --     invert_intend_guides = false,
  --     inverse = true, -- invert background for search, diffs, statuslines and errors
  --     contrast = 'soft', -- can be "hard", "soft" or empty string
  --     palette_overrides = {},
  --     overrides = {},
  --     dim_inactive = false,
  --     transparent_mode = true,
  --   },
  --   init = function()
  --     vim.o.background = 'light'
  --     vim.cmd.colorscheme 'gruvbox'
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   init = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --   end,
  -- },
  -- {
  --   'craftzdog/solarized-osaka.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   init = function()
  --     vim.cmd.colorscheme 'solarized-osaka'
  --   end,
  -- },
  -- {
  --   'tjdevries/colorbuddy.nvim',
  --   priority = 1000, --make sure this loads before all other plugins
  --   init = function()
  --     vim.cmd.colorscheme 'gruvbuddy'
  --   end,
  -- },
  --
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --     }
  --     require('bamboo').load()
  --   end,
  -- },
  --   {
  --     'catppuccin/nvim',
  --     name = 'catppuccin',
  --     priority = 1000,
  --     opts = {
  --       flavour = 'auto', -- latte, frappe, macchiato, mocha
  --       background = { -- :h background
  --         light = 'latte',
  --         dark = 'mocha',
  --       },
  --       transparent_background = false, -- disables setting the background color.
  --       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  --       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  --       dim_inactive = {
  --         enabled = false, -- dims the background color of inactive window
  --         shade = 'dark',
  --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --       },
  --       no_italic = false, -- Force no italic
  --       no_bold = false, -- Force no bold
  --       no_underline = false, -- Force no underline
  --       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --         comments = { 'italic' }, -- Change the style of comments
  --         conditionals = { 'italic' },
  --         loops = {},
  --         functions = {},
  --         keywords = {},
  --         strings = {},
  --         variables = {},
  --         numbers = {},
  --         booleans = {},
  --         properties = {},
  --         types = {},
  --         operators = {},
  --         -- miscs = {}, -- Uncomment to turn off hard-coded styles
  --       },
  --       color_overrides = {},
  --       custom_highlights = {},
  --       default_integrations = true,
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         notify = false,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = '',
  --         },
  --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --       },
  --     },
  --     init = function()
  --       vim.cmd.colorscheme 'catppuccin'
  --     end,
  --   },
  --   -- {
  --   --   'navarasu/onedark.nvim',
  --   --   priority = 1000,
  --   --   opts = {
  --   --     -- Main options --
  --   --     style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --   --     transparent = false, -- Show/hide background
  --   --     term_colors = true, -- Change terminal color as per the selected theme style
  --   --     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  --   --     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --   --
  --   --     -- toggle theme style ---
  --   --     toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --   --     toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  --   --
  --   --     -- Change code style ---
  --   --     -- Options are italic, bold, underline, none
  --   --     -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --   --     code_style = {
  --   --       comments = 'italic',
  --   --       keywords = 'none',
  --   --       functions = 'none',
  --   --       strings = 'none',
  --   --       variables = 'none',
  --   --     },
  --   --
  --   --     -- Lualine options --
  --   --     lualine = {
  --   --       transparent = false, -- lualine center bar transparency
  --   --     },
  --   --
  --   --     -- Custom Highlights --
  --   --     colors = {}, -- Override default colors
  --   --     highlights = {}, -- Override highlight groups
  --   --
  --   --     -- Plugins Config --
  --   --     diagnostics = {
  --   --       darker = true, -- darker colors for diagnostic
  --   --       undercurl = true, -- use undercurl instead of underline for diagnostics
  --   --       background = true, -- use background color for virtual text
  --   --     },
  --   --   },
  --   --   init = function()
  --   --     vim.cmd.colorscheme 'onedark'
  --   --   end,
  --   -- },
}
