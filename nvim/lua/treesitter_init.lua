-- :fennel:generated
(require("nvim-treesitter.parsers")).get_parser_configs()["cue"] = {install_info = {url = "https://github.com/eonpatapon/tree-sitter-cue", files = {"src/parser.c", "src/scanner.c"}, branch = "main"}, filetype = "cue"}
local function _1_()
  return not not vim.b.large_buf
end
local function _2_()
  return not not vim.b.large_buf
end
local function _3_()
  return not not vim.b.large_buf
end
local function _4_()
  return not not vim.b.large_buf
end
return (require("nvim-treesitter.configs")).setup({highlight = {enable = true, additional_vim_regex_highlighting = false, disable = _1_}, indent = {enable = true, disable = _2_}, rainbow = {enable = true, extended_mode = true, max_file_lines = 10000, disable = _3_}, autotag = {enable = true, disable = _4_}, incremental_selection = {enable = false, keymaps = {init_selection = "<CR>", scope_incremental = "<CR>", node_incremental = "<TAB>", node_decremental = "<S-TAB>"}}, ensure_installed = {"bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "cue", "dart", "dockerfile", "dot", "elixir", "elm", "erlang", "fennel", "fish", "go", "gomod", "graphql", "haskell", "heex", "html", "java", "javascript", "jsdoc", "json", "kotlin", "lua", "make", "markdown", "ninja", "ocaml", "perl", "proto", "python", "regex", "ruby", "rust", "sql", "toml", "tsx", "typescript", "yaml"}})