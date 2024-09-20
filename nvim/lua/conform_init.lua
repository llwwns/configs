-- local util = require "conform.util"
local prettier_files = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.json5",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.toml",
  "prettier.config.js",
  "prettier.config.cjs",
}
local prettier_root = { unpack(prettier_files) }
prettier_root[#prettier_root + 1] = "package.json"

require("conform").setup {
  formatters = {
    prettierd = {
      condition = function(self, ctx)
        local config = vim.fs.root(ctx.dirname, prettier_files)
        return not not config and config == vim.fs.root(ctx.dirname, prettier_root)
      end,
      cwd = require("conform.util").root_file(prettier_root),

    },
  },
  formatters_by_ft = {
    -- lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
  },
}
