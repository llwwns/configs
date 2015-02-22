if has("win32")
  set guifont=CodeM:h14
  set guioptions-=T
  set guioptions-=m
  set langmenu=none 
  set lines=35 columns=118
else
  set guifont=CodeM\ 14
  map <silent> sy :call YanktmpYank()<CR>
  map <silent> sp :call YanktmpPaste_p()<CR>
  map <silent> sP :call YanktmpPaste_P()<CR>
endif
"plugin manager
execute pathogen#infect()
"set language to english
if has("multi_lang")
  language C
endif
"set colorscheme
set t_Co=256
colorscheme lucius
colo lucius
set background=dark
LuciusBlackLowContrast
"set size for gvim
"enable mouse for all mode
if has('mouse')
  set mouse=a
endif
"config for lightline
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
  \ }
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
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set ambiwidth=double
"setting for indent
set sw=4
set ts=4
set autoindent
set et
"set smarttab
"set spell
filetype plugin indent on
set completeopt=longest,menu
syntax on
set clipboard+=unnamed

"mappings
nmap qq :q<CR>
map <c-e> :tabe<space>
map <c-h> :tabp<CR>
map <c-l> :tabn<CR>
nmap j gj
nmap k gk
nnoremap / /\v
cmap <c-p> <c-r>"
nmap <c-f> yiw/<c-r>"<CR>
nnoremap Y y$
set display=lastline
set pumheight=10
nnoremap + <C-a>
nnoremap - <C-x>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
