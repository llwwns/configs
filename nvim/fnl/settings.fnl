(require-macros :hibiscus.vim)

;; (when (vim.fn.has "multi_lang")
;;   (vim.cmd "language C"))

(set! encoding "utf-8")
;; (set! winblend 20)
;; (set! pumblend 20)
(set! timeoutlen 500)
(set! spell true)
(set! spelloptions "camel")
(set! spellcapcheck "")
(set! hlsearch true)
(set! number true)
(set! relativenumber true)
(set! background "dark")
(set! colorcolumn "100")
;; set backspace to delete indent, endo of line and before insert start
(set! backspace ["indent" "eol" "start"])
;; allow cursor go to next line
(set! whichwrap "b,s,<,>,[,]")
(set! noswapfile)
(set! noundofile)

(set! termguicolors true)
(set! fileencodings ["utf-8" "iso-2022-jp" "euc-jpsjis" "utf-16" "utf-16le" "gb2312"])
 
(set! shiftwidth 0)
(set! tabstop 2)
(set! softtabstop -1)
(set! shiftwidth 0)
(set! tabstop 2)
(set! softtabstop -1)
(set! expandtab true)
(set! autoindent false)
(set! updatetime 1000)
(set! signcolumn "yes")
(set! inccommand "nosplit")
(set! formatoptions (- vim.opt.formatoptions ["c" "r" "o"]))
(set! foldmethod "indent")
(set! foldlevel 18)

(set! grepprg "rg --vimgrep")
(set! wrap false)
(set! display "lastline")
(set! pumheight 10)
(set! list true)
(set! listchars { :eol "¬" :tab "| " :extends "»" :precedes "«" })
(set! completeopt "menuone,noselect")
(set! shortmess "atToOFcA")
(set! sessionoptions ["blank" "curdir" "folds" "tabpages"])
(set! fillchars {
  :horiz "─"
  :horizup "┴"
  :horizdown "┬"
  :vert "│"
  :vertleft "┤"
  :vertright "├"
  :verthoriz "┼"
  :fold " "
  :foldopen ""
  :foldclose ""
  :diff " "
  :eob " "
})
(set! laststatus 3)
(set! cmdheight 0)
(set! exrc true)
(set! secure true)
(set! hidden true)
;; (set! tags "./tags,tags;/")
(set! spellfile (.. (vim.fn.stdpath "config") "/spell/en.utf-8.add"))
(set! diffopt "internal,filler,algorithm:patience,indent-heuristic,closeoff")

;; (rem! guioptions "e")

(exec [
  ["filetype plugin indent on"]
  ;; ["let $FZF_DEFAULT_COMMAND = 'fd'"]
  ;; ["let $FZF_DEFAULT_OPTS='--layout=reverse'"]
  ["sign define LspDiagnosticsSignError text=✗ texthl=ALEErrorSign linehl= numhl="]
  ["sign define LspDiagnosticsSignWarning text=! texthl=ALEWarningSign linehl= numhl="]
  ["sign define LspDiagnosticsSignInformation text=i texthl=ALEInfoSign linehl= numhl="]
  ["sign define LspDiagnosticsSignHint text=💡 texthl=Label linehl= numhl="]
])

(g! mapleader "'")
(g! maplocalleader "'")

(g! vim_json_syntax_conceal 0)
(g! "eskk#large_dictionary" {
  :path "~/configs/SKK-JISYO.L"
  :sorted 1
  :encoding "euc-jp"
})

(g! vim_json_conceal 0)
(g! vim_markdown_conceal 0)
(g! vim_markdown_conceal_code_blocks 0)

(g! tokyonight_style "night")
(color! tokyonight)

; (set! foldnestmax 3)
(set! foldminlines 1)
; vim.opt.foldtext="getline(v:foldstart).'...'.trim(getline(v:foldend))"
; vim.opt.foldtext [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
(set! foldtext "v:lua.foldtext2()")
(set! foldcolumn "1")
(set! dictionary "/usr/share/dict/words")

;; guis
(if 
  (= 1 (vim.fn.exists "gnvim" )) (do
    (set! guifont "Iosevka Fixed:h12")
    (set! guicursor (.. vim.o.guicursor ",a:blinkon0")))
  (= 1 (vim.fn.exists "neovide")) (do
  ; vim.g.tokyonight_transparent = false
    (set! guifont "JetBrains Mono Slashed Light:h10.5")
  ; set guifont=Iosevka\ Term,Sarasa\ Nerd\ Font:h17
    ;; (g! neovide_cursor_animation_length 0.05)
    (g! neovide_cursor_animation_length 0)
    (g! neovide_cursor_trail_length 0.1)
    (g! neovide_scroll_animation_length 0)

    ;; (set! cmdheight 1)
    (set! mouse "a")
    (map! [n :noremap] "<A-CR>"
      "<cmd>execute('let g:neovide_fullscreen = !g:neovide_fullscreen')<CR>"))
    (map! [t :noremap] "<c-s-v>" "<c-\\><c-n>\"+pa")
  (= 1 (vim.fn.exists "g:fvim_loaded")) (do
  ; FVimBackgroundOpacity 0.7
    (set! guifont "Sarasa Nerd Font:h18")))
  ; nnoremap <A-CR> :FVimToggleFullScreen<CR>
   ; (cmd! hi Normal guibg=NONE ctermbg=NONE))
