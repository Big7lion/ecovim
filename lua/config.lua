------------------------------------------------
--                                            --
--    This is a main configuation file for    --
--                    EcoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require('icons')

EcoVim = {
  colorscheme = 'tokyonight', -- nightfly/tokyonight
  ui = {
    float = {
      border = 'rounded',
      highlight = 'NightflyRed' -- check available by :Telescope highlights
    }
  },
  plugins = {
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    package_info = {
      enabled = false
    },
  },
  icons = icons,
}
