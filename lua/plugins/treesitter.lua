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
      keymaps = {
          ['<cr>'] = 'textsubjects-smart', -- works in visual mode
      }
    },
}
