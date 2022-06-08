vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("", "<c-q>", "<cmd>q<CR>")
-- vim.keymap.set("n", "<c-e>", "<cmd>Buffers<CR>")
-- vim.keymap.set("n", "<c-p>", "<cmd>Files<CR>")
vim.keymap.set("n", "<c-e>", function()
  require("telescope.builtin").buffers { sort_lastused = true, sort_mru = true }
end)
vim.keymap.set("n", "<c-p>", function()
  require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader><Tab>", function()
  require("nvim-tree").toggle(true)
end, { silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })

vim.keymap.set("n", "<PageUp>", "<c-u>", { noremap = true })
vim.keymap.set("n", "<PageDown>", "<c-d>", { noremap = true })
vim.keymap.set("n", "<up>", "<c-y>", { noremap = true })
vim.keymap.set("n", "<down>", "<c-e>", { noremap = true })
vim.keymap.set("n", "<left>", "zH", { noremap = true })
vim.keymap.set("n", "<right>", "zL", { noremap = true })
vim.keymap.set("n", "<c-f>", ":Sub/", { noremap = true })

vim.keymap.set({ "n", "i" }, "<c-w>z", "<cmd>NeoZoomToggle<CR>")
-- vim.api.nvim_command [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<Cmd>lua vim.lsp.codelens.run()<CR>", { silent = true })

-- vim.keymap.set("", "<leader>f"  , "<Plug>(easymotion-f)")
-- vim.keymap.set("", "<leader>F"  , "<Plug>(easymotion-F)")
-- vim.keymap.set("", "<leader>s"  , "<Plug>(easymotion-s)")
-- vim.keymap.set("", "<leader>t"  , "<Plug>(easymotion-t)")
-- vim.keymap.set("", "<leader>T"  , "<Plug>(easymotion-T)")
-- vim.keymap.set("", "<leader>w"  , "<Plug>(easymotion-w)")
-- vim.keymap.set("", "<leader>W"  , "<Plug>(easymotion-W)")
-- vim.keymap.set("", "<leader>b"  , "<Plug>(easymotion-b)")
-- vim.keymap.set("", "<leader>B"  , "<Plug>(easymotion-B)")
-- vim.keymap.set("", "<leader>e"  , "<Plug>(easymotion-e)")
-- vim.keymap.set("", "<leader>E"  , "<Plug>(easymotion-E)")
-- vim.keymap.set("", "<leader>ge" , "<Plug>(easymotion-ge)")
-- vim.keymap.set("", "<leader>gE" , "<Plug>(easymotion-gE)")
-- vim.keymap.set("", "<leader>j"  , "<Plug>(easymotion-j)")
-- vim.keymap.set("", "<leader>k"  , "<Plug>(easymotion-k)")
-- vim.keymap.set("", "<leader>n"  , "<Plug>(easymotion-n)")
-- vim.keymap.set("", "<leader>N"  , "<Plug>(easymotion-N)")
-- vim.keymap.set("", "<leader>w"  , "<Plug>(easymotion-w)")

-- vim.keymap.set("n", "s", "<Plug>(easymotion-s2)")
-- vim.keymap.set("v", "s", "<Plug>(easymotion-s2)")
-- vim.keymap.set("o", "z", "<Plug>(easymotion-s2)")

-- vim.keymap.set("v", "L" , "<Plug>(easymotion-overwin-line)")
-- vim.keymap.set("n", "L" , "<Plug>(easymotion-overwin-line)")

vim.keymap.set("", "<leader>w", function()
  require("hop").hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
end)
vim.keymap.set("", "<leader>b", function()
  require("hop").hint_words { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
end)

vim.keymap.set("", "<leader>e", function()
  require("hop").hint_patterns({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }, "\\\\w\\\\>")
end)
vim.keymap.set("", "<leader>ge", function()
  require("hop").hint_patterns({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }, "\\\\w\\\\>")
end)
vim.keymap.set("", "<leader>f", function()
  require("hop").hint_char1 { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
end)
vim.keymap.set("", "<leader>F", function()
  require("hop").hint_char1 { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
end)
vim.keymap.set("", "<leader>j", function()
  require("hop").hint_lines { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
end)
vim.keymap.set("", "<leader>k", function()
  require("hop").hint_lines { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
end)
vim.keymap.set("n", "s", function()
  require("hop").hint_char2()
end)
vim.keymap.set("v", "s", function()
  require("hop").hint_char2()
end)
vim.keymap.set("o", "z", function()
  require("hop").hint_char2()
end)
-- vim.keymap.set("v", "L", '<cmd>lua require"hop".hint_lines()<CR>')
-- vim.keymap.set("n", "L", '<cmd>lua require"hop".hint_lines()<CR>')

vim.keymap.set("n", "<leader>a", ":ArgWrap<CR>", { noremap = true, silent = true })
vim.keymap.set("c", "w!!", "w suda://%")
vim.keymap.set("n", "<Leader>m", "<Plug>(git-messenger)")
vim.keymap.set("n", "[,", ":Tab /,<CR>")
vim.keymap.set("v", "[,", ":'<,'>Tab /,<CR>")
vim.keymap.set("n", "<Leader>t", ":Ttoggle<CR>")
vim.keymap.set("v", "<Leader>r", ":TREPLSendSelection<CR>")
-- vim.keymap.set("n", "<leader>ql", stop_lsp)

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- vim.keymap.set("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<TAB>"]], { expr = true, noremap = true })
-- vim.keymap.set("i", "<Down>", [[pumvisible() ? "\<C-n>" : "\<Down>"]], { expr = true, noremap = true })
-- vim.keymap.set("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<S-TAB>"]], { expr = true, noremap = true })
-- vim.keymap.set("i", "<Up>", [[pumvisible() ? "\<C-p>" : "\<Up>"]], { expr = true, noremap = true })

-- nmap <silent> <C-k> <Plug>(ale_previous_wrap)
-- nmap <silent> <C-j> <Plug>(ale_next_wrap)
-- vim.keymap.set("n", "<C-k>", "<cmd>lua require'lspsaga.diagnostic'.navigate('prev')()<CR>")
-- vim.keymap.set("n", "<C-j>", "<cmd>lua require'lspsaga.diagnostic'.navigate('next')()<CR>")

vim.keymap.set("t", "<C-[><C-[>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { noremap = true })
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true })

-- vim.keymap.set("n", "<leader>", [[:WhichKey "'"<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "K", showDocumentation, { noremap = true, silent = true })

-- cmap <c-v> <c-r>
vim.keymap.set("n", "Y", "y$", { noremap = true })
vim.keymap.set("n", "+", "<C-a>", { noremap = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true })

vim.keymap.set("n", "<c-s>", function()
  require("FTerm").toggle()
end, { noremap = true })
vim.keymap.set("t", "<c-s>", function()
  require("FTerm").toggle()
end, { noremap = true })
-- vim.keymap.set("i", "<CR>", "compe#confirm('\\<CR\\>')", { noremap = true, expr = true })

-- vim.keymap.set("", "<f1>", "1gt")
-- vim.keymap.set("", "<f2>", "2gt")
-- vim.keymap.set("", "<f3>", "3gt")
-- vim.keymap.set("", "<f4>", "4gt")
-- vim.keymap.set("", "<f5>", "5gt")
-- vim.keymap.set("", "<f6>", "6gt")
-- vim.keymap.set("", "<f7>", "7gt")
-- vim.keymap.set("", "<f8>", "8gt")
-- vim.keymap.set("", "<f9>", "9gt")

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { noremap = true })

vim.keymap.set("n", "<leader>tf", toggle_format, { noremap = true })

-- Navigation
vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- Actions
vim.keymap.set("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end)
vim.keymap.set("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end)
vim.keymap.set("v", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end)
vim.keymap.set("v", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end)
vim.keymap.set("n", "<leader>hS", function()
  require("gitsigns").stage_buffer()
end)
vim.keymap.set("n", "<leader>hu", function()
  require("gitsigns").undo_stage_hunk()
end)
vim.keymap.set("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end)
vim.keymap.set("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end)
vim.keymap.set("n", "<leader>hb", function()
  require("gitsigns").blame_line { full = true }
end)
vim.keymap.set("n", "<leader>tb", function()
  require("gitsigns").toggle_current_line_blame()
end)
vim.keymap.set("n", "<leader>hd", "<cmd>Gdiff<CR>")
vim.keymap.set("n", "<leader>hD", function()
  require("gitsigns").diffthis "~"
end)
vim.keymap.set("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end)

vim.keymap.set("n", "crp", "crcvU")
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)
vim.keymap.set("t", "<c-'><c-[>", "<c-\\><c-n>", { noremap = true })
map_pairs("a", "")
map_pairs("t", "tab")
map_pairs("q", "c")
map_pairs("l", "l")
map_pairs("b", "b")

vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<CR>")
vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<CR>")
vim.keymap.set("n", "<leader>sc", "<cmd>source ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n", "<leader>db", "<Plug>VimspectorContinue")
vim.keymap.set("n", "<leader>dc", "<Plug>VimspectorRunToCursor")
vim.keymap.set("n", "<leader>sn", "<Plug>VimspectorStepOver")
vim.keymap.set("n", "<leader>si", "<Plug>VimspectorStepInto")
vim.keymap.set("n", "<leader>so", "<Plug>VimspectorStepOut")
vim.keymap.set("n", "<leader>tb", "<Plug>VimspectorToggleBreakpoint")
vim.keymap.set("n", "<leader>tcb", "<Plug>VimspectorToggleConditionalBreakpoint")
