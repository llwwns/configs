set encoding=utf-8
scriptencoding utf-8
set runtimepath+=~/.vim
runtime! settings.vim
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
if $TMUXLINE ==# '1'
  Plug 'edkolev/tmuxline.vim'
endif
Plug 'othree/eregex.vim'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-abolish'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'
Plug 'FooSoft/vim-argwrap'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
"Plug 'othree/yajs.vim'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'ElmCast/elm-vim'
Plug 'AndrewRadev/deleft.vim'
Plug 'lambdalisue/gina.vim'
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'

Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-db'
Plug 'equalsraf/neovim-gui-shim'
Plug 'sodapopcan/vim-twiggy'
"Plug 'chrisbra/csv.vim'
Plug 'scrooloose/nerdtree'
"Plug 'lambdalisue/fila.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'houtsnip/vim-emacscommandline'
Plug 'b4b4r07/vim-hcl'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'lambdalisue/suda.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'elixir-lang/vim-elixir'
Plug 'moll/vim-node'
Plug 'tyru/eskk.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'rhysd/reply.vim'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'machakann/vim-swap'
Plug 'tpope/vim-rails'
Plug 'mechatroner/rainbow_csv'
Plug 'Shougo/deol.nvim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'google/vim-searchindex'
Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'franbach/miramare'
Plug 'sainnhe/gruvbox-material'
Plug 'rhysd/try-colorscheme.vim'
Plug 'airblade/vim-gitgutter'
runtime! plugins.vim
call plug#end()
"set language to english
if has('multi_lang')
  language C
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
silent! colorscheme gotham
let g:nord_uniform_diff_background = 1

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_text_changed = 'never'
let g:airline_powerline_fonts = 1
let g:gotham_airline_emphasised_insert = 0
let g:airline_theme = 'gotham'
let g:airline#extensions#tabline#enabled = 1

let g:gruvbox_contrast_dark='hard'
set laststatus=2

"Highlight all search pattern matches
set hlsearch
"show line number
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"set backspace to delete indent, endo of line and before insert start
set backspace=indent,eol,start
"allow cursor go to next line
set whichwrap=b,s,<,>,[,]
"set encoding=shift-jis
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,utf-16,utf-16le,gb2312
"setting for indent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set updatetime=1000
set signcolumn=yes
"set smarttab
"set spell
filetype plugin indent on
set completeopt=longest,menu
syntax on
set grepprg=git\ grep\ -I\ --line-number\ --no-color\ -E
map <c-q> :q<CR>
nmap <c-e> :Buffers<CR>
nmap <c-p> :Files<CR>
nmap <Tab> :NERDTreeToggle<CR>
nmap j gj
nmap k gk
vmap j gj
vmap k gk
set nowrap

nnoremap <up> <c-y>
nnoremap <down> <c-e>
nnoremap <left> zH
nnoremap <right> zL
nnoremap <leader>/ :call eregex#toggle()<CR>
nnoremap <c-f> :Sub/
"cmap <c-v> <c-r>"
nnoremap Y y$
set display=lastline
set pumheight=10
nnoremap + <C-a>
nnoremap - <C-x>
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set list
set listchars=tab:▸\ ,eol:¬
function! TOMLFold()
  let line = getline(v:lnum)
  if line =~? '\v^($|[)'
    return '0'
  endif
  return '1'
endfunction
function! BufWidth()
  let width = winwidth(0)
  let numwidth = (&number || &relativenumber) ? &numberwidth : 0
  let foldwidth = &foldcolumn
  if &signcolumn == 'yes'
    let signwidth = 2
  elseif &signcolumn == 'auto'
    let signs = execute(printf('sign place buffer=%d', bufnr('')))
    let signs = split(signs, "\n")
    let signwidth = len(signs) > 2 ? 2: 0
  else
    let signwidth = 0
  endif
  return width - numwidth - foldwidth - signwidth
endfunction

function! FoldText()
  let line = substitute(getline(v:foldstart), "\t", repeat(' ', &shiftwidth), 'g')
  let winsize = BufWidth()
  let lineCount = '['.(v:foldend-v:foldstart+1).' lines]-----'
  return line.repeat('-', winsize - strdisplaywidth(line) - strdisplaywidth(lineCount)).lineCount
endfunction


