(require :words)
(require-macros :utils-macros)
(local cmp (require :cmp))

(local mapping (cmp.mapping.preset.insert {
  :<C-p> (cmp.mapping.select_prev_item)
  :<C-n> (cmp.mapping.select_next_item)
  :<C-u> (cmp.mapping.scroll_docs -4)
  :<C-d> (cmp.mapping.scroll_docs 4)
  :<C-Space> (cmp.mapping.complete)
  :<C-e> (cmp.mapping.close)
  :<C-y> (cmp.mapping.confirm {
    :behavior cmp.ConfirmBehavior.Insert
    :select true
  })
}))

(cmp.setup {
  :snippet {
    :expand (fn [args]
      ((-> :luasnip (require) (. :lsp_expand)) args.body))
  }

  :mapping mapping

  :window  {
    :completion {
      :winhighlight "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
      :col_offset -3
      :side_padding 0
    }
    :documentation (cmp.config.window.bordered {:border :single})
  }

  :sources [
    { :name "nvim_lsp_signature_help" }
    { :name "luasnip" }
    { :name "nvim_lsp" }
    { :name "nvim_lua" }
    { :name "path" }
    { :name "buffer" }
    { :name "words" :max_item_count 7 }
  ]
  :preselect cmp.PreselectMode.None
  :formatting {
    :fields ["kind" "abbr" "menu"]
    :format (fn [entry vim_item]
      (let [kind ((require-fun :lspkind#cmp_format { :mode "symbol_text" :maxwidth 50 })  entry vim_item)
              strings (vim.split kind.kind "%s+" { :trimempty true })]
        (tset kind :kind (.. " "  (. strings 1) " "))
        (tset kind :menu (.. "    (" (. strings 2) ")"))
        kind))
    }
  :completion {
    :keyword_length 2
  }
})

(cmp.setup.cmdline "/" {
  :mapping (cmp.mapping.preset.cmdline)
  :sources [
    { :name "buffer" }
  ]
})

(cmp.setup.cmdline ":" {
  :mapping (cmp.mapping.preset.cmdline)
  :sources [
    { :name "path" }
    { :name "cmdline" }
  ]
})

