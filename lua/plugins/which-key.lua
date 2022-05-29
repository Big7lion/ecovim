require'which-key'.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = { operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local normal_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local code_painter_mappings = {
    name = 'mark code section',
    p = {"<ESC><cmd>lua require('functions').painter_selection_color()<CR>", 'mark selected code'},
    r = {"<CMD>lua require('functions').erase_painter_line()<CR>", 'remove current highlight'},
    c = {"<CMD>call codepainter#EraseAll()<CR>", 'clear all marked code'},
    n = {"<CMD>call codepainter#navigate()<CR>", 'go to next marked code'}
  }

local mappings = {

  -- ignore
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",

  -- single
  ["+"] = { '<cmd>vertical resize +2<CR>',               'resize +2' },
  ["-"] = { '<cmd>vertical resize -2<CR>',               'resize +2' },
  ["="] = { '<C-W>=',                                    'balance windows' },
  ["v"] = { '<C-W>v',                                    'split right' },
  ["V"] = { '<C-W>s',                                    'split below' },

  ["/"] = {
    name = "Dashboard",
    ["/"] = { '<cmd>Dashboard<CR>',                      'open dashboard' },
    ["c"] = { ':e $MYVIMRC<CR>',                         'open init' },
    ["s"] = { '<cmd>PackerSync<CR>',                     'packer sync' },
    ["u"] = { '<cmd>PackerUpdate<CR>',                   'packer update' },
  },

  a = {
    name = "Actions",
    m = { '<cmd>Glow<CR>',                               'markdown preview' },
    n = { '<cmd>set nonumber!<CR>',                      'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>',              'relative number' },
    t = { '<cmd>ToggleTerm direction=float<CR>',         'terminal float' },
  },

  b = {
    name = "Buffer",
    b = { '<cmd>BufferMovePrevious<CR>',                 'Move back' },
    c = { '<cmd>BufferCloseAllButCurrent<CR>',           'Close but current' },
    d = { '<cmd>BufferOrderByDirectory<CR>',             'Order by directory' },
    f = { '<cmd>bfirst<CR>',                             'First buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>',             'Close Left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>',            'Close Right' },
    n = { '<cmd>BufferMoveNext<CR>',                     'Move next' },
    p = { '<cmd>BufferPick<CR>',                         'Pick Buffer' },
  },

  c = {
    name = "LSP",
    a = { '<cmd>Telescope lsp_code_action<CR>',          'telescope code action' },
    c = "which_key_ignore",
    d = { '<cmd>TroubleToggle document_diagnostics<CR>', 'local diagnostics' },
    D = { '<cmd>TroubleToggle workspace<CR>', 'workspace diagnostics' },
    f = { 'format' },
    p = { '<cmd>Prettier<CR>',                           'prettier' },
    l = { 'line diagnostics' },
    r = { 'rename' },
    s = { '<cmd>Telescope symbols<CR>',                  'symbols' },
  },

  d = {
    name = "Debug",
    a = { 'attach' },
    b = { 'breakpoint' },
    c = { 'continue' },
    d = { 'continue' },
    h = { 'visual hover' },
    i = { 'step into' },
    o = { 'step over' },
    O = { 'step out' },
    s = { 'scopes' },
  },

  g = {
    name = "Git",
    a = { '<cmd>!git add %:p<CR>',                                   'add current' },
    A = { '<cmd>!git add .<CR>',                                     'add all' },
    d = { '<cmd>lua require("plugins.diffview").toggle()<CR>',       'diff file' },
    h = {
      name = "Hunk",
      b = "blame line",
      p = "preview",
      r = "reset",
      s = "stage",
      u = "undo stage",
    },
    l = {
      name = "Log",
      a = "commits",
      c = "buffer commits",
    },
    m = { 'blame line' },
    s = { '<cmd>Telescope git_status<CR>',                           'status' },
  },

  p = {
    name = "Project",
    t = { "<cmd>TodoTrouble<CR>",                                    'todo' },
    S = { "<cmd>lua require('spectre').open()<CR>",                  'search and replace'},
    s = { "<cmd>lua require('spectre').open_file_search()<CR>",      'search and replace in current file'},
    v = { "<cmd>lua require('spectre').open_visual()<CR>",           'search current select visualmode' }
  },

  s = {
    name = "Search",
    c = { '<cmd>Telescope colorscheme<CR>',                          'color schemes' },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
    h = { '<cmd>Telescope oldfiles<CR>',                             'file history' },
    H = { '<cmd>Telescope command_history<CR>',                      'command history' },
    s = { '<cmd>Telescope search_history<CR>',                       'search history' },
    m = { '<cmd>Telescope marks<CR>',                                'marks'},
    k = { '<cmd>Telescope keymaps<CR>',                              'keymapping'},
    S = { '<cmd>Telescope ultisnips<CR>',                            'snippets'},
    p = { '<cmd>Telescope live_grep<CR>',                            'search file content'},
    t = { '<cmd>Telescope treesitter<CR>',                           'treesitter'},
  },

  t = {
    name = "Nvim treesitter",
    d = { 'init selection' },
    i = { 'node selection increment' },
    u = { 'node selection decrement' },
    s = { 'scope selection increment' }
  },

  m = code_painter_mappings,

  l = {
    name = "Session Manager",
    l = { '<cmd>SessionManager load_last_session<CR>',              'open the last saved session' },
    p = { '<cmd>SessionManager load_session<CR>',                   'Select and load session'},
    c = { '<cmd>SessionManager load_last_session<CR>',              'open the last saved session file of the current dirtectory'},
    s = { '<cmd>SessionManager save_current_session<CR>',           'saves/creates current directory as a session'},
    d = { '<cmd>SessionManager delete_session<CR>',                 'Select and delete session'}
  },

  o = {
    name = "Code Outline",
    t = { 'Open or close the aerial window' },
    o = { 'Toggle tree at current location' },
    s = { 'Sync code folding with current tree state' }
  }
}

local wk = require "which-key"
wk.register(mappings, normal_opts)
wk.register(mappings, visual_opts)
