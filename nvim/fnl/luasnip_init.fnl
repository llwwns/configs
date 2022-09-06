(require-macros :hibiscus.vim)
(local ls (require "luasnip"))
(local snippet ls.snippet)
(local text-node ls.text_node)
(local snippet-node ls.snippet_node)
(local isn ls.indent_snippet_node)
(local i ls.insert_node)
(local f ls.function_node)
(local c ls.choice_node)
(local dynamic-node ls.dynamic_node)
(local events (require "luasnip.util.events"))
(local l (. (require "luasnip.extras") :l))
(local postfix (. (require "luasnip.extras.postfix") :postfix))

(macro add-snippets [name ...] 
  `(ls.add_snippets ,name [,...]))

(macro s [name ...] 
  `(snippet ,name [,...]))

(macro t [...] 
  `(text-node [,...]))

(macro d [pos ...]
  `(dynamic-node ,pos #(do ,...)))

(macro sn [pos ...]
  `(snippet-node ,pos [,...]))

(add-snippets "go"
  (s "err"
    (t
      "if err != nil {"
      "	return ")
    (i 0)
    (t "" "}"))
  (s "erris"
    (t "errors.Is(")
    (i 1 "err")
    (t ", ")
    (i 2)
    (t ")")
    (i 0))
  (s "wrap"
    (t "errors.Wrap(err, \"")
    (i 0)
    (t "\")"))
  (postfix ".wrap"
    (d 1 (sn nil
         (t (.. "errors.Wrap(" $2.env.POSTFIX_MATCH ", \""))
         (i 1)
         (t "\")"))))
  (postfix ".make"
    (d 1 (sn nil
         (t (.. $2.env.POSTFIX_MATCH " = make("))
         (i 1)
         (t ")"))))
  (s "for"
    (t "for ")
    (i 1)
    (t ", ")
    (i 2)
    (t " := range ")
    (i 3)
    (t " {" "	")
    (i 0)
    (t "" "}")))
(add-snippets "cpp"
  (s "main"
    (t "#include<iostream>"
       ""
       "using namespace std;"
       ""
       "int main() {"
       "    ")
    (i 0)
    (t ""
       "}"))
  (s "leetcode"
    (t "#include<iostream>"
       "#include<algorithm>"
       "#include<vector>"
       "#include<stack>"
       "#include<array>"
       "#include<queue>"
       ""
       "using namespace std;"
       ""
       "")
    (i 0)
    (t ""
       ""
       "int main() {"
       "    "
       "}"))
    (postfix ".sort"
      (d 1 (sn nil
           (t (.. "sort(" $2.env.POSTFIX_MATCH ".begin(), "$2.env.POSTFIX_MATCH ".end());"))))))
;;
;; local t = function(str)
;;   return vim.api.nvim_replace_termcodes(str, true, true, true)
;; end
;;
;; local check_back_space = function()
;;   local col = vim.fn.col "." - 1
;;   if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
;;     return true
;;   else
;;     return false
;;   end
;; end
;;
;; -- _G.tab_complete = function()
;; --   if vim.fn.pumvisible() then
;; --     return t "<C-n>"
;; --   elseif ls.expand_or_jumpable() then
;; --     return t "<Plug>luasnip-expand-or-jump"
;; --   elseif check_back_space() then
;; --     return t "<Tab>"
;; --   end
;; -- end
;; -- _G.s_tab_complete = function()
;; --   if vim.fn.pumvisible() then
;; --     return t "<C-p>"
;; --   elseif ls.jumpable(-1) then
;; --     return t "<Plug>luasnip-jump-prev"
;; --   else
;; --     return t "<S-Tab>"
;; --   end
;; -- end
;; -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
;; -- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
;; -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
;; -- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
(map! [i] "<c-l>" "<Plug>luasnip-expand-or-jump")
(map! [s] "<c-l>" "<Plug>luasnip-expand-or-jump")
(map! [i] "<c-k>" "<Plug>luasnip-jump-prev")
(map! [s] "<c-k>" "<Plug>luasnip-jump-prev")
;; (map! [i] "<C-E>" "<Plug>luasnip-next-choice")
;; (map! [s] "<C-E>" "<Plug>luasnip-next-choice")
