--  def
local set_var = vim.api.nvim_set_var
local get_var = vim.api.nvim_get_var
local gset_var = function(tbl)
  for key, val in pairs(tbl) do
    vim.g[key] = val
  end
end
local bufwidth = function()
  local width = vim.fn.winwidth(0)
  local numwidth = 0
  local wo = vim.wo
  if wo.number or wo.relativenumber then
    numwidth = wo.numberwidth
  end
  local foldwidth = wo.foldcolumn
  local sc = wo.signcolumn
  local signwidth = 0
  if sc == 'yes' then
    signwidth = 2
  elseif sc == 'auto' then
    local signs = vim.fn.execute(string.format("sign place buffer=%d", vim.fn.bufnr("")))
    signs = vim.fn.split(signs, "\n")
    if #signs > 2 then
      signwidth = 2
    else
      signwidth = 0
    end
  end
  return width - numwidth - foldwidth - signwidth
end

function foldtext()
  local fs = vim.api.nvim_get_vvar("foldstart")
  local fe = vim.api.nvim_get_vvar("foldend")
  local line = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(' ', vim.bo.tabstop), 'g')
  local winSize = bufwidth()
  local lineCount = string.format("[%d lines]-----", fe - fs + 1)
  return line .. string.rep('-', winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount)) ..
           lineCount
end

function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')
    for _, def in ipairs(definition) do
      local cmd = 'autocmd ' .. def
      vim.cmd(cmd)
    end
    vim.cmd('augroup END')
  end
end

function toggleNERDTree()
    if vim.fn.exists('g:NERDTree') == 0 or
      vim.api.nvim_exec("echo g:NERDTree.ExistsForTab()", true) == 0 or
      vim.api.nvim_exec("echo g:NERDTree.IsOpen()", true) == 0 then
      if vim.fn.expand('%:p') == "" then
        vim.cmd("NERDTreeToggle")
      else
        vim.cmd("NERDTreeFind")
      end
    else
      vim.cmd("NERDTreeToggle")
    end
  end

function replace()
  w = vim.fn.expand("<cword>")
  vim.cmd([[call feedkeys(":%s/]] .. w .. [[//g\<Left>\<Left>")]])
end

