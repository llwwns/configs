(tset ((-> :nvim-treesitter.parsers (require) (. :get_parser_configs))) :cue {
  :install_info {
    :url "https://github.com/eonpatapon/tree-sitter-cue" ; local path or git repo
    :files ["src/parser.c" "src/scanner.c"]
    :branch "main"
  }
  :filetype "cue" ; if filetype does not agrees with parser name
})

((-> :nvim-treesitter.configs (require) (. :setup)) {
  :highlight {
    :enable true
  }
  :indent {
    :enable true
  }
  :autotag {
    :enable true
  }
  :incremental_selection {
    :enable false
    :keymaps {
      :init_selection "<CR>"
      :scope_incremental "<CR>"
      :node_incremental "<TAB>"
      :node_decremental "<S-TAB>"
    }
  }
  :ensure_installed [
    "bash"
    "c"
    "c_sharp"
    "cmake"
    "comment"
    "cpp"
    "css"
    "cue"
    "dart"
    "dockerfile"
    "dot"
    "elixir"
    "elm"
    "erlang"
    "fennel"
    "fish"
    "go"
    "gomod"
    "graphql"
    "haskell"
    "html"
    "java"
    "javascript"
    "jsdoc"
    "json"
    "kotlin"
    "lua"
    "make"
    "markdown"
    "ninja"
    "ocaml"
    "perl"
    "proto"
    "python"
    "regex"
    "ruby"
    "rust"
    "toml"
    "tsx"
    "typescript"
    "vim"
    "yaml"
  ]
})

(require :nvim-treesitter.highlight)
(let [hlmap vim.treesitter.highlighter.hl_map]
  (tset hlmap :error nil)
  (tset hlmap :punctuation.delimiter "Delimiter")
  (tset hlmap :punctuation.bracket nil))

;; ((-> :nvim-gps (require) (. :setup)) {
;;   :disable_icons true
;;   :separator "/"
;; })
