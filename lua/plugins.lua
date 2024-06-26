local execute = vim.api.nvim_command
local packer = nil
-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

local function init()
  if not is_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
      execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
      execute("packadd packer.nvim")
      print("Installed packer.nvim.")
      is_installed = true
    end
  end

  if not is_installed then return end
  if packer == nil then
    packer = require('packer')
    packer.init({
      -- we don't want the compilation file in '~/.config/nvim'
      disable_commands = true,
      compile_path = compile_path
    })
  end

  local use = packer.use
  packer.reset()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Needed to load first
  use {'lewis6991/impatient.nvim', rocks = 'mpack'}
  use {'nathom/filetype.nvim', config = "require('plugins.filetype')"}
  use {'nvim-lua/plenary.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'glepnir/dashboard-nvim', config = "require('plugins.dashboard')"}

  -- Themes
  use {'bluz71/vim-nightfly-guicolors'}
  use {'folke/tokyonight.nvim'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    config = "require('plugins.treesitter')",
    run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
  use {'RRethy/nvim-treesitter-textsubjects', after = {'nvim-treesitter'}}

  -- Telescope
  use 'cljoly/telescope-repo.nvim'
  use {'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope')",
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'fhill2/telescope-ultisnips.nvim'}
  use {'xiyaowong/telescope-emoji.nvim'}
  use {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }


  -- LSP Base
  use {'neovim/nvim-lspconfig'}

  -- LSP Cmp
  use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
  use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua'}
  use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
  use {'hrsh7th/cmp-path', after = 'cmp-buffer'}
  use {'quangnguyen30192/cmp-nvim-ultisnips', after = 'cmp-path'}

  -- LSP Addons
  use({ "williamboman/mason-lspconfig.nvim" })
  use { 'williamboman/mason.nvim', event = 'BufEnter', config = "require('lsp.mason')" }
  use {'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')"}
  use {'onsails/lspkind-nvim'}
  use {'folke/trouble.nvim', config = "require('plugins.trouble')"}
  use {'nvim-lua/popup.nvim'}
  use {'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter'}
  use {'jose-elias-alvarez/nvim-lsp-ts-utils'}
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.flutter-tools')"}
	-- use {
	-- 	"lvimuser/lsp-inlayhints.nvim",
	-- 	branch = "main", -- or "anticonceal"
	-- 	config = function()
	-- 		require("plugins.inlay-hints")
	-- 	end,
	-- }
  use { 'ziglang/zig.vim' }
	use { "jose-elias-alvarez/typescript.nvim" }

  -- General
  use {'ellisonleao/glow.nvim', config = function() vim.g.glow_border = "rounded" end}
  use { 'iamcco/markdown-preview.nvim', run = "cd app && yarn install" }
  use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}
  use {'akinsho/toggleterm.nvim', config = "require('plugins.toggleterm')"}
  use {'tpope/vim-repeat'}
  use {'mg979/vim-visual-multi', config = "require('plugins.multi')"}
  use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}
  use {'nacro90/numb.nvim', config = "require('plugins.numb')"}
  use {'folke/todo-comments.nvim'}
  use {'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter"}
  use {'ecosse3/galaxyline.nvim', after = 'nvim-gps', config = "require('plugins.galaxyline')"}
  use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
  use {'antoinemadec/FixCursorHold.nvim'} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use {'rcarriga/nvim-notify'}
  use {'tjdevries/vlog.nvim'}
  use {'vuki656/package-info.nvim', disable = not EcoVim.plugins.package_info.enabled}
  use {'lpinilla/vim-codepainter', config = "require('plugins.codepainter')"}
  -- Snippets & Language & Syntax
  use {'windwp/nvim-autopairs', after = {'nvim-treesitter', 'nvim-cmp'}, config = "require('plugins.autopairs')"}
  use { 'windwp/nvim-ts-autotag', config = "require('nvim-ts-autotag').setup()" }
  use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
  use {'mattn/emmet-vim'}
  use {'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')"}
  use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
  use {'SirVer/ultisnips', requires = {"Big7Lion/vim-snippets"}, config = "require('plugins.ultisnips')", after = 'cmp-nvim-ultisnips'}
  use {'voldikss/vim-translator'}
  use {'prettier/vim-prettier'}

  -- Nvim Tree
  use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}
  use { 'Shatur/neovim-session-manager',
    requires = { 'nvim-lua/plenary.nvim'},
    config = "require('plugins.sessions')"
  }
  use { 'stevearc/aerial.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = "require('plugins.outline')"
  }

  -- Better cursor movement
  use { 'justinmk/vim-sneak', config = "require('plugins.sneak')" }
  -- Better search & replacement
  use { 'windwp/nvim-spectre' }
  use { 'tpope/vim-surround' }

  -- Debug
  -- TODO: Configure dap
  use {'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"}}
  use {'mfussenegger/nvim-dap', config = "require('plugins.dap')"}

  -- Git
  use {'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }
  use {'sindrets/diffview.nvim'}
  use {'akinsho/git-conflict.nvim', config = function()
    require('git-conflict').setup()
  end}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
