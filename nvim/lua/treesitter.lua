try_require = require("util").try_require

try_require({'nvim-treesitter.configs'}, function(cfg)
  cfg.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
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
      "erlang"
    },
  }
end)

try_require({"nvim-treesitter.highlight"}, function(_)
  local hlmap = vim.treesitter.highlighter.hl_map
  --Misc
  hlmap.error = nil
  hlmap["punctuation.delimiter"] = "Delimiter"
  hlmap["punctuation.bracket"] = nil
end)

