;; (import-macros {: map!}    :hibiscus.vim)
(require-macros :hibiscus.vim)

;; (macro require-fun [name fun ...] 
;;   `(let [mod# (require ,name)] ((. mod# ,fun) ,...)))
(macro require-fun [name fun ...] 
  `((-> ,name (require) (. ,fun)) ,...))

(macro map_pairs [k cmd]
  (let [ku (k:gsub "." string.upper)
        k1 (.. "]" k)
        k2 (.. "[" k)
        k3 (.. "]" ku)
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


(map! [n] "Q" "<nop>")

(map! [n :verbose] "<c-q>" "<cmd>q<CR>")

(map! [n :verbose] "<c-e>" 
  #(require-fun :telescope.builtin :buffers { :sort_lastused true :sort_mru true }))

(map! [n :verbose] "<c-p>" 
  #(require-fun :telescope.builtin :find_files))

(map! [n :verbose] "<leader><tab>" 
  #(require-fun :nvim-tree :toggle true))

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

(map! [nv] "<leader>w" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_words { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nv] "<leader>b" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_words { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nv] "<leader>e" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns { 
    "direction" hint.HintDirection.AFTER_CURSOR } "\\w\\>")))

(map! [nv] "<leader>ge" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_patterns { 
    "direction" hint.HintDirection.BEFORE_CURSOR } "\\w\\>")))

(map! [nv] "<leader>f" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_char1 { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nv] "<leader>F" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_char1 { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nv] "<leader>j" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_lines { 
    "direction" hint.HintDirection.AFTER_CURSOR })))

(map! [nv] "<leader>k" 
  #(let [hop (require :hop) hint (require "hop.hint")] (hop.hint_lines { 
    "direction" hint.HintDirection.BEFORE_CURSOR })))

(map! [nv] "s" 
  #(require-fun :hop :hint_char2))

(map! [o] "z" 
  #(require-fun :hop :hint_char2))

(map! [n :noremap] "<leader>a" "<cmd>ArgWrap<CR>")
(map! [c] "w!!" "w suda://%")
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
(map! [n :noremap] "+" "<C-a>")
(map! [n :noremap] "-" "<C-x>")
(map! [n] "<C-\\>" ":tab split<CR>:exec('tag '.expand('<cword>'))<CR>")


(map! [nt :noremap] "<c-s>" #(require-fun :FTerm :toggle))

; vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
; vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { noremap = true })
; vim.api.nvim_set_keymap("n", "<leader>dn", "<cmd>lua require'dap'.next()<CR>", { noremap = true })
; vim.api.nvim_set_keymap("n", "<leader>di", "<cmd>lua require'dap'.into()<CR>", { noremap = true })

(map! [n :noremap] "<leader>gs" "<cmd>Neogit<CR>")

(map! [n :noremap] "<leader>tf" _G.toggle_format)

;; Navigation
(map! [n :expr] "]c" "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'")
(map! [n :expr] "[c" "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'")

;; Actions
(map! [n] "<leader>hs"
  #(require-fun :gitsigns :stage_hunk))

(map! [n] "<leader>hr"
  #(require-fun :gitsigns :reset_hunk))

(map! [v] "<leader>hs"
  #(require-fun :gitsigns :stage_hunk))

(map! [v] "<leader>hr"
  #(require-fun :gitsigns :reset_hunk))

(map! [n] "<leader>hS"
  #(require-fun :gitsigns :stage_buffer))

(map! [n] "<leader>hu"
  #(require-fun :gitsigns :undo_stage_hunk))

(map! [n] "<leader>hR"
  #(require-fun :gitsigns :reset_buffer))

(map! [n] "<leader>hp"
  #(require-fun :gitsigns :preview_hunk))

(map! [n] "<leader>hb"
  #(require-fun :gitsigns :blame_line { :full true }))

(map! [n] "<leader>tb"
  #(require-fun :gitsigns :toggle_current_line_blame))

(map! [n] "<leader>hd" "<cmd>Gdiff<CR>")

(map! [n] "<leader>hD"
  #(require-fun :gitsigns :diffthis "~"))

(map! [n] "<leader>td"
  #(require-fun :gitsigns :toggle_deleted))

(map! [n] "crp" "crcvU")
(map! [n] "]d" vim.diagnostic.goto_next)
(map! [n] "[d" vim.diagnostic.goto_prev)

(map! [n] "<leader>dq" vim.diagnostic.setqflist)
(map! [n] "<leader>dl" vim.diagnostic.setloclist)
(map! [t :noremap] "<c-'><c-[>" "<c-\\><c-n>")
(map_pairs "a" "")
(map_pairs "t" "tab")
(map_pairs "q" "c")
(map_pairs "l" "l")
(map_pairs "b" "b")


(map! [n :verbose] "<leader>ps" "<cmd>PackerSync<CR>")
(map! [n :verbose] "<leader>pc" "<cmd>PackerCompile<CR>")
(map! [n :verbose] "<leader>sc" "<cmd>source ~/.config/nvim/init.lua<CR>")

(map! [n] "<leader>db" "<Plug>VimspectorContinue")
(map! [n] "<leader>dc" "<Plug>VimspectorRunToCursor")
(map! [n] "<leader>sn" "<Plug>VimspectorStepOver")
(map! [n] "<leader>si" "<Plug>VimspectorStepInto")
(map! [n] "<leader>so" "<Plug>VimspectorStepOut")
(map! [n] "<leader>tb" "<Plug>VimspectorToggleBreakpoint")
(map! [n] "<leader>tcb" "<Plug>VimspectorToggleConditionalBreakpoint")

(map! [n :noremap] "<leader>rp" _G.replace)