-- UI

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP settings (for overriding per client)
-- Load servers (They will be automatically installed after next "Sync plugins" launch)
-- Check installed servers by :LspInstallInfo

vim.diagnostic.config({
  virtual_text = false,
  checkCurrentLine = true
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor'
    }
    vim.diagnostic.open_float(nil, opts)
  end
})


require('lsp.servers.bash')
require('lsp.servers.css')
require('lsp.servers.eslint')
-- require('lsp.servers.html')
require('lsp.servers.json')
require('lsp.servers.lua')
require('lsp.servers.tsserver')
require('lsp.servers.vue')
require('lsp.servers.haskell')
require('lsp.servers.solargraph')