tomlr = vim.regex([[^($|\[)]])

vim.api.nvim_exec([[
function! TOMLFold()
  let line = getline(v:lnum)
  if line =~? '\v^($|[)'
    return '0'
  endif
  return '1'
endfunction
]], false)

vim.api.nvim_exec([[
function! ShowDocumentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction
]], false)

augroups {
  numbertoggle = {
    "BufEnter,FocusGained,InsertLeave * set relativenumber",
    "BufLeave,FocusLost,InsertEnter * set norelativenumber",
  },
  filetypes = {
    "Filetype calendar IndentLinesDisable",
    "FileType * setlocal tabstop=2 expandtab",
    "FileType make setlocal tabstop=8 noexpandtab",
    "FileType yaml setlocal tabstop=2 expandtab",
    "FileType cpp setlocal tabstop=4 expandtab",
    "FileType vim setlocal tabstop=2 expandtab",
    "FileType ruby setlocal tabstop=2 expandtab",
    "FileType coffee setlocal tabstop=2 expandtab",
    "FileType html setlocal tabstop=2 expandtab",
    "FileType pug setlocal tabstop=2 expandtab",
    "FileType css setlocal tabstop=2 expandtab",
    "FileType scss setlocal tabstop=2 expandtab",
    "FileType lisp setlocal tabstop=2 expandtab",
    "FileType nim setlocal tabstop=2 expandtab",
    "FileType javascript setlocal tabstop=2 expandtab",
    "FileType javascript.jsx setlocal tabstop=2 expandtab",
    "FileType slim setlocal tabstop=2 expandtab",
    "FileType go setlocal tabstop=2 noexpandtab",
    "FileType nginx setlocal tabstop=4 noexpandtab",
    "FileType csv nmap [c :RainbowAlign <CR>",
    "FileType csv nmap ]c :RainbowShrink <CR>",
    "FileType json nmap [j :call JsonBeautify() <CR>",
    "FileType rust setlocal tabstop=4 expandtab",
    "FileType * set formatoptions-=c",
    "FileType * set formatoptions-=r",
    "FileType * set formatoptions-=o",
    "FileType * set fdl=18",
    "FileType * set fdm=indent",
    "FileType * set fdm=indent",
    "FileType rust set foldmethod=expr",
    "FileType rust set foldexpr=nvim_treesitter#foldexpr()",
    "FileType go set foldmethod=expr",
    "FileType go set foldexpr=nvim_treesitter#foldexpr()",
    "FileType lua set foldmethod=expr",
    "FileType lua set foldexpr=nvim_treesitter#foldexpr()",
    "FileType cpp set foldmethod=expr",
    "FileType cpp set foldexpr=nvim_treesitter#foldexpr()",
    "FileType c set foldmethod=expr",
    "FileType c set foldexpr=nvim_treesitter#foldexpr()",
    "FileType javascript set foldmethod=expr",
    "FileType javascript set foldexpr=nvim_treesitter#foldexpr()",
    "FileType typescript set foldmethod=expr",
    "FileType typescript set foldexpr=nvim_treesitter#foldexpr()",
    "FileType typescriptreact set foldmethod=expr",
    "FileType typescriptreact set foldexpr=nvim_treesitter#foldexpr()",
    "FileType json set foldmethod=expr",
    "FileType json set foldexpr=nvim_treesitter#foldexpr()",
    "FileType * set foldtext=v:lua.foldtext()",
    "FileType * set shortmess=atToOFcA",
    "FileType toml set fdm=expr",
    "FileType toml set foldexpr=TOMLFold()",
    "FileType confluencewiki setlocal fdm=expr",
    "FileType confluencewiki setlocal fdl=0",
    "FileType confluencewiki setlocal fdc=1",
    "BufReadPost fugitive://* set bufhidden=delete",
    "BufNewFile,BufRead *.cwk set filetype=confluencewiki",
    "BufNewFile,BufRead *.coffee set filetype=coffee",
    'BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif',
    "Filetype cpp nmap <buffer> <F7> :SCCompileAF -std=c++14 <CR>",
    "Filetype cpp nmap <buffer> <F8> :SCCompileRunAF -std=c++14 <CR>",
    "TermOpen * IndentLinesDisable",
  },
  asyncrun = {
    "QuickFixCmdPost asyncrun botright copen 8",
  },
  completion = {
    "BufEnter * lua local s, com = pcall(require, 'completion'); if s then com.on_attach() end",
    "User eskk-enable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 0)",
    "User eskk-disable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 1)",
  },
  highlight_yank = {
    'TextYankPost * silent! lua require"vim.highlight".on_yank("Visual", 200)'
  },
  scrollbar_nvim = {
    'BufEnter    * silent! lua require("scrollbar").show()',
    'BufLeave    * silent! lua require("scrollbar").clear()',

    'CursorMoved * silent! lua require("scrollbar").show()',
    'VimResized  * silent! lua require("scrollbar").show()',

    'FocusGained * silent! lua require("scrollbar").show()',
    'FocusLost   * silent! lua require("scrollbar").clear()',
  },
}
-- options
if vim.fn.has('multi_lang') then
  vim.cmd("language C")
end
vim.o.encoding = "utf-8"
vim.o.laststatus = 2
vim.wo.winblend = 20
vim.o.pumblend = 20
vim.o.timeoutlen = 500
vim.wo.spell = true
vim.o.spelloptions = "camel"
vim.o.spellcapcheck = ""
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.background="dark"
--set backspace to delete indent, endo of line and before insert start
vim.o.backspace = "indent,eol,start"
--allow cursor go to next line
vim.o.whichwrap = "b,s,<,>,[,]"
if vim.fn.exists('+termguicolors') == 1 then
  vim.o["t_8f"] = "\\<Esc>[38;2;%lu;%lu;%lum"
  vim.o["t_8b"] = "\\<Esc>[48;2;%lu;%lu;%lum"
  vim.o.termguicolors = true
end
vim.o.fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis,utf-16,utf-16le,gb2312"

vim.o.shiftwidth = 0
vim.o.tabstop = 2
vim.o.softtabstop = -1
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.updatetime = 1000
vim.wo.signcolumn = "yes"
vim.o.inccommand = "nosplit"
vim.o.completeopt = "longest,menu"
vim.o.grepprg = "git grep -I --line-number --no-color -E"
vim.wo.wrap = false
vim.o.display = "lastline"
vim.o.pumheight = 10
vim.wo.list = true
vim.o.listchars = "tab:¦ ,eol:¬,extends:»,precedes:«"
-- vim.o.smarttab = true
-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"
vim.o.shortmess="atToOFcA"
vim.o.sessionoptions = "blank,curdir,folds,tabpages"
vim.o.fillchars = "vert:│"
vim.o.laststatus = 2
vim.o.exrc = true
vim.o.secure = true
vim.o.hidden = true
vim.o.tags="./tags,tags;/"
vim.o.spellfile=config_path .. "/spell/en.utf-8.add"

-- commands
vim.cmd("filetype plugin indent on")
vim.api.nvim_exec("set guioptions-=e", false)
vim.api.nvim_exec("let $FZF_DEFAULT_COMMAND = 'fd'", false)
vim.api.nvim_exec("let $FZF_DEFAULT_OPTS='--layout=reverse'", false)
vim.cmd("sign define LspDiagnosticsSignError text=✗ texthl=ALEErrorSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=! texthl=ALEWarningSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=i texthl=ALEInfoSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=💡 texthl=Label linehl= numhl=")
-- vim.cmd("highlight!   link   LspDiagnosticsWarning  ALEVirtualTextWarning")
-- vim.cmd("highlight!   link   LspDiagnosticsError    ALEVirtualTextError")
-- vim.cmd("highlight!   link   LspDiagnosticsInfo     ALEVirtualTextInfo")
-- vim.cmd("highlight!   link   LspDiagnosticsHint     ALEVirtualTextInfo")
-- vim.cmd("highlight!   link   BufferInactive         ALEVirtualTextInfo")

-- global variables
vim.g.mapleader="'"
vim.g.maplocalleader="'"
vim.g.ale_statusline_format = {'⨉ %d', '⚠ %d', '⬥ ok'}
vim.g.ale_lint_on_text_changed = 'never'
vim.g.airline_powerline_fonts = 1
-- vim.g.sonokai_style = 'shusia',
vim.g.sonokai_transparent_background = 0
-- airline_theme = 'sonokai'
vim.g.airline_theme = 'moonfly'
-- airline_theme = 'onedark'
vim.g['airline#extensions#tabline#enabled'] = 0
vim.g.ale_linters_explicit = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.fzf_layout = {
  up = '~90%',
  window = {
    width = 0.8,
    height = 0.8,
    yoffset = 0.5,
    xoffset = 0.5,
    highlight = 'Todo',
    border = 'sharp'
  },
}

vim.g.fzf_colors = {
    fg = {'fg', 'Normal'},
    bg = {'bg', 'Normal'},
    hl = {'fg', 'Comment'},
    ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
    ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
    ['hl+'] = {'fg', 'Statement'},
    info = {'fg', 'PreProc'},
    border = {'fg', 'Ignore'},
    prompt = {'fg', 'Conditional'},
    pointer = {'fg', 'Exception'},
    marker = {'fg', 'Keyword'},
    spinner = {'fg', 'Label'},
    header = {'fg', 'Comment'},
  }

vim.g.completion_auto_change_source = 1
vim.g.vim_json_syntax_conceal = 0
vim.g['eskk#large_dictionary'] = {
  path = '~/configs/SKK-JISYO.L',
  sorted = 1, encoding = 'euc-jp'
}

vim.g['eskk#enable_completion'] = 1

vim.g.completion_trigger_character = {'.', '::', '->'}


vim.g.neoterm_default_mod = 'belowright'
vim.g.neoterm_size = '13'

vim.g.disable_key_mappings = 1

vim.g.ale_fixers = {
  javascript = {'prettier'},
  typescript = {'prettier'},
  typescriptreact = {'prettier'},
  ruby = {'rubocop'},
  go = {'gofmt'},
  rust = {'rustfmt'}
}
vim.g.ale_linters = {
  javascript = {'eslint'},
  typescript = {'eslint'},
  ruby = {'rubocop'},
  -- go = {'gopls'},
  c = {'clangd'},
  cpp = {'clangd'},
  -- rust = {'analyzer'},
  lua = {'luacheck'},
}
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '!'
vim.g.ale_cpp_gcc_options = '-std=c++17 -Wall -Wno-long-long -Wno-sign-compare'
vim.g.ale_go_gofmt_options = '-s'

vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeDirArrowExpandable = '▶'
vim.g.NERDTreeDirArrowCollapsible = '▼'
vim.g.polyglot_disabled = {'csv', 'ruby'}

vim.g.extra_whitespace_ignored_filetypes = {'calendar'}
vim.g.calendar_google_calendar = 1
vim.g.EmacsCommandLineSearchCommandLineDisable = 1

vim.g['airline#extensions#tmuxline#snapshot_file'] = "~/configs/.tmuxline"

vim.g.tmuxline_preset = {
  a = '[#S]',
  win = '#I:#W#F',
  cwin = '#I:#W#F',
  x = '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0)',
  y = '%m/%d %H:%M:%S',
  z = '#H',
  options = {
    ['status-justify'] = 'left',
  },
}

vim.g.Hexokinase_highlighters = {'backgroundfull'}

vim.g.firenvim_config = {
  globalSettings = {alt = 'all'},
  localSettings = {
    ['.*'] = {
      cmdline = 'neovim',
      priority = 0,
      selector = 'textarea',
      takeover = 'never'
    }
  },
}

vim.g.asyncrun_auto = 'asyncrun'
vim.g.indentLine_conceallevel = 2
vim.g.indent_blankline_char = '¦'
vim.g.vim_json_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

vim.g.gitgutter_highlight_linenrs = 1
vim.g.rainbow_active = 1

-- vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.Illuminate_delay = 0
vim.g.signify_sign_change = '~'

vim.cmd('silent! colorscheme moonfly')
-- vim.cmd('silent! colorscheme nvcode')
-- vim.cmd('silent! colorscheme onedark')
-- vim.cmd('silent! colorscheme embark')
local ok, colorizer = pcall(require, 'colorizer')
if ok then
  colorizer.setup()
end

-- maps
vim.api.nvim_set_keymap("", "<c-q>", ":q<CR>", {})
vim.api.nvim_set_keymap("n", "<c-e>", ":Buffers<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-p>", ":Files<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":call v:lua.toggleNERDTree()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })

