(require-macros :hibiscus.vim)

(when (vim.fn.has "multi_lang")
  (vim.cmd "language C"))

(set! encoding "utf-8")
(set! laststatus 2)
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
  :diff " "
  :eob " "
})
(set! laststatus 3)
(set! exrc true)
(set! secure true)
(set! hidden true)
(set! tags "./tags,tags;/")
(set! spellfile (.. (vim.fn.stdpath "config") "/spell/en.utf-8.add"))
(set! diffopt "internal,filler,algorithm:patience,indent-heuristic,closeoff")

;; (rem! guioptions "e")

(exec [
  ["filetype plugin indent on"]
  ["let $FZF_DEFAULT_COMMAND = 'fd'"]
  ["let $FZF_DEFAULT_OPTS='--layout=reverse'"]
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

(g! "eskk#enable_completion" 1)

(g! extra_whitespace_ignored_filetypes ["calendar"])
(g! EmacsCommandLineSearchCommandLineDisable 1)

(g! indent_blankline_char "│")
(g! indent_blankline_show_current_context true)
(g! vim_json_conceal 0)
(g! vim_markdown_conceal 0)
(g! vim_markdown_conceal_code_blocks 0)

(g! gitgutter_highlight_linenrs 1)
(g! rainbow_active 1)

(g! Illuminate_delay 0)
(g! signify_sign_change "~")

(g! tokyonight_style "night")
(color! tokyonight)

(g! mergetool_layout "LmR")
;; (g! mergetool_prefer_revision "base")
(g! mergetool_prefer_revision "unmodified")
(g! deleft_mapping "<leader>dh")
(g! symbols_outline {
  :position "left"
  :width 16
})
; (set! foldnestmax 3)
(set! foldminlines 1)
; vim.opt.foldtext="getline(v:foldstart).'...'.trim(getline(v:foldend))"
; vim.opt.foldtext [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
(set! foldtext "v:lua.foldtext2()")
; vim.opt.foldcolumn "auto:3"
(set! dictionary "/usr/share/dict/words")
(g! cmp_dictionary_exact 2)
(g! diff_translations 0)
(g! Hexokinase_highlighters "backgroundfull")
