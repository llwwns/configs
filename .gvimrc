if has("win32")
  set guifont=CodeM:h14
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set langmenu=none 
  set lines=35 columns=118
"  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
else
  set guifont=CodeM\ 14
endif
if has('mouse')
  set mouse=a
  vmap <RightMouse> y
  nmap <RightMouse> p
endif
