(local lsp (require "lspconfig"))
(local configs (require "lspconfig/configs"))
(local util (require "lspconfig/util"))
(local navic (require "nvim-navic"))
(local null-ls (require "null-ls"))

(require-macros :utils-macros)
(require-macros :hibiscus.vim)
;;
(fn prettierd [] 
  (let [project_local_bin "node_modules/.bin/prettier"
        utils (require-fun :null-ls.utils#make_conditional_utils)]
    (when (utils.root_has_file ".prettierrc")
      (null-ls.builtins.formatting.prettierd.with {
        ;; :command (if (utils.root_has_file :project_local_bin) project_local_bin "prettier")
        :filetypes [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "sh"
        ]
      }))))

;; (fn eslint_d [] 
;;   (null-ls.builtins.diagnostics.eslint_d.with {
;;     :timeout 15000
;;     :condition #(or ($1.root_has_file ".eslintrc") ($1.root_has_file ".eslintrc.json"))
;;   }))

(fn on_attach [client bufnr]
  (when (and
    client.server_capabilities.documentFormattingProvider
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

	(vim.api.nvim_buf_set_option bufnr "formatexpr" "v:lua.vim.lsp.formatexpr()")
	(vim.api.nvim_buf_set_option bufnr "omnifunc" "v:lua.vim.lsp.omnifunc")
	(vim.api.nvim_buf_set_option bufnr "tagfunc" "v:lua.vim.lsp.tagfunc")

  (require-fun :lsp_signature#on_attach {
    :floating_window false
  })
  (when client.server_capabilities.documentSymbolProvider
    (let [win (vim.api.nvim_get_current_win)
          buf (vim.api.nvim_win_get_buf win)]
      (navic.attach client bufnr)
      (when (= buf bufnr) (_G.WindLine.on_win_enter))))
  (when (not _G.lsp_clients) (tset _G :lsp_clients {}))
  (tset _G.lsp_clients bufnr client))

(fn on_attach_ts [client bufnr]
  (let [root client.config.root_dir
        path (-> :null-ls.utils (require) (. :path))]
    (when (path.exists (path.join root ".prettierrc"))
      (tset client.server_capabilities :documentFormattingProvider false))
    (on_attach client bufnr)))

(fn on_attach_eslint [client bufnr]
    (tset client.server_capabilities :documentFormattingProvider false)
    (on_attach client bufnr))

(fn on_attach_rs [client bufnr]
  (on_attach client bufnr)
  (augroup! :inlayHint
    [[BufEnter BufWinEnter TabEnter InsertLeave] *.rs
      #((-> :lsp_extensions (require) (. :inlay_hints)) {
        :enabled ["ChainingHint" "TypeHint"]
      })]))

(local capabilities (require-fun :cmp_nvim_lsp#default_capabilities))

(null-ls.setup {
  ;; :debug true
  :sources [
    prettierd
    ;; eslint_d
    ;; null-ls.builtins.code_actions.gitsigns
    null-ls.builtins.formatting.stylua
    null-ls.builtins.diagnostics.shellcheck
  ]
  :on_attach on_attach
  :capabilities capabilities
})
;;
(lsp.clangd.setup {
  :filetypes [:c :cpp :objc :objcpp :cuda]
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
  :single_file_support false
  :on_attach on_attach_ts
  :root_dir (lsp.util.root_pattern "deno.json")
  :init_options {
    :lint true
  }
  :settings {
    :deno.unstable true
  }
  :capabilities capabilities
})

(lsp.vimls.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.jsonls.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.cssls.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.html.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.yamlls.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.eslint.setup {
  :on_attach on_attach_eslint
  :root_dir (lsp.util.root_pattern "package.json")
  :capabilities capabilities
})
(lsp.zls.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.gopls.setup {
  :cmd_env { :GOFLAGS "-tags=debug,test_mysql,wireinject,test_es" }
  :capabilities capabilities
  :codelens {
    :upgrade.dependency false
  }
  :deepCompletion false
  :on_attach on_attach
})
(lsp.erlangls.setup {
  :on_attach on_attach
  :capabilities capabilities
})

(lsp.tailwindcss.setup {
  :on_attach on_attach
  :capabilities capabilities
})
(lsp.hls.setup {
  :on_attach on_attach
  :capabilities capabilities
 })

(lsp.marksman.setup {
  :on_attach on_attach
  :capabilities capabilities
})

(lsp.fennel-ls.setup {
  :on_attach on_attach
  :capabilities capabilities
})

(lsp.elixirls.setup {
  :cmd [ "elixir-ls" ]
  :on_attach on_attach
  :capabilities capabilities
})

(lsp.sumneko_lua.setup {
  :on_attach on_attach
  :capabilities capabilities
  :runtime {
    :version "LuaJIT"
  }
  :diagnostics {
    :globals ["vim"]
  }
  :workspace {
    :library (vim.api.nvim_get_runtime_file ""  true)
  }
  ;; Do not send telemetry data containing a randomized but unique identifier
  :telemetry {
    :enable false
  }
  :root_dir #(or (util.find_git_ancestor $1) (util.path.dirname $1))
})

;; (when (not configs.ruby_lsp)
;;   (tset configs :ruby_lsp {
;;     :default_config {
;;       :cmd [ :bundle :exec :ruby-lsp ]
;;       :filetypes [ "ruby" ]
;;       :root_dir (util.root_pattern "Gemfile.lock" ".git")
;;       :initializationOptions { :enabledFeatures ["documentSymbols"] }
;;     }
;;   })
;;   (tset lsp :ruby_lsp configs.ruby_lsp))
;; (lsp.ruby_lsp.setup {
;;   :on_attach on_attach
;;   :capabilities capabilities
;; })

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
