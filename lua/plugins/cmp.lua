-- Setup global configuration. More on configuration below.
local cmp = require('cmp')

local lspkind = require('lspkind')

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local source_mapping = {
  buffer      = EcoVim.icons.buffer .. '[BUF]',
  nvim_lsp    = EcoVim.icons.paragraph .. '[LSP]',
  nvim_lua    = EcoVim.icons.bomb,
  path        = EcoVim.icons.folderOpen2,
  treesitter  = EcoVim.icons.tree,
  ultisnips   = EcoVim.icons.snippet,
  zsh         = EcoVim.icons.terminal .. '[ZSH]',
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },

  -- You must set mapping if you want.
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
      local menu = source_mapping[entry.source.name]
      local maxwidth = 50

      if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = menu .. '[' .. entry.completion_item.data.detail .. ']'
				end
			end

      vim_item.menu = menu
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

      return vim_item
    end
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp'                        },
    { name = 'ultisnips'                       },
    { name = 'buffer', keyword_length = 4      },
    { name = 'path'                            },
    { name = 'nvim_lua'                        },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}

