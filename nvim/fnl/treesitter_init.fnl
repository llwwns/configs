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
    "html"
    "typescript"
    "regex"
    "c"
    "cue"
    "python"
    "yaml"
    "cpp"
    "toml"
    "lua"
    "ruby"
    "go"
    "gomod"
    "haskell"
    "rust"
    "json"
    "jsdoc"
    "javascript"
    "css"
    "c_sharp"
    "bash"
    "tsx"
    "graphql"
    "erlang"
    "comment"
    "fish"
    "make"
    "ninja"
    "perl"
    "markdown"
    "ocaml"
    "vim"
    "cmake"
    "dart"
    "elixir"
    "elm"
    "java"
    "kotlin"
    "dockerfile"
    "fennel"
  ]
})

(require :nvim-treesitter.highlight)
(let [hlmap vim.treesitter.highlighter.hl_map]
  (tset hlmap :error nil)
  (tset hlmap :punctuation.delimiter "Delimiter")
  (tset hlmap :punctuation.bracket nil))

((-> :nvim-gps (require) (. :setup)) {
  :disable_icons true
  :separator "/"
})