vim.api.nvim_set_keymap("n",  "<PageUp>", "<c-u>", { noremap = true })
vim.api.nvim_set_keymap("n",  "<PageDown>", "<c-d>", { noremap = true })
vim.api.nvim_set_keymap("n",  "<up>", "<c-y>", { noremap = true })
vim.api.nvim_set_keymap("n",  "<down>", "<c-e>", { noremap = true })
vim.api.nvim_set_keymap("n",  "<left>", "zH", { noremap = true })
vim.api.nvim_set_keymap("n",  "<right>", "zL", { noremap = true })
vim.api.nvim_set_keymap("n",  "<c-f>", ":Sub/", { noremap = true })

vim.api.nvim_set_keymap("", "<leader>f"  , "<Plug>(easymotion-f)", {})
vim.api.nvim_set_keymap("", "<leader>F"  , "<Plug>(easymotion-F)", {})
vim.api.nvim_set_keymap("", "<leader>s"  , "<Plug>(easymotion-s)", {})
vim.api.nvim_set_keymap("", "<leader>t"  , "<Plug>(easymotion-t)", {})
vim.api.nvim_set_keymap("", "<leader>T"  , "<Plug>(easymotion-T)", {})
vim.api.nvim_set_keymap("", "<leader>w"  , "<Plug>(easymotion-w)", {})
vim.api.nvim_set_keymap("", "<leader>W"  , "<Plug>(easymotion-W)", {})
vim.api.nvim_set_keymap("", "<leader>b"  , "<Plug>(easymotion-b)", {})
vim.api.nvim_set_keymap("", "<leader>B"  , "<Plug>(easymotion-B)", {})
vim.api.nvim_set_keymap("", "<leader>e"  , "<Plug>(easymotion-e)", {})
vim.api.nvim_set_keymap("", "<leader>E"  , "<Plug>(easymotion-E)", {})
vim.api.nvim_set_keymap("", "<leader>ge" , "<Plug>(easymotion-ge)", {})
vim.api.nvim_set_keymap("", "<leader>gE" , "<Plug>(easymotion-gE)", {})
vim.api.nvim_set_keymap("", "<leader>j"  , "<Plug>(easymotion-j)", {})
vim.api.nvim_set_keymap("", "<leader>k"  , "<Plug>(easymotion-k)", {})
vim.api.nvim_set_keymap("", "<leader>n"  , "<Plug>(easymotion-n)", {})
vim.api.nvim_set_keymap("", "<leader>N"  , "<Plug>(easymotion-N)", {})
vim.api.nvim_set_keymap("", "<leader>w"  , "<Plug>(easymotion-w)", {})

vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-s2)", {})
vim.api.nvim_set_keymap("v", "s", "<Plug>(easymotion-s2)", {})
vim.api.nvim_set_keymap("o", "z", "<Plug>(easymotion-s2)", {})
vim.api.nvim_set_keymap("n", "<leader>a", ":ArgWrap<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "w!!", "w suda://%", {})
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("v", "L" , "<Plug>(easymotion-overwin-line)", {})
vim.api.nvim_set_keymap("n", "L" , "<Plug>(easymotion-overwin-line)", {})
vim.api.nvim_set_keymap("n", "<Leader>m", "<Plug>(git-messenger)", {})
vim.api.nvim_set_keymap("n", "[,", ":Tab /,<CR>", {})
vim.api.nvim_set_keymap("v", "[,", ":'<,'>Tab /,<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>t", ":Ttoggle<CR>", {})
vim.api.nvim_set_keymap("v", "<Leader>r", ":TREPLSendSelection<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ql", ":call v:lua.stop_lsp()<CR>", {})

vim.api.nvim_set_keymap("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<TAB>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<Down>", [[pumvisible() ? "\<C-n>" : "\<Down>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<S-TAB>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<Up>", [[pumvisible() ? "\<C-p>" : "\<Up>"]], { expr = true, noremap = true })

-- nmap <silent> <C-k> <Plug>(ale_previous_wrap)
-- nmap <silent> <C-j> <Plug>(ale_next_wrap)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {})

vim.api.nvim_set_keymap("t", "<C-[><C-[>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "<lcader>", [[:WhichKey "'"<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":call ShowDocumentation()<CR>", { noremap = true, silent = true })

-- cmap <c-v> <c-r>
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })
vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = true })
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-\\>", [[:tab split<CR>:exec("tag ".expand("<cword>"))<CR>]], {})

