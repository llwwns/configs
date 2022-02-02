local cfg = require "nvim-treesitter.configs"
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
    enable = true,
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
