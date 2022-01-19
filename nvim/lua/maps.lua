vim.api.nvim_set_keymap("", "<c-q>", "<cmd>q<CR>", {})
vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>Buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>Files<CR>", {})
vim.api.nvim_set_keymap("n", "<Tab>", ":call v:lua.toggleNvimTree()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })

vim.api.nvim_set_keymap("n", "<PageUp>", "<c-u>", { noremap = true })
vim.api.nvim_set_keymap("n", "<PageDown>", "<c-d>", { noremap = true })
vim.api.nvim_set_keymap("n", "<up>", "<c-y>", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "<c-e>", { noremap = true })
vim.api.nvim_set_keymap("n", "<left>", "zH", { noremap = true })
vim.api.nvim_set_keymap("n", "<right>", "zL", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-f>", ":Sub/", { noremap = true })

vim.api.nvim_set_keymap("n", "<c-w>z", "<cmd>NeoZoomToggle<CR>", {})
vim.api.nvim_set_keymap("i", "<c-w>z", "<cmd>NeoZoomToggle<CR>", {})

-- vim.api.nvim_set_keymap("", "<leader>f"  , "<Plug>(easymotion-f)", {})
-- vim.api.nvim_set_keymap("", "<leader>F"  , "<Plug>(easymotion-F)", {})
-- vim.api.nvim_set_keymap("", "<leader>s"  , "<Plug>(easymotion-s)", {})
-- vim.api.nvim_set_keymap("", "<leader>t"  , "<Plug>(easymotion-t)", {})
-- vim.api.nvim_set_keymap("", "<leader>T"  , "<Plug>(easymotion-T)", {})
-- vim.api.nvim_set_keymap("", "<leader>w"  , "<Plug>(easymotion-w)", {})
-- vim.api.nvim_set_keymap("", "<leader>W"  , "<Plug>(easymotion-W)", {})
-- vim.api.nvim_set_keymap("", "<leader>b"  , "<Plug>(easymotion-b)", {})
-- vim.api.nvim_set_keymap("", "<leader>B"  , "<Plug>(easymotion-B)", {})
-- vim.api.nvim_set_keymap("", "<leader>e"  , "<Plug>(easymotion-e)", {})
-- vim.api.nvim_set_keymap("", "<leader>E"  , "<Plug>(easymotion-E)", {})
-- vim.api.nvim_set_keymap("", "<leader>ge" , "<Plug>(easymotion-ge)", {})
-- vim.api.nvim_set_keymap("", "<leader>gE" , "<Plug>(easymotion-gE)", {})
-- vim.api.nvim_set_keymap("", "<leader>j"  , "<Plug>(easymotion-j)", {})
-- vim.api.nvim_set_keymap("", "<leader>k"  , "<Plug>(easymotion-k)", {})
-- vim.api.nvim_set_keymap("", "<leader>n"  , "<Plug>(easymotion-n)", {})
-- vim.api.nvim_set_keymap("", "<leader>N"  , "<Plug>(easymotion-N)", {})
-- vim.api.nvim_set_keymap("", "<leader>w"  , "<Plug>(easymotion-w)", {})

-- vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-s2)", {})
-- vim.api.nvim_set_keymap("v", "s", "<Plug>(easymotion-s2)", {})
-- vim.api.nvim_set_keymap("o", "z", "<Plug>(easymotion-s2)", {})

-- vim.api.nvim_set_keymap("v", "L" , "<Plug>(easymotion-overwin-line)", {})
-- vim.api.nvim_set_keymap("n", "L" , "<Plug>(easymotion-overwin-line)", {})

vim.api.nvim_set_keymap(
  "",
  "<leader>w",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>b",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>e",
  "<cmd>lua require'hop'.hint_patterns({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR }, '\\\\w\\\\>')<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>ge",
  "<cmd>lua require'hop'.hint_patterns({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR }, '\\\\w\\\\>')<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>j",
  "<cmd>lua require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "<leader>k",
  "<cmd>lua require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<CR>",
  {}
)
vim.api.nvim_set_keymap("n", "s", "<cmd>lua require'hop'.hint_char2()<CR>", {})
vim.api.nvim_set_keymap("v", "s", "<cmd>lua require'hop'.hint_char2()<CR>", {})
vim.api.nvim_set_keymap("o", "z", "<cmd>lua require'hop'.hint_char2()<CR>", {})
vim.api.nvim_set_keymap("v", "L", '<cmd>lua require"hop".hint_lines()<CR>', {})
vim.api.nvim_set_keymap("n", "L", '<cmd>lua require"hop".hint_lines()<CR>', {})

vim.api.nvim_set_keymap("n", "<leader>a", ":ArgWrap<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "w!!", "w suda://%", {})
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("n", "<Leader>m", "<Plug>(git-messenger)", {})
vim.api.nvim_set_keymap("n", "[,", ":Tab /,<CR>", {})
vim.api.nvim_set_keymap("v", "[,", ":'<,'>Tab /,<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>t", ":Ttoggle<CR>", {})
vim.api.nvim_set_keymap("v", "<Leader>r", ":TREPLSendSelection<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ql", ":call v:lua.stop_lsp()<CR>", {})

-- vim.api.nvim_set_keymap("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<TAB>"]], { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<Down>", [[pumvisible() ? "\<C-n>" : "\<Down>"]], { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<S-TAB>"]], { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<Up>", [[pumvisible() ? "\<C-p>" : "\<Up>"]], { expr = true, noremap = true })

-- nmap <silent> <C-k> <Plug>(ale_previous_wrap)
-- nmap <silent> <C-j> <Plug>(ale_next_wrap)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua require'lspsaga.diagnostic'.navigate('prev')()<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>lua require'lspsaga.diagnostic'.navigate('next')()<CR>", {})

vim.api.nvim_set_keymap("t", "<C-[><C-[>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true })

-- vim.api.nvim_set_keymap("n", "<leader>", [[:WhichKey "'"<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":call ShowDocumentation()<CR>", { noremap = true, silent = true })

-- cmap <c-v> <c-r>
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })
vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = true })
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-\\>", [[:tab split<CR>:exec("tag ".expand("<cword>"))<CR>]], {})

vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('FTerm').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<c-s>", "<cmd>lua require('FTerm').toggle()<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('\\<CR\\>')", { noremap = true, expr = true })

-- vim.api.nvim_set_keymap("", "<f1>", "1gt", {})
-- vim.api.nvim_set_keymap("", "<f2>", "2gt", {})
-- vim.api.nvim_set_keymap("", "<f3>", "3gt", {})
-- vim.api.nvim_set_keymap("", "<f4>", "4gt", {})
-- vim.api.nvim_set_keymap("", "<f5>", "5gt", {})
-- vim.api.nvim_set_keymap("", "<f6>", "6gt", {})
-- vim.api.nvim_set_keymap("", "<f7>", "7gt", {})
-- vim.api.nvim_set_keymap("", "<f8>", "8gt", {})
-- vim.api.nvim_set_keymap("", "<f9>", "9gt", {})

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Neogit<CR>", { noremap = true })
