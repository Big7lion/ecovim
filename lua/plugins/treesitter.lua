local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.crystal = {
  install_info = {
    -- url = "https://github.com/will/tree-sitter-crystal.git", -- local path or git repo
    url = "https://github.com/keidax/tree-sitter-crystal.git", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "crystal"
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,            -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {},  -- list of parsers to ignore installing
  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "<leader>td",
      node_incremental  = "<leader>ti",
      scope_incremental = "<leader>ts",
      node_decremental  = "<leader>tu",
    },
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]m"] = "@class.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]M"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[m"] = "@class.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[M"] = "@class.outer",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },

  textsubjects = {
      enable = true,
      prev_selection = '<leader>',
      keymaps = {
          ['<cr>'] = 'textsubjects-smart', -- works in visual mode
      }
    },
}
