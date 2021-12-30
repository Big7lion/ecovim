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

-- Find word/file across project
keymap("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
keymap("n", "gn", ":bn<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
keymap("n", "gp", ":bp<CR>", { noremap = true, silent = true })
keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })
-- Move between barbar buffers
keymap("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })

-- Don't yank on delete char
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("v", "x", '"_x', { noremap = true, silent = true })
keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", { silent = true })
keymap("n", "<Space>.", ":cn<CR>", { silent = true })
keymap("n", "<Space>cc", ":cclose<CR>", { silent = true })

-- Easyalign
-- keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
-- keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count2) <bar> endif<CR>", { noremap = true, silent = true }) 
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 0}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", { noremap = true, silent = true })

-- Space to NOP to prevent Leader issues
keymap("n", "<Space>", "<NOP>", { noremap                                                  = true, silent = true })

-- Open links under cursor in browser with gx
if vim.fn.has('macunix')                                                                  == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { silent  = true })
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
end

-- Erase painter line
keymap("n", "<F4>", "<cmd>lua require('functions').erase_painter_line()<CR>", { noremap = true, silent = true })

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
