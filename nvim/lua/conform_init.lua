local util = require "conform.util"
local prettier_configs = util.root_file {
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
local prettier_cwd = require("conform.formatters.prettier").cwd

require("conform").setup {
  formatters = {
    prettierd = {
      condition = function(ctx)
        local cfg = prettier_configs(ctx)
        return cfg and cfg == prettier_cwd(ctx)
      end,
    },
    -- prettier = {
    --   condition = function(ctx)
    --     local cfg = prettier_configs(ctx)
    --     return cfg and cfg == prettier_cwd(ctx)
    --   end,
    -- },
  },
  formatters_by_ft = {
    -- lua = { "stylua" },
    javascript = { { "prettierd" } },
    javascriptreact = { { "prettierd" } },
    typescript = { { "prettierd" } },
    typescriptreact = { { "prettierd" } },
  },
}
