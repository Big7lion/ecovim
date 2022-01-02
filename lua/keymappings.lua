local keymap = vim.api.nvim_set_keymap;

-- Better window movement
keymap("n", "<A-h>", "<C-w>h", { silent = true })
keymap("n", "<A-j>", "<C-w>j", { silent = true })
keymap("n", "<A-k>", "<C-w>k", { silent = true })
keymap("n", "<A-l>", "<C-w>l", { silent = true })

-- Better cursor movement
keymap("n", "<C-h>", "<Left>", { silent = true })
keymap("n", "<C-j>", "<Down>", { silent = true })
keymap("n", "<C-k>", "<Up>", { silent = true })
keymap("n", "<C-l>", "<Right>", { silent = true })
keymap("v", "<C-h>", "<Left>", { silent = true })
keymap("v", "<C-j>", "<Down>", { silent = true })
keymap("v", "<C-k>", "<Up>", { silent = true })
keymap("v", "<C-l>", "<Right>", { silent = true })
keymap("i", "<C-h>", "<Left>", { silent = true })
keymap("i", "<C-j>", "<Down>", { silent = true })
keymap("i", "<C-k>", "<Up>", { silent = true })
keymap("i", "<C-l>", "<Right>", { silent = true })

-- Keep visual mode indenting
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Better word select
keymap("n", "<C-d>", "viw", { noremap = true, silent = true })
keymap("v", "<C-d>", "<ESC>viw", { noremap = true, silent = true })

-- Translate
keymap("n", "<S-t>", ":TranslateW<CR>", { noremap = true, silent = true })
keymap("v", "<S-t>", ":TranslateW<CR>", { noremap = true, silent = true })

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
keymap("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>", { noremap = true })
keymap("n", "<S-p>", "<CMD>Telescope live_grep<CR>", { noremap = true })

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Git
keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Don't yank on delete char
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("v", "x", '"_x', { noremap = true, silent = true })
keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Quickfix

-- Space to NOP to prevent Leader issues
keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- LSP
keymap("n", "<F2>", "<CMD>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("v", "<F2>", "<CMD>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "<F3>", "<CMD>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("v", "<F3>", "<CMD>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "<A-q>", "<CMD>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap("v", "<A-q>", "<CMD>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
keymap("n", "<F4>", "<CMD>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "<A-f>", "<CMD>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
keymap("v", "<A-f>", "<CMD>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
-- keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
