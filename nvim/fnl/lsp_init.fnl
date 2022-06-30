(local lsp (require "lspconfig"))
(local configs (require "lspconfig/configs"))
(local util (require "lspconfig/util"))

(require-macros :hibiscus.vim)
(local null_ls (require "null-ls"))
;;
(fn prettier [] 
  (let [project_local_bin "node_modules/.bin/prettier"
        utils ((-> :null-ls.utils (require) (. :make_conditional_utils)))]
    (when (utils.root_has_file ".prettierrc")
      (null_ls.builtins.formatting.prettier.with {
        :command (if (utils.root_has_file :project_local_bin) project_local_bin "prettier")
        :filetypes [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "sh"
        ]
      }))))

(fn eslint_d [] 
  (null_ls.builtins.diagnostics.eslint_d.with {
    :timeout 15000
    :condition #(or ($1.root_has_file ".eslintrc") ($1.root_has_file ".eslintrc.json"))
  }))

(fn on_attach [client]
   (when (and
     client.resolved_capabilities.document_formatting
     (not (: (vim.regex "\\vfugitive:\\/\\/") :match_str (vim.fn.expand "%"))))
     (vim.cmd "autocmd BufWritePre <buffer> lua lsp_format()"))
    (map! [n :buffer :noremap] "gd" "<cmd>lua vim.lsp.buf.declaration()<CR>")
    (map! [n :buffer :noremap] "<c-]>" "<cmd>lua vim.lsp.buf.definition()<CR>")
    (map! [n :buffer :noremap] "gi" "<cmd>lua vim.lsp.buf.implementation()<CR>")
    (map! [n :buffer :noremap] "gt" "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    (map! [n :buffer :noremap] "gr" "<cmd>lua vim.lsp.buf.references()<CR>")
    ;; (map! [n :buffer :noremap] "gs" "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
    (map! [n :buffer :noremap] "gs" "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
    (map! [n :buffer :noremap] "<leader>rn" "<cmd>Lsp rename<CR>")
    (map! [nv :buffer :noremap] "<leader>da" "<cmd>Lsp codeaction<CR>")
    ((-> :lsp_signature (require) (. :on_attach)) {
      :floating_window false
    }))

(fn on_attach_ts [client]
  (let [root client.config.root_dir
        path (-> :null-ls.utils (require) (. :path))]
    (when (path.exists (path.join root ".prettierrc"))
      (tset client.resolved_capabilities :document_formatting false))
    (on_attach client)))

(fn on_attach_rs [client]
  (on_attach client)
  (augroup! :inlayHint
    [[BufEnter BufWinEnter TabEnter InsertLeave] *.rs
      #((-> :lsp_extensions (require) (. :inlay_hints)) {
        :enabled ["ChainingHint" "TypeHint"]
      })]))
;;
(local capabilities 
    (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
      ((-> :cmp_nvim_lsp (require) (. :update_capabilities)) capabilities)))
;;
(null_ls.setup {
  ;; :debug true
  :sources [
    prettier
    eslint_d
    null_ls.builtins.formatting.stylua
    null_ls.builtins.diagnostics.shellcheck
  ]
  :on_attach on_attach
  :capabilities capabilities
})
;;
(lsp.clangd.setup {
  :on_attach  on_attach_rs
  :capabilities  capabilities
  :cmd [ "clangd" "--background-index" ]
})
;; --
;; -- lsp.ccls.setup {
;; --   on_attach = on_attach_ts,
;; --   capabilities = capabilities,
;; -- }
;;
(lsp.rust_analyzer.setup {
  :on_attach on_attach_rs
  :rust-analyzer.diagnostics.enable true
  :rust-analyzer.checkOnSave.enable true
  :capabilities capabilities
})
;; -- lsp.rls.setup{on_attach=on_attach}
;; -- lsp.solargraph.setup { on_attach = on_attach }
(lsp.tsserver.setup {
  :on_attach on_attach_ts
  :root_dir (lsp.util.root_pattern "package.json")
  :capabilities capabilities
})
(lsp.denols.setup {
  :on_attach on_attach_ts
  :root_dir (lsp.util.root_pattern "deno.json")
  :init_options {
    :lint true
  }
  :settings {
    :deno.unstable true
  }
})

(lsp.vimls.setup { :on_attach on_attach })
(lsp.jsonls.setup { :on_attach on_attach })
(lsp.yamlls.setup { :on_attach on_attach })
(lsp.zls.setup { :on_attach on_attach })
(lsp.gopls.setup {
  :cmd_env { :GOFLAGS "-tags=test_system,test_mysql,wireinject,test_es" }
  :capabilities capabilities
  :codelens {
    :upgrade.dependency false
  }
  :deepCompletion false
  :on_attach on_attach
})
(lsp.erlangls.setup { :on_attach on_attach })

;; (when (not configs.ruby_lsp)
;;   (tset configs :ruby_lsp {
;;     :default_config {
;;       :cmd [ :bundle :exec :ruby-lsp ]
;;       :filetypes [ "ruby" "rbs" ]
;;       :root_dir (util.root_pattern "Gemfile.lock" ".git")
;;     }
;;   })
;;   (tset lsp :ruby_lsp configs.ruby_lsp))
;; (lsp.ruby_lsp.setup { :on_attach on_attach })

;; (when (not configs.steep)
;;   (tset configs :steep {
;;     :default_config {
;;       :cmd [ :steep :langserver ]
;;       :filetypes [ "ruby" "rbs" ]
;;       :root_dir (util.root_pattern "Steepfile" ".git")
;;     }
;;   })
;;   (tset lsp :steep configs.steep))
;; (lsp.steep.setup { :on_attach on_attach })

(fn _G.stop_lsp []
   (vim.lsp.stop_client (vim.lsp.get_active_clients)))

(tset vim.lsp.handlers :textDocument/publishDiagnostics: 
  (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics {
    :update_in_insert false
  }))

(lsp.tailwindcss.setup {})
(lsp.hls.setup {})
