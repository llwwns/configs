set encoding=utf-8
let g:vim_json_conceal=0
scriptencoding utf-8
let s:config_path=stdpath("config")

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
execute("luafile " . s:config_path."/plug.lua")
execute("luafile " . s:config_path."/setting.lua")


set laststatus=2
set winblend=20
set pumblend=20

"Highlight all search pattern matches
set hlsearch
"show line number
set number relativenumber

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
set noincsearch
"set smarttab
"set spell
filetype plugin indent on
set completeopt=longest,menu
set grepprg=git\ grep\ -I\ --line-number\ --no-color\ -E

function! ToggleNERDTree()
    if !g:NERDTree.ExistsForTab() || !g:NERDTree.IsOpen()
      if empty(expand('%:p'))
        NERDTreeToggle
      else
        NERDTreeFind
      end
    else
      NERDTreeToggle
    end
endfunction

map <c-q> :q<CR>
nmap <silent> <c-e> :Buffers<CR>
nmap <silent> <c-p> :Files<CR>
nmap <silent> <Tab> :call ToggleNERDTree()<CR>
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
vnoremap <expr> k v:count == 0 ? 'gk' : 'k'
vnoremap <expr> j v:count == 0 ? 'gj' : 'j'
set nowrap

nnoremap <up> <c-y>
nnoremap <down> <c-e>
nnoremap <left> zH
nnoremap <right> zL
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
nmap <Leader>t :Ttoggle<CR>
vmap <Leader>r :TREPLSendSelection<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
command! -bang -nargs=* Rg AsyncRun rg --vimgrep <args>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -nargs=1 Z execute("cd ".system('zoxide query <args>'))
command! Lcd lcd %:h
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <C-k> :PrevDiagnosticCycle<CR>
nmap <C-j> :NextDiagnosticCycle<CR>
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_auto_popup_while_jump = 0
let g:diagnostic_insert_delay = 1

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

if exists('gnvim')
  set guifont=Iosevka\ Term:h12
  set guicursor+=a:blinkon0
elseif exists('neovide')
  set guifont=Sarasa\ Nerd\ Font:h17
  let g:neovide_cursor_animation_length=0.05
  let g:neovide_cursor_trail_length=0.1
  nnoremap <A-CR> :execute("let g:neovide_fullscreen = !g:neovide_fullscreen")<CR>
elseif exists('g:fvim_loaded')
  FVimBackgroundOpacity 0.7
  set guifont=Sarasa\ Nerd\ Font:h18
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
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

let $FZF_DEFAULT_OPTS='--layout=reverse'


set guioptions-=e
set laststatus=2


if has('nvim-0.5.0')
  execute("luafile " . stdpath("config")."/lsp.lua")
endif

sign define LspDiagnosticsErrorSign text=✗ texthl=ALEErrorSign linehl= numhl=
sign define LspDiagnosticsWarningSign text=! texthl=ALEWarningSign linehl= numhl=
sign define LspDiagnosticsInformationSign text=i texthl=ALEInfoSign linehl= numhl=
sign define LspDiagnosticsHintSign text=💡 texthl=Label linehl= numhl=

highlight!   link   LspDiagnosticsWarning  ALEVirtualTextWarning
highlight!   link   LspDiagnosticsError    ALEVirtualTextError
highlight!   link   LspDiagnosticsInfo     ALEVirtualTextInfo
highlight!   link   LspDiagnosticsHint     ALEVirtualTextInfo

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>rn <cmd>call v:lua.lsp_rename()<CR>
nnoremap <silent> <leader>rp <cmd>call Replace()<CR>
nnoremap <silent> / /\v
nnoremap <silent> ? ?\v
function! s:show_documentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
set exrc
set secure
" hi illuminatedWord cterm=underline ctermbg=0 guibg=#07242c
" imap <c-j> <cmd>lua require'source'.prevCompletion()<CR> "use <c-j> to switch to previous completion
" imap <c-k> <cmd>lua require'source'.nextCompletion()<CR> "use <c-k> to switch to next completion

function! StatuslineLsp() abort
  return luaeval("require('lsp-status').status()")
endfunction

function! Replace()
  let s:w = expand("<cword>")
  call feedkeys(":%s/".s:w."//g\<Left>\<Left>")
endfunction
