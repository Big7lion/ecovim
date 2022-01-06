local M = {}

-- Auto-install
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, haskell = lsp_installer_servers.get_server("hls")
if ok then
    if not haskell:is_installed() then
        haskell:install()
    end
end

return M
