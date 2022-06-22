-- :fennel:generated
(require("nvim-treesitter.parsers")).get_parser_configs()["cue"] = {install_info = {url = "https://github.com/eonpatapon/tree-sitter-cue", files = {"src/parser.c", "src/scanner.c"}, branch = "main"}, filetype = "cue"}
do end (require("nvim-treesitter.configs")).setup({highlight = {enable = true}, indent = {enable = true}, autotag = {enable = true}, incremental_selection = {enable = false, keymaps = {init_selection = "<CR>", scope_incremental = "<CR>", node_incremental = "<TAB>", node_decremental = "<S-TAB>"}}, ensure_installed = {"html", "typescript", "regex", "c", "cue", "python", "yaml", "cpp", "toml", "lua", "ruby", "go", "gomod", "haskell", "rust", "json", "jsdoc", "javascript", "css", "c_sharp", "bash", "tsx", "graphql", "erlang", "comment", "fish", "make", "ninja", "perl", "markdown", "ocaml", "vim", "cmake", "dart", "elixir", "elm", "java", "kotlin", "dockerfile", "fennel"}})
require("nvim-treesitter.highlight")
do
  local hlmap = vim.treesitter.highlighter.hl_map
  hlmap["error"] = nil
  hlmap["punctuation.delimiter"] = "Delimiter"
  hlmap["punctuation.bracket"] = nil
end
return (require("nvim-gps")).setup({disable_icons = true, separator = "/"})