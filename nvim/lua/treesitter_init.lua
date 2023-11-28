require("nvim-treesitter.parsers").get_parser_configs()["cue"] = {
  install_info = {
    url = "https://github.com/eonpatapon/tree-sitter-cue",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "cue",
}

local function is_large_buf()
  return not not vim.b.large_buf
end
return (require("nvim-treesitter.configs")).setup({
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = is_large_buf,
  },
  indent = {
    enable = true,
    disable = is_large_buf
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = false,
  --   max_file_lines = 10000,
  --   disable = is_large_buf,
  -- },
  autotag = {
    enable = true,
    disable = is_large_buf,
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    }
  },
  endwise = {
    enable = true,
    disable = is_large_buf,
  },
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "cpp",
    "css",
    "cue",
    "dart",
    "dockerfile",
    "dot",
    "elixir",
    "elm",
    "erlang",
    "fennel",
    "fish",
    "go",
    "gomod",
    "graphql",
    "haskell",
    "heex",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "ninja",
    "ocaml",
    "perl",
    "proto",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  }
})
