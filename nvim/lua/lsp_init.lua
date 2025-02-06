local lsp = require "lspconfig"
-- local configs = require "lspconfig/configs"
-- local util = require "lspconfig/util"
-- local navic = require "nvim-navic"
-- local null_ls = require "null-ls"
local map = vim.keymap.set
require("neodev").setup({})

-- local function prettierd()
--   local project_local_bin = "node_modules/.bin/prettier"
--   local utils = (require "null-ls.utils").make_conditional_utils()
--   if utils.root_has_file ".prettierrc" then
--     return null_ls.builtins.formatting.prettierd.with {
--       filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "sh" },
--     }
--   end
-- end

-- local function eslint_d()
--   return null_ls.builtins.diagnostics.eslint_d.with {
--     timeout = 15000,
--     condition = function(utils)
--       return (utils.root_has_file ".eslintrc" or utils.root_has_file ".eslintrc.json")
--     end,
--   }
-- end
--

local function on_attach_ts(client, bufnr)
  local root = client.config.root_dir
  local path = require("path")
  if path.exists(path.join(root, ".prettierrc")) then
    client.server_capabilities["documentFormattingProvider"] = false
  else
  end
end

local function on_attach_eslint(client, bufnr)
  client.server_capabilities["documentFormattingProvider"] = false
end

-- local function on_attach_rs(client, bufnr)
--   on_attach(client, bufnr)
--   local augid = vim.api.nvim_create_augroup("inlayHint", { clear = true })
--   return vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TabEnter", "InsertLeave" }, {
--     callback = function()
--       return (require "lsp_extensions").inlay_hints { enabled = { "ChainingHint", "TypeHint" } }
--     end,
--     group = augid,
--     pattern = "*.rs",
--   })
-- end
--
local capabilities = require "cmp_nvim_lsp".default_capabilities()
-- local capabilities = require('blink.cmp').get_lsp_capabilities()

-- null_ls.setup {
--   sources = {
--     prettierd,
--     -- null_ls.builtins.formatting.stylua,
--     null_ls.builtins.diagnostics.shellcheck,
--     -- eslint_d
--     -- null-ls.builtins.code_actions.gitsigns
--   },
--   -- on_attach = on_attach,
--   capabilities = capabilities,
-- }

function _G.setup_lsp(server, opts)
  local conf = lsp[server]
  conf.setup(vim.tbl_extend("force", {
    capabilities = capabilities,
  }, opts))
  local try_add = conf.manager.try_add
  conf.manager["try_add"] = function(cnf)
    if not vim.b.large_buf then
      return try_add(cnf)
    end
  end
end

vim.lsp.set_log_level("ERROR")

setup_lsp("clangd", {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  cmd = { "clangd", "--background-index" },
})
setup_lsp("rust_analyzer", {
  ["rust-analyzer.diagnostics.enable"] = true,
  ["rust-analyzer.checkOnSave.enable"] = true,
})
setup_lsp(
  "vtsls",
  {
    single_file_support = false,
    on_attach = on_attach_ts,
    root_dir = lsp.util.root_pattern "package.json",
  }
)
setup_lsp("denols", {
  single_file_support = false,
  on_attach = on_attach_ts,
  root_dir = lsp.util.root_pattern "deno.json",
  init_options = { lint = true },
  settings = { ["deno.unstable"] = true },
})
setup_lsp("vimls", {})
setup_lsp(
  "jsonls",
  {
    settings = {
      json = {
        validate = {
          enable = true
        }
      }
    }
  }
)
setup_lsp("cssls", {})
setup_lsp("cssmodules_ls", {})
setup_lsp("stylelint_lsp", {
  filetypes = { "css" }
})
setup_lsp("html", {})
setup_lsp("yamlls", { settings = { yaml = { keyOrdering = false } } })
setup_lsp(
  "eslint",
  {
    on_attach = on_attach_eslint,
    settings = {
      experimental = {
        useFlatConfig = false,
      }
    },
    root_dir = lsp.util.root_pattern "package.json",
  }
)
setup_lsp("zls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("gopls", {
  cmd_env = { GOFLAGS = "-tags=debug,test_mysql,wireinject,test_es" },
  codelens = { ["upgrade.dependency"] = false },
  deepCompletion = false,
})
setup_lsp("erlangls", {})
setup_lsp("tailwindcss", {})
setup_lsp("hls", {})
setup_lsp("marksman", {})
setup_lsp("elixirls", { cmd = { "elixir-ls" } })
setup_lsp("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      -- diagnostics = {
      --   -- Get the language server to recognize the `vim` global
      --   globals = { 'vim' },
      -- },
      -- workspace = {
      --   -- Make the server aware of Neovim runtime files
      --   library = vim.api.nvim_get_runtime_file("", true),
      -- },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace"
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          align_function_params = false,
          align_continuous_rect_table_field = false,
          align_array_table = false,
          align_continuous_assign_statement = false,
        }
      },
    },
  },
})
-- setup_lsp("efm", {
--   init_options = { documentFormatting = true },
--   filetypes = { 'javascript', 'sh', 'typescript', 'typescriptreact' },
--   -- filetypes = { 'sh' },
-- })

-- setup_lsp("emmet_ls", {
--   filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss",
--     "svelte", "pug", "typescriptreact", "vue" },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

_G.stop_lsp = function()
  return vim.lsp.stop_client(vim.lsp.get_active_clients())
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = false })
vim.diagnostic.config({ update_in_insert = false })
