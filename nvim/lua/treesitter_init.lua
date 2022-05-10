local cfg = require "nvim-treesitter.configs"

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.cue = {
  install_info = {
    url = "https://github.com/eonpatapon/tree-sitter-cue", -- local path or git repo
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "cue", -- if filetype does not agrees with parser name
}

cfg.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  ensure_installed = {
    "html",
    "typescript",
    "regex",
    "c",
    "cue",
    "python",
    "yaml",
    "cpp",
    "toml",
    "lua",
    "ruby",
    "go",
    "gomod",
    "haskell",
    "rust",
    "json",
    "jsdoc",
    "javascript",
    "css",
    "c_sharp",
    "bash",
    "tsx",
    "graphql",
    "erlang",
    "comment",
    "fish",
    "make",
    "ninja",
    "perl",
    "markdown",
    "ocaml",
    "vim",
    "cmake",
    "dart",
    "elixir",
    "elm",
    "java",
    "kotlin",
    "dockerfile",
  },
}

require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
--Misc
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil

require("nvim-gps").setup {
  disable_icons = true,
  separator = "/",
}
