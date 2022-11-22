(require-macros :hibiscus.vim)
(require-macros :utils-macros)

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
(set! swapfile false)
(set! undofile false)

(set! termguicolors true)
(set! fileencodings ["utf-8" "iso-2022-jp" "euc-jp" "sjis" "utf-16" "utf-16le" "gb2312"])
 
(set! shiftwidth 0)
(set! tabstop 2)
(set! softtabstop -1)
(set! shiftwidth 0)
(set! tabstop 2)
(set! softtabstop -1)
(set! expandtab true)
(set! autoindent false)
;; (set! indentkeys "")
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
  :diff "╱"
  :eob " "
})
(set! laststatus 3)
(set! cmdheight 0)
(set! exrc true)
(set! secure true)
(set! hidden true)
;; (set! tags "./tags,tags;/")
(set! spellfile (.. (vim.fn.stdpath "config") "/spell/en.utf-8.add"))
(set! diffopt "internal,filler,algorithm:patience,indent-heuristic,closeoff,linematch:120")

;; (rem! guioptions "e")

;; (vim.cmd "filetype plugin indent on")
  ;; ["let $FZF_DEFAULT_COMMAND = 'fd'"]
  ;; ["let $FZF_DEFAULT_OPTS='--layout=reverse'"]

(vim.fn.sign_define :DiagnosticSignError { :text "" :texthl :DiagnosticSignError})
(vim.fn.sign_define :DiagnosticSignWarn { :text "" :texthl :DiagnosticSignWarn })
(vim.fn.sign_define :DiagnosticSignHint { :text "" :texthl :DiagnosticSignHint })
(vim.fn.sign_define :DiagnosticSignInfo { :text "" :texthl :DiagnosticSignInfo })

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
(color! tokyonight-night)

; (set! foldnestmax 3)
(set! foldminlines 1)
; vim.opt.foldtext="getline(v:foldstart).'...'.trim(getline(v:foldend))"
; vim.opt.foldtext [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
(set! foldtext "v:lua.foldtext2()")
(set! foldcolumn "1")
(set! dictionary "/usr/share/dict/words")
(set! conceallevel 0)

;; guis
(if 
  (= 1 (vim.fn.exists "gnvim" )) (do
    (set! guifont "Iosevka Fixed:h12")
    (set! guicursor (.. vim.o.guicursor ",a:blinkon0")))
  (= 1 (vim.fn.exists "neovide")) (do
  ; vim.g.tokyonighj_transparent = false
    (set! guifont "JetBrainsMono Nerd Font:h10")
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
