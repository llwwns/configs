if has("win32")
  set guifont=Iosevka:h14
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set langmenu=none 
  set lines=35 columns=118
"  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
elseif has("gui_macvim")
"  set showtabline=2
  set imdisable
  set antialias
  set guifont=Iosevka:h14
  set lines=35 columns=118
  set guioptions-=r
  set macligatures
else
  set guifont=Iosevka\ 14
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set langmenu=none 
endif
if has('mouse')
  set mouse=a
  vmap <RightMouse> y
  nmap <RightMouse> p
endif
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

