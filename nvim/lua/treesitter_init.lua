local cfg = require 'nvim-treesitter.configs'
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
  },
}

require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
--Misc
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil

require("nvim-gps").setup({
	icons = {
		["class-name"] = '',      -- Classes and class-like objects
		["function-name"] = '',   -- Functions
		["method-name"] = ''      -- Methods (functions inside class-like objects)
	},
	-- Disable any languages individually over here
	-- Any language not disabled here is enabled by default
	languages = {
		-- ["bash"] = false,
		-- ["go"] = false,
	},
	separator = '/',
})
