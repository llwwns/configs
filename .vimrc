"plugin manager
set rtp+=~/.vim
set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'jonathanfilip/vim-lucius'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'justinmk/vim-sneak'
Plugin 'easymotion/vim-easymotion'
Plugin 'othree/eregex.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'mbbill/undotree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'vim-scripts/confluencewiki.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'xuhdev/SingleCompile'
"Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'wellle/targets.vim'
Plugin 'mattn/emmet-vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'udalov/kotlin-vim'
Plugin 'evidens/vim-twig'
if !has("win32")
  Plugin 'airblade/vim-gitgutter'
endif
runtime! plugins.vim
set rtp+=~/fzf
call vundle#end()
"set language to english
if has("multi_lang")
  language C
endif
"set colorscheme
"set t_Co=256
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
colo gruvbox
set background=dark
"LuciusBlackLowContrast

"config for lightline
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified', 'syntastic'] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \   'syntastic': '%{SyntasticStatuslineFlag()}'
  \ },
  \'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \   'syntastic': '(SyntasticStatuslineFlag()!="")'
  \ },
  \'enable': { 'statusline': 1, 'tabline': 0 }
  \ }
let g:syntastic_cpp_compiler_options="-std=c++14"
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
set clipboard+=unnamed
set grepprg=git\ grep\ -I\ --line-number\ --no-color\ -E
nmap qq :q<CR>
nmap <c-e> :tabe<CR>:FZF<space>
nmap <c-p> :FZF<CR>
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
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType pug setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType lisp setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
  autocmd Filetype * set formatoptions-=c
  autocmd Filetype * set formatoptions-=r
  autocmd Filetype * set formatoptions-=o
  autocmd Filetype php setlocal fdm=expr
  autocmd Filetype php setlocal foldexpr=BraceFold()
  autocmd Filetype cpp setlocal fdm=expr
  autocmd Filetype cpp setlocal foldexpr=BraceFold()
  autocmd Filetype c setlocal fdm=expr
  autocmd Filetype c setlocal foldexpr=BraceFold()
  autocmd Filetype javascript setlocal fdm=expr
  autocmd Filetype javascript setlocal foldexpr=BraceFold()
  autocmd Filetype json setlocal fdm=expr
  autocmd Filetype json setlocal foldexpr=BraceFold()
  autocmd Filetype css setlocal fdm=expr
  autocmd Filetype css setlocal foldexpr=BraceFold()
  autocmd Filetype smarty setlocal fdm=expr
  autocmd Filetype smarty setlocal foldexpr=SmartyFold()
  autocmd Filetype python setlocal fdm=expr
  autocmd Filetype python setlocal foldexpr=IndentFold()
  autocmd Filetype haskell setlocal fdm=expr
  autocmd Filetype haskell setlocal foldexpr=IndentFold()
  autocmd Filetype coffee setlocal fdm=expr
  autocmd Filetype coffee setlocal foldexpr=IndentFold()
  autocmd Filetype vim setlocal fdm=expr
  autocmd Filetype vim setlocal foldexpr=IndentFold()
  autocmd Filetype ruby setlocal fdm=expr
  autocmd Filetype ruby setlocal foldexpr=IndentFold()
  autocmd Filetype pug setlocal fdm=expr
  autocmd Filetype pug setlocal foldexpr=IndentFold()
  autocmd Filetype * set fdl=10
  autocmd Filetype confluencewiki setlocal fdm=expr
  autocmd Filetype confluencewiki setlocal foldexpr=ConfluFold()
  autocmd Filetype confluencewiki setlocal fdl=0
  autocmd Filetype confluencewiki setlocal fdc=1
  autocmd Filetype * set foldtext=FoldText()
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufNewFile,BufRead *.cwk set filetype=confluencewiki
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
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
runtime! settings.vim
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