if has('autocmd')
  " Enable file type detection
  filetype on
  augroup filetypes
    autocmd Filetype calendar IndentLinesDisable
    autocmd FileType * setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType pug setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType lisp setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType nim setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType slim setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType nginx setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType csv nmap [c :RainbowAlign <CR>
    autocmd FileType csv nmap ]c :RainbowShrink <CR>
    autocmd FileType json nmap [j :call JsonBeautify() <CR>
    autocmd FileType rust setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype * set formatoptions-=c
    autocmd Filetype * set formatoptions-=r
    autocmd Filetype * set formatoptions-=o
    autocmd Filetype * set fdl=10
    autocmd Filetype * set fdm=indent
    autocmd Filetype * set foldtext=FoldText()
    autocmd Filetype * set shortmess=atToOFcA
    autocmd Filetype toml set fdm=expr
    autocmd Filetype toml set foldexpr=TOMLFold()
    autocmd Filetype confluencewiki setlocal fdm=expr
    autocmd Filetype confluencewiki setlocal fdl=0
    autocmd Filetype confluencewiki setlocal fdc=1
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufNewFile,BufRead *.cwk set filetype=confluencewiki
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
    autocmd Filetype cpp nmap <buffer> <F7> :SCCompileAF -std=c++14 <CR>
    autocmd Filetype cpp nmap <buffer> <F8> :SCCompileRunAF -std=c++14 <CR>
  augroup END
  augroup asyncrun
    autocmd QuickFixCmdPost asyncrun botright copen 8
  augroup END
  if (!has('nvim'))
    augroup foldmethod-expr
      autocmd!
      autocmd InsertEnter * if &l:foldmethod ==# 'expr'
      \                   |   let b:foldinfo = [&l:foldmethod, &l:foldexpr]
      \                   |   setlocal foldmethod=manual foldexpr=0
      \                   | endif
      autocmd InsertLeave * if exists('b:foldinfo')
      \                   |   let [&l:foldmethod, &l:foldexpr] = b:foldinfo
      \                   | endif
    augroup END
  endif
endif

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction


function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
let mapleader="'"
let maplocalleader="'"
nmap <buffer> <F8> :SCCompileRun<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nnoremap <silent> <leader>a :ArgWrap<CR>
cmap w!! w suda://%
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vmap L <Plug>(easymotion-overwin-line)
nmap L <Plug>(easymotion-overwin-line)
nmap <Leader>m <Plug>(git-messenger)
nmap [, :Tab /,<CR>
vmap [, :'<,'>Tab /,<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
command! -bang -nargs=* Rg AsyncRun rg --vimgrep <args>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -nargs=1 Z execute("cd ".system('zoxide query <args>'))
let g:asyncrun_auto='asyncrun'
command! Lcd lcd %:h
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

tnoremap <C-[><C-[> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
set hidden
command! -range -nargs=* SS <line1>,<line2>!perl -pe "s<q-args>"
command! -range -nargs=* Yml <line1>,<line2>!yq.v2 r -
command! -range -nargs=* Jq <line1>,<line2>!jq .
command! -range -nargs=* Json <line1>,<line2>!yq.v2  r -j - | jq .
command! -range Prettier <line1>,<line2>!prettier --stdin --semi --single-quote --jsx-bracket-same-line --print-width 120
command! -nargs=* MY !echo "s<q-args>"
command! Todo e ~/todo.txt
set tags=./tags,tags;/

"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:disable_key_mappings=1
let g:eskk#large_dictionary = { 'path': '~/configs/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }
let g:eskk#enable_completion = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['eslint']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_fixers['go'] = ['gofmt']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['typescript'] = ['eslint']
let g:ale_linters['c'] = ['clangd']
let g:ale_linters['cpp'] = ['clangd']
let g:ale_linters['go'] = ['gopls']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_cpp_gcc_options = '-std=c++14 -Wall -Wno-long-long -Wno-sign-compare'
let g:ale_go_gofmt_options = '-s'

if exists('g:gui_oni')
  set number
  set nobackup
  set noswapfile
  set smartcase
  " Turn off statusbar, because it is externalized
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
  set mouse=a
elseif exists('gnvim')
  set guifont=Iosevka\ Term:h12
  set guicursor+=a:blinkon0
elseif exists('neovide')
  set guifont=Iosevka\ Term:h16
  let g:neovide_cursor_animation_length=0.05
  let g:neovide_cursor_trail_length=0.1
else
  "hi Normal guibg=NONE ctermbg=NONE
endif
set fillchars+=vert:│
let $FZF_DEFAULT_COMMAND = 'fd'
"let g:airline#extensions#tabline#enabled = 1
let g:Illuminate_delay = 0
let g:signify_sign_change = '~'
set shortmess=atToOFcA
set sessionoptions=blank,curdir,folds,tabpages

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

let $FZF_DEFAULT_OPTS='--layout=reverse'

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:polyglot_disabled = ['markdown', 'csv', 'ruby']

set guioptions-=e
set laststatus=2
let g:extra_whitespace_ignored_filetypes = ['calendar']
let g:calendar_google_calendar = 1
let g:EmacsCommandLineSearchCommandLineDisable = 1

let g:clap_insert_mode_only = v:true

let g:airline#extensions#tmuxline#snapshot_file = "~/configs/.tmuxline"

let g:tmuxline_preset = {
      \ 'a': '[#S]',
      \ 'win': '#I:#W#F',
      \ 'cwin': '#I:#W#F',
      \'x'    : '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0)',
      \'y'    : '%m/%d %H:%M:%S',
      \'z'    : '#H',
      \ 'options': {
      \'status-justify': 'left'} }

let g:Hexokinase_highlighters = ['backgroundfull']
let g:clap_search_box_border_style = 'nil'

if has('nvim-0.4.0')
  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
    \ 'row': (&lines - height) / 2,
    \ 'col': (&columns - width) / 2,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \}

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
  endfunction
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

lua require'nvim_lsp'.clangd.setup{}
lua require'nvim_lsp'.gopls.setup{}
lua require'nvim_lsp'.rls.setup{}
lua require'nvim_lsp'.solargraph.setup{}
lua require'nvim_lsp'.tsserver.setup{}
lua require'nvim_lsp'.vimls.setup{}
lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.jsonls.setup{}
autocmd BufEnter * lua require'completion'.on_attach()
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
