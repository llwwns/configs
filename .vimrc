set encoding=utf-8
scriptencoding utf-8
set runtimepath+=~/.vim
runtime! settings.vim
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
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
Plug 'morhetz/gruvbox'
Plug 'mkarmona/colorsbox'
Plug 'tpope/vim-surround'
Plug 'xuhdev/SingleCompile'
"Plug 'majutsushi/tagbar'
"Plug 'fatih/vim-go'
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
" Plug 'Valloric/YouCompleteMe' " ./install.py --go-completer --js-completer --clang-completer --ninja
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-db'
Plug 'equalsraf/neovim-gui-shim'
Plug 'sodapopcan/vim-twiggy'
"Plug 'chrisbra/csv.vim'
Plug 'scrooloose/nerdtree'
"Plug 'lambdalisue/fila.vim'
Plug 'mattsacks/vim-eddie'
Plug 'aradunovic/perun.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'houtsnip/vim-emacscommandline'
Plug 'itchyny/calendar.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'lilydjwg/colorizer'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'lambdalisue/suda.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'moll/vim-node'
Plug 'tyru/eskk.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'rhysd/reply.vim'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-swap'
Plug 'tpope/vim-rails'
Plug 'mechatroner/rainbow_csv'
Plug 'ayu-theme/ayu-vim'
Plug 'ayu-theme/ayu-vim-airline'
Plug 'Shougo/deol.nvim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'lifepillar/vim-gruvbox8'
Plug 'google/vim-searchindex'
Plug 'liuchengxu/vim-clap' " , { 'do': ':Clap install-binary' }
Plug 'skywind3000/vim-quickui'
Plug 'whatyouhide/vim-gotham'

" if !has("win32")
"   Plug 'mhinz/vim-signify'
" endif
runtime! plugins.vim
call plug#end()
"set language to english
if has('multi_lang')
  language C
endif
"set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"silent! colorscheme onedark
" let ayucolor='mirage'
" silent! colorscheme ayu
" let g:quantum_black=1
set background=dark
silent! colorscheme gotham
"LuciusBlackLowContrast
let g:nord_uniform_diff_background = 1

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_text_changed = 'never'
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'ayu'
" let g:airline_theme = 'gruvbox'
let g:airline_theme = 'gotham'
let g:airline_section_b = airline#section#create(["%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"])
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

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
"set smarttab
"set spell
filetype plugin indent on
set completeopt=longest,menu
syntax on
"set clipboard+=unnamed
set grepprg=git\ grep\ -I\ --line-number\ --no-color\ -E
nmap qq :q<CR>
nmap <c-e> :Clap buffers<CR>
nmap <c-p> :Clap files<CR>
" nmap <c-h> :tabp<CR>
" nmap <BS> :tabp<CR>
" nmap <c-l> :tabn<CR>
nmap <Tab> :NERDTreeToggle<CR>
"nmap <Tab> :execute "Fila" getcwd() "-drawer" "-toggle"<CR>
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
" function! IndentFold()
"   let line = getline(v:lnum)
"   let next = getline(v:lnum + 1)
"   let cl = strlen(substitute(line, '\v^\s*\zs.*', '', ''))
"   let cn = strlen(substitute(next, '\v^\s*\zs.*', '', ''))
"   if cn > cl
"     return '>'.(cn / &shiftwidth)
"   endif
"   return cl / &shiftwidth
" endfunction

"function! BraceFold()
"  let line = getline(v:lnum)
"  if line =~ '\v^\s*\}.*\{\s*$'
"    return '='
"  elseif line =~ '\v(^\s*\/\/)|\{\{\{|\}\}\}'
"    return '='
"  elseif line =~ '\v\{\s*$'
"    return 'a1'
"  elseif line =~ '\v^\s*\}'
"    return 's1'
"  else
"    return '='
"  endif
"endfunction
"
"function! SmartyFold()
"  let line = getline(v:lnum)
"  if line =~ '\v\{(if|foreach|capture|function|section)>+.*\{\/\1'
"    return "="
"  elseif line =~ '\v\{\/(if|foreach|capture|function|section)>+.*'
"    return "s1"
"  elseif line =~ '\v\{(if|foreach|capture|function|section)>+.*'
"    return "a1"
"  else
"    return "="
"  endif
"endfunction
"function! ConfluFold()
"  let line = getline(v:lnum)
"  if stridx(line, '{code:') >= 0
"    return "a1"
"  elseif stridx(line, '{code') >= 0
"    return "s1"
"  else
"    return "="
"  endif
"endfunction
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

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
command! -bang -nargs=* Rg AsyncRun rg --vimgrep <args>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
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
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['typescript'] = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_cpp_gcc_options = '-std=c++14 -Wall -Wno-long-long -Wno-sign-compare'
let g:ale_go_gofmt_options = '-s'

if exists('g:gui_oni')
  set number
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let $FZF_DEFAULT_OPTS='--layout=reverse'

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" let g:fila#node#renderer#default#expanded_symbol = '|▼ '
" let g:fila#node#renderer#default#collapsed_symbol = '|▶ '
" let g:fila#node#renderer#default#leaf_symbol = '|  '
let g:polyglot_disabled = ['markdown', 'csv', 'ruby']

set guioptions-=e
set laststatus=2
let g:extra_whitespace_ignored_filetypes = ['calendar']
let g:calendar_google_calendar = 1
let g:EmacsCommandLineSearchCommandLineDisable = 1

let g:coc_global_extensions = [
\   'coc-css',
\   'coc-eslint',
\   'coc-git',
\   'coc-go',
\   'coc-json',
\   'coc-python',
\   'coc-rls',
\   'coc-tsserver',
\   'coc-yaml',
\   'coc-marketplace',
\   'coc-vimlsp',
\   'coc-fish',
\   'coc-pyls',
\   'coc-html',
\   'coc-sql',
\ ]

let g:clap_insert_mode_only = v:true

let g:tmuxline_preset = {
      \ 'a': '[#S]',
      \ 'win': '#I:#W#F',
      \ 'cwin': '#I:#W#F',
      \'x'    : '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0)',
      \'y'    : '%m/%d %H:%M:%S',
      \'z'    : '#H',
        \ 'options': {
        \'status-justify': 'left'} }
