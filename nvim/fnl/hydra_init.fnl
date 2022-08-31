(require-macros :hibiscus.vim)
(require-macros :utils-macros)
(local Hydra (require :hydra))

(Hydra {
  :name "Side scroll"
  :mode "n"
  :body "z"
  :heads [
    [ "h" "5zh" ]
    [ "l" "5zl" { :desc "←/→" } ]
    [ "H" "zH" ]
    [ "L" "zL" { :desc "half screen ←/→" } ]
  ]
})

(Hydra {
  :name "window control"
  :mode ["n" "v" "i" "t"]
  :body "<c-w>"
  :heads [
    ;; [ "h" "<c-w>h" ]
    ;; [ "H" "<c-w>H" ]
    ;; [ "l" "<c-w>l" ]
    ;; [ "L" "<c-w>L" ]
    ;; [ "j" "<c-w>j" ]
    ;; [ "J" "<c-w>J" ]
    ;; [ "k" "<c-w>k" ]
    ;; [ "K" "<c-w>K" ]
    [ "<" "5<c-w><" ]
    [ ">" "5<c-w>>" ]
    [ "+" "5<c-w>+" ]
    [ "-" "5<c-w>-" ]
    ;; [ "=" "<c-w>=" ]
    ;; [ "s" "<c-w>s" ]
    ;; [ "v" "<c-w>v" ]
    ;; [ "q" "<c-w>q" ]
  ]
})

;; (g! mapleader "'")
;; (g! maplocalleader "'")
;;
;; (Hydra {
;;   :name "vimspector"
;;   :mode ["n"]
;;   :body "<leader>d"
;;   :config {
;;     :color "pink"
;;   }
;;   :heads [
;;     ["c" "<Plug>VimspectorContinue"]
;;     ["r" "<Plug>VimspectorRunToCursor"]
;;     ["o" "<Plug>VimspectorStepOver"]
;;     ["i" "<Plug>VimspectorStepInto"]
;;     ["O" "<Plug>VimspectorStepOut"]
;;     ["b" "<Plug>VimspectorToggleBreakpoint"]
;;     ["x" "<Plug>VimspectorToggleConditionalBreakpoint"]
;;   ]
;; })
(Hydra {
  :name "dap"
  :mode ["n"]
  :body "<leader>d"
  :config {
    :color "pink"
  }
  :heads [
    ["b" #(require-fun :dap#toggle_breakpoint)]
    ["B" #(require-fun :dap#set_breakpoint (vim.fn.input "Breakpoint condition: "))]
    ["c" #(require-fun :dap#continue)]
    ["n" #(require-fun :dap#step_over)]
    ["i" #(require-fun :dap#step_into)]
    ["o" #(require-fun :dap#step_out)]
  ]
})
