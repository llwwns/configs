-- :fennel:generated
(require("nvim-treesitter.parsers")).get_parser_configs()["cue"] = {install_info = {url = "https://github.com/eonpatapon/tree-sitter-cue", files = {"src/parser.c", "src/scanner.c"}, branch = "main"}, filetype = "cue"}
do end (require("nvim-treesitter.configs")).setup({highlight = {enable = true}, indent = {enable = true}, autotag = {enable = true}, incremental_selection = {enable = false, keymaps = {init_selection = "<CR>", scope_incremental = "<CR>", node_incremental = "<TAB>", node_decremental = "<S-TAB>"}}, ensure_installed = {"bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "cue", "dart", "dockerfile", "dot", "elixir", "elm", "erlang", "fennel", "fish", "go", "gomod", "graphql", "haskell", "html", "java", "javascript", "jsdoc", "json", "kotlin", "lua", "make", "markdown", "ninja", "ocaml", "perl", "proto", "python", "regex", "ruby", "rust", "toml", "tsx", "typescript", "vim", "yaml"}})
require("nvim-treesitter.highlight")
local hlmap = vim.treesitter.highlighter.hl_map
hlmap["error"] = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil
return nil