local util = require "conform.util"
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

local root_file = function(files, ctx)
  local found = vim.fs.find(files, { upward = true, path = ctx.dirname })[1]
  if found then
    return vim.fs.dirname(found)
  end
  return nil
end

require("conform").setup {
  formatters = {
    prettierd = {
      condition = function(ctx)
        local config = root_file(prettier_files, ctx)
        return config and config == root_file(prettier_root, ctx)
      end,
      cwd = require("conform.util").root_file(prettier_root),

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
