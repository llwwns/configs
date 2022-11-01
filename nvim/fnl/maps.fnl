(require-macros :hibiscus.vim)
(require-macros :utils-macros)

(macro map_pairs [k cmd]
  (let [ku (k:gsub "." string.upper)
        k1 (.. "]" k)
        k2 (.. "[" k)
        k3 (.. "[" ku)
        k4 (.. "]" ku)
        
        c1 (.. "<cmd>" cmd "next<CR>")
        c2 (.. "<cmd>" cmd "previous<CR>")
        c3 (.. "<cmd>" cmd "first<CR>")
        c4 (.. "<cmd>" cmd "last<CR>")]
  `(do
      (map! [n] ,k1 ,c1)
      (map! [n] ,k2 ,c2)
      (map! [n] ,k3 ,c3)
      (map! [n] ,k4 ,c4))))

(g! :mapleader "'")
(g! :maplocalleader "'")


;; (map! [n] "Q" "<nop>")
;; (map! [n] "q" "<nop>")
;; (map! [n :noremap] "q:" "q:")
;; (map! [n :noremap] "q/" "q/")
;; (map! [n :noremap] "Q" "Q")
;; (map! [n :noremap] "<leader>q" "q")

(map! [n :verbose] "<c-q>" "<cmd>q<CR>")

(map! [n] "<c-e>" 
  #(when (~= (vim.fn.win_gettype) "command")
    (require-fun :telescope.builtin#buffers { :sort_lastused true :sort_mru true })))

(map! [n] "<c-p>" 
  #(when (~= (vim.fn.win_gettype) "command")
    (require-fun :telescope.builtin#find_files)))

(map! [n] "<leader>sw" 
  #(when (~= (vim.fn.win_gettype) "command")
    (require-fun :telescope.builtin#git_branches)))

;; (map! [n :verbose] "<leader><tab>" 
;;   #(require-fun :nvim-tree :toggle true))
(map! [n :verbose] "<leader><tab>" "<cmd>Neotree toggle reveal=true<CR>")

(map! [nv :verbose :noremap :expr] "k" "v:count == 0 ? 'gk' : 'k'")
(map! [nv :verbose :noremap :expr] "j" "v:count == 0 ? 'gj' : 'j'")

(map! [n :noremap] "<PageUp>" "<c-u>")
(map! [n :noremap] "<PageDown>" "<c-d>")

(map! [n :noremap] "<up>" "<c-y>")
(map! [n :noremap] "<down>" "<c-e>")
(map! [n :noremap] "<left>" "zH")
(map! [n :noremap] "<right>" "zL")

(map! [n :noremap] "<c-f>" ":Sub/")

(map! [ni] "<c-w>z" "<cmd>NeoZoomToggle<CR>")

(map! [nvo] "<leader>w" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_words { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nvo] "<leader>b" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_words { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nvo] "<leader>e" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns { 
    "direction" hint.HintDirection.AFTER_CURSOR } "\\w\\>")))

(map! [nvo] "<leader>ge" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns { 
    "direction" hint.HintDirection.BEFORE_CURSOR } "\\w\\>")))

(map! [nvo] "<leader>f" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_char1 { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nvo] "<leader>F" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_char1 { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nvo] "<leader>j" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_lines { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nvo] "<leader>k" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_lines { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nvo] "<leader>'" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns {} "[\"']")))

(map! [nvo] "<leader>[" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns {} "[\\[(<{]")))

(map! [nvo] "<leader>]" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns {} "[\\])>}]")))

(map! [nvo] "s" 
  #(require-fun :hop#hint_char2))

(map! [o] "z" 
  #(require-fun :hop#hint_char2))

(map! [n :noremap] "<leader>a" "<cmd>ArgWrap<CR>")
(map! [c] "w!!" ":SudaWrite")
(map! [n] "<Leader>m" "<Plug>(git-messenger)")

(map! [n] "[," ":Tab /,<CR>")
(map! [v] "[," ":'<,'>Tab /,<CR>")

(map! [n] "<Leader>t" ":Ttoggle<CR>")

(map! [v] "<Leader>r" ":TREPLSendSelection<CR>")

(map! [n] "<leader>u" "<cmd>UndotreeToggle<CR>")

;; (map! [t :noremap] "<C-[><C-[>" "<C-\\><C-n>")
;; (map! [t :noremap] "<A-h>" "<C-\\><C-n><C-w>h")
;; (map! [t :noremap] "<A-j>" "<C-\\><C-n><C-w>j")
;; (map! [t :noremap] "<A-k>" "<C-\\><C-n><C-w>k")
;; (map! [t :noremap] "<A-l>" "<C-\\><C-n><C-w>l")
;; (map! [n :noremap] "<A-h>" "<C-w>h")
;; (map! [n :noremap] "<A-j>" "<C-w>j")
;; (map! [n :noremap] "<A-k>" "<C-w>k")
;; (map! [n :noremap] "<A-l>" "<C-w>l")

(map! [n :noremap] "K" _G.showDocumentation)
(map! [n] "<C-\\>" ":tab split<CR>:exec('tag '.expand('<cword>'))<CR>")


(map! [nt :noremap] "<c-s>" #(require-fun :FTerm#toggle))

(map! [n :noremap] "<leader>gs" "<cmd>Neogit<CR>")

(map! [n :noremap] "<leader>tf" _G.toggle_format)

;; Navigation
(map! [n :expr :noremap] "]c" #(if vim.wo.diff "]c"
  "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<CR>"))
(map! [n :expr :noremap] "[c" #(if vim.wo.diff "[c"
  "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<CR>"))

;; Actions
(map! [nv] "<leader>hs" #(require-fun :gitsigns#stage_hunk))
(map! [nv] "<leader>hr" #(require-fun :gitsigns#reset_hunk))
(map! [n] "<leader>hS" #(require-fun :gitsigns#stage_buffer))
(map! [n] "<leader>hu" #(require-fun :gitsigns#undo_stage_hunk))
(map! [n] "<leader>hR" #(require-fun :gitsigns#reset_buffer))
(map! [n] "<leader>hp" #(require-fun :gitsigns#preview_hunk))
(map! [n] "<leader>hb" #(require-fun :gitsigns#blame_line { :full true }))
(map! [n] "<leader>tb" #(require-fun :gitsigns#toggle_current_line_blame))
(map! [n] "<leader>td" #(require-fun :gitsigns#toggle_deleted))
(map! [n] "<leader>hD" #(require-fun :gitsigns#diffthis "~"))
(map! [n] "<leader>hd" "<cmd>Gdiff<CR>")

(map! [n] "crp" "crcvU")
(map! [n] "]d" vim.diagnostic.goto_next)
(map! [n] "[d" vim.diagnostic.goto_prev)

(map! [n] "<leader>dq" vim.diagnostic.setqflist)
(map! [n] "<leader>dl" vim.diagnostic.setloclist)
(map_pairs "a" "")
(map_pairs "t" "tab")
(map_pairs "q" "c")
(map_pairs "l" "l")
(map_pairs "b" "b")
(map! [n] "]w" #(require-fun :illuminate#goto_next_reference))
(map! [n] "[w" #(require-fun :illuminate#goto_prev_reference))
(map! [i :noremap] "<c-a>" "<home>")
(map! [i :noremap] "<c-e>" "<end>")


(map! [n :verbose] "<leader>ps" "<cmd>PackerSync<CR>")
(map! [n :verbose] "<leader>pc" "<cmd>PackerCompile<CR>")
(map! [n :verbose] "<leader>sc" "<cmd>source ~/.config/nvim/init.lua<CR>")

;; (map! [n] "<leader>db" "<Plug>VimspectorContinue")
;; (map! [n] "<leader>dc" "<Plug>VimspectorRunToCursor")
;; (map! [n] "<leader>sn" "<Plug>VimspectorStepOver")
;; (map! [n] "<leader>si" "<Plug>VimspectorStepInto")
;; (map! [n] "<leader>so" "<Plug>VimspectorStepOut")
;; (map! [n] "<leader>tb" "<Plug>VimspectorToggleBreakpoint")
;; (map! [n] "<leader>tcb" "<Plug>VimspectorToggleConditionalBreakpoint")

;; (map! [n :noremap] "<leader>db" #(require-fun :dap#toggle_breakpoint))
;; (map! [n :noremap] "<leader>dc" #(require-fun :dap#continue))
;; (map! [n :noremap] "<leader>dn" #(require-fun :dap#step_over))
;; (map! [n :noremap] "<leader>di" #(require-fun :dap#step_into))
;; (map! [n :noremap] "<leader>do" #(require-fun :dap#step_out))


(map! [n :noremap] "<leader>rp" _G.replace)
(map! [v :noremap] "P" "\"0p")
(map! [t :noremap] "<c-\\><c-v>" "<c-\\><c-n>\"+pa")
;;
;; (map! [n] "zR" #(require-fun "ufo#openAllFolds"))
;; (map! [n] "zM" #(require-fun "ufo#closeAllFolds"))

(map! [n :noremap] "<C-a>"  "<Plug>(dial-increment)")
(map! [n :noremap] "<C-x>"  "<Plug>(dial-decrement)")
(map! [v :noremap] "<C-a>"  "<Plug>(dial-increment)")
(map! [v :noremap] "<C-x>"  "<Plug>(dial-decrement)")
(map! [v :noremap] "g<C-a>" "g<Plug>(dial-increment)")
(map! [v :noremap] "g<C-x>" "g<Plug>(dial-decrement)")

(map! [n] "g<" #(require-fun :iswap#iswap_node_with :left))
(map! [n] "g>" #(require-fun :iswap#iswap_node_with :right))
(map! [nx] "<leader>s" #(require-fun :iswap#iswap_node_with))

(map! [n :noremap] "gp" "`[v`]")
