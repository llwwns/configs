if has("win32")
  set guifont=Fira\ Code:h14
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
  set guifont=Fira\ Code:h14
  set lines=35 columns=118
  set guioptions-=r
  set macligatures
else
  set guifont=Fira\ Code\ 14
endif
if has('mouse')
  set mouse=a
  vmap <RightMouse> y
  nmap <RightMouse> p
endif
