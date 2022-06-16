(require :words)
(local cmp (require :cmp))

(cmp.setup {
  :snippet {
    :expand (fn [args]
      ((-> :luasnip (require) (. :lsp_expand)) args.body))
  }

  :mapping {
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
  }

  :sources [
    { :name "luasnip" }
    { :name "nvim_lsp" }
    { :name "nvim_lua" }
    { :name "path" }
    { :name "buffer" }
    { :name "words" :max_item_count 7 }
  ]
  :preselect cmp.PreselectMode.None
  :formatting {
    :format (fn [entry vim_item]
      (let [lspkind (require :lspkind)]
        (tset vim_item :kind (.. "[" (. lspkind.presets.default vim_item.kind) "] " vim_item.kind))
        vim_item))
  }
  :completion {
    :keyword_length 2
  }
})
