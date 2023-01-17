(local insx (require :insx))
(local esc insx.helper.regex.esc)
(local endwise (require :insx.recipe.endwise))

;; ;; Endwise (experimental).
;; (insx.add :<CR> (endwise.recipe endwise.builtin))

;; Quotes
(each [open close (pairs {"'" "'" "\"" "\"" "`" "`"})]
  (insx.add open
            ((require :insx.recipe.auto_pair) {: open
                                               : close
                                               :ignore_pat "\\\\\\%#"}))
  (insx.add close
            ((require :insx.recipe.jump_next) {:jump_pat [(.. "\\%#"
                                                              (esc close)
                                                              "\\zs")]}))
  (insx.add :<BS>
            ((require :insx.recipe.delete_pair) {:open_pat (esc open)
                                                 :close_pat (esc close)})))

;; Pairs.
(each [open close (pairs {"(" ")" "[" "]" "{" "}"})]
  ;; Auto pair.
  (insx.add open ((require :insx.recipe.auto_pair) {: open : close}))
  ;; Jump next.
  (insx.add close
            ((require :insx.recipe.jump_next) {:jump_pat [(.. "\\%#"
                                                              (esc close)
                                                              "\\zs")]}))
  ;; Delete pair.
  (insx.add :<BS>
            ((require :insx.recipe.delete_pair) {:open_pat (esc open)
                                                 :close_pat (esc close)}))
  ;; Increase/decrease spacing.
  (insx.add :<Space>
            ((. (require :insx.recipe.pair_spacing) :increase) {:open_pat (esc open)
                                                                :close_pat (esc close)}))
  (insx.add :<BS>
            ((. (require :insx.recipe.pair_spacing) :decrease) {:open_pat (esc open)
                                                                :close_pat (esc close)}))
  ;; Break pairs: `(|)` -> `<CR>` -> `(<CR>|<CR>)`
  (insx.add :<CR>
            ((require :insx.recipe.fast_break) {:open_pat (esc open)
                                                :close_pat (esc close)}))
  ;; Wrap next token: `(|)func(...)` -> `)` -> `(func(...)|)`
  (insx.add "<C-;>" ((require :insx.recipe.fast_wrap) {: close})))

;; Remove HTML Tag: `<div>|</div>` -> `<BS>` -> `|`
(insx.add :<BS>
          ((require :insx.recipe.delete_pair) {:open_pat insx.helper.search.Tag.Open
                                               :close_pat insx.helper.search.Tag.Close}))

;; Break HTML Tag: `<div>|</div>` -> `<BS>` -> `<div><CR>|<CR></div>`
(insx.add :<CR>
          ((require :insx.recipe.fast_break) {:open_pat insx.helper.search.Tag.Open
                                              :close_pat insx.helper.search.Tag.Close}))