vim.api.nvim_set_keymap("", "<f1>", "1gt", {})
vim.api.nvim_set_keymap("", "<f2>", "2gt", {})
vim.api.nvim_set_keymap("", "<f3>", "3gt", {})
vim.api.nvim_set_keymap("", "<f4>", "4gt", {})
vim.api.nvim_set_keymap("", "<f5>", "5gt", {})
vim.api.nvim_set_keymap("", "<f6>", "6gt", {})
vim.api.nvim_set_keymap("", "<f7>", "7gt", {})
vim.api.nvim_set_keymap("", "<f8>", "8gt", {})
vim.api.nvim_set_keymap("", "<f9>", "9gt", {})

-- commands

vim.cmd([[command! -bang -nargs=* Rg AsyncRun rg --vimgrep <args>]])
vim.cmd([[command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>]])
vim.cmd([[command! -nargs=1 Z execute("cd ".system('zoxide query <args>'))]])
vim.cmd([[command! Lcd lcd %:h]])

vim.cmd([[command! -range -nargs=* SS <line1>,<line2>!perl -pe "s<q-args>"]])
vim.cmd([[command! -range -nargs=* Yml <line1>,<line2>!yq.v2 r -]])
vim.cmd([[command! -range -nargs=* Jq <line1>,<line2>!jq .]])
vim.cmd([[command! -range -nargs=* Json <line1>,<line2>!yq.v2  r -j - | jq .]])
vim.cmd([[command! -range Prettier <line1>,<line2>!prettier --stdin --semi --single-quote --jsx-bracket-same-line --print-width 120]])
vim.cmd([[command! -nargs=* MY !echo "s<q-args>"]])
vim.cmd([[command! Todo e ~/todo.txt]])

-- guis
if vim.fn.exists('gnvim') == 1 then
  vim.o.guifont="Iosevka Term:h12"
  vim.o.guicursor = vim.o.guicursor .. ",a:blinkon0"
elseif vim.fn.exists('neovide') == 1 then
  vim.o.guifont="Sarasa Nerd Font:h18"
  -- set guifont=Iosevka\ Term,Sarasa\ Nerd\ Font:h17
  vim.g.neovide_cursor_animation_length=0.05
  vim.g.neovide_cursor_trail_length=0.1
  -- nnoremap <A-CR> :execute("let g:neovide_fullscreen = !g:neovide_fullscreen")<CR>
elseif vim.fn.exists('g:fvim_loaded') == 1 then
  -- FVimBackgroundOpacity 0.7
  vim.o.guifont="Sarasa Nerd Font:h18"
  -- nnoremap <A-CR> :FVimToggleFullScreen<CR>
-- else
  -- "hi Normal guibg=NONE ctermbg=NONE
end

