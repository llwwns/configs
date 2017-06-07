"plugin manager
set rtp+=~/.vim
runtime! settings.vim
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'othree/eregex.vim'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/confluencewiki.vim'
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'mkarmona/colorsbox'
Plug 'tpope/vim-surround'
Plug 'xuhdev/SingleCompile'
Plug 'majutsushi/tagbar'
Plug 'kchmck/vim-coffee-script'
"Plug 'fatih/vim-go'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'
Plug 'FooSoft/vim-argwrap'
Plug 'udalov/kotlin-vim'
Plug 'evidens/vim-twig'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'othree/yajs.vim'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'ElmCast/elm-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  \ | Plug 'zchee/deoplete-jedi'
  \ | Plug 'awetzel/elixir.nvim' , { 'do': 'yes \| ./install.sh' }
  \ | Plug 'eagletmt/neco-ghc'
  \ | Plug 'fishbullet/deoplete-ruby'
  \ | Plug 'carlitux/deoplete-ternjs'
  \ | Plug 'pbogut/deoplete-padawan'
  \ | Plug 'racer-rust/vim-racer'
  \ | Plug 'zchee/deoplete-go', { 'do': 'make'}
  \ | Plug 'c9s/perlomni.vim', { 'do': 'make install'}
  if exists('g:clang_library_path') && g:clang_library_path != ''
    Plug 'Rip-Rip/clang_complete', { 'do': 'make install' }
  endif
endif
Plug 'skywind3000/asyncrun.vim'

Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'moll/vim-node'
if !has("win32")
  Plug 'airblade/vim-gitgutter'
endif
runtime! plugins.vim
call plug#end()
"set language to english
if has("multi_lang")
  language C
endif
"set colorscheme
"set t_Co=256
"colorscheme gruvbox
set termguicolors
colorscheme onedark
"LuciusBlackLowContrast

let g:syntastic_cpp_compiler_options="-std=c++14"
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_text_changed = 'never'
let g:airline_powerline_fonts = 1
let g:airline_theme= 'onedark'

set laststatus=2

"Highlight all search pattern matches
set hls
"show line number
set nu
"set backspace to delete indent, endo of line and before insert start
set backspace=indent,eol,start
"allow cursor go to next line
set whichwrap=b,s,<,>,[,]
set encoding=utf-8
"set encoding=shift-jis
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
"setting for indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
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
nmap <c-e> :tabe<CR>:Files<space>
nmap <c-p> :Files<CR>
vmap <c-e> y:tabe <c-r>"<CR>
nmap <c-h> :tabp<CR>
nmap <BS> :tabp<CR>
nmap <c-l> :tabn<CR>
nmap <Tab> :TagbarToggle<CR>
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
imap <expr> <TAB> pumvisible() ? "<Down>" : "<Tab>"
set list
set listchars=tab:▸\ ,eol:¬
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1
function! IndentFold()
  let line = getline(v:lnum)
  let next = getline(v:lnum + 1)
  let cl = strlen(substitute(line, '\v^\s*\zs.*', '', ''))
  let cn = strlen(substitute(next, '\v^\s*\zs.*', '', ''))
  if cn > cl
    return ">".(cn / &shiftwidth)
  endif
  return cl / &shiftwidth
endfunction

function! BraceFold()
  let line = getline(v:lnum)
  if line =~ '\v^\s*\}.*\{\s*$'
    return '='
  elseif line =~ '\v(^\s*\/\/)|\{\{\{|\}\}\}'
    return '='
  elseif line =~ '\v\{\s*$'
    return 'a1'
  elseif line =~ '\v^\s*\}'
    return 's1'
  else
    return '='
  endif
endfunction

function! SmartyFold()
  let line = getline(v:lnum)
  if line =~ '\v\{(if|foreach|capture|function|section)>+.*\{\/\1'
    return "="
  elseif line =~ '\v\{\/(if|foreach|capture|function|section)>+.*'
    return "s1"
  elseif line =~ '\v\{(if|foreach|capture|function|section)>+.*'
    return "a1"
  else
    return "="
  endif
endfunction

function! ConfluFold()
  let line = getline(v:lnum)
  if stridx(line, '{code:') >= 0
    return "a1"
  elseif stridx(line, '{code') >= 0
    return "s1"
  else
    return "="
  endif
endfunction

function! FoldText()
  return getline(v:foldstart)."------[".(v:foldend-v:foldstart+1)." lines]------"
endfunction


if has("autocmd")
  " Enable file type detection
  filetype on
  autocmd FileType * setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType pug setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType lisp setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype * set formatoptions-=c
  autocmd Filetype * set formatoptions-=r
  autocmd Filetype * set formatoptions-=o
  autocmd Filetype * set fdl=10
  autocmd Filetype * set fdm=indent
  autocmd Filetype * set foldtext=FoldText()
  autocmd Filetype confluencewiki setlocal fdm=expr
  autocmd Filetype confluencewiki setlocal fdl=0
  autocmd Filetype confluencewiki setlocal fdc=1
  
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufNewFile,BufRead *.cwk set filetype=confluencewiki
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  if (!has("nvim"))
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
autocmd Filetype cpp nmap <buffer> <F7> :SCCompileAF -std=c++14 <CR>
autocmd Filetype cpp nmap <buffer> <F8> :SCCompileRunAF -std=c++14 <CR>
let mapleader="'"
nmap <buffer> <F8> :SCCompileRun<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nnoremap <silent> <leader>a :ArgWrap<CR>
cmap w!! w !sudo tee > /dev/null %
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap L <Plug>(easymotion-overwin-line)
vmap L <Plug>(easymotion-overwin-line)

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#enable_smart_case=1

function! g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function! g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
command! -bang -nargs=* Rg AsyncRun rg --vimgrep <args>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
let g:asyncrun_auto="asyncrun"
autocmd QuickFixCmdPost asyncrun botright copen 8
let g:deoplete#sources#go#gocode_binary = '~/goprojects/bin/gocode'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

command! Lcd lcd %:h
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
