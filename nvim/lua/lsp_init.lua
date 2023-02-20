local lsp = require "lspconfig"
local configs = require "lspconfig/configs"
local util = require "lspconfig/util"
local navic = require "nvim-navic"
local null_ls = require "null-ls"
local map = vim.keymap.set

local function prettierd()
  local project_local_bin = "node_modules/.bin/prettier"
  local utils = (require "null-ls.utils").make_conditional_utils()
  if utils.root_has_file ".prettierrc" then
    return null_ls.builtins.formatting.prettierd.with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "sh" },
    }
  end
end

-- local function eslint_d()
--   return null_ls.builtins.diagnostics.eslint_d.with {
--     timeout = 15000,
--     condition = function(utils)
--       return (utils.root_has_file ".eslintrc" or utils.root_has_file ".eslintrc.json")
--     end,
--   }
-- end
--
local function on_attach(client, bufnr)
  if
      client.server_capabilities.documentFormattingProvider
      and not vim.regex("\\vfugitive:\\/\\/"):match_str(vim.fn.expand "%")
  then
    vim.cmd "autocmd BufWritePre <buffer> lua lsp_format()"
  else
  end
  map("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>",
    { buffer = true, noremap = true, silent = true })
  map("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>",
    { buffer = true, noremap = true, silent = true })
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { buffer = true, noremap = true, silent = true })
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { buffer = true, noremap = true, silent = true })
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
    { buffer = true, noremap = true, silent = true })
  -- map("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { buffer = true, noremap = true, silent = true })
  map(
    "n",
    "gs",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
    { buffer = true, noremap = true, silent = true }
  )
  map("n", "<leader>rn", "<cmd>Lsp rename<CR>", { buffer = true, noremap = true, silent = true })
  map("n", "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { buffer = true, noremap = true, silent = true })
  map(
    "v",
    "<leader>da",
    "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>",
    { buffer = true, noremap = true, silent = true }
  )
  vim.opt_local.formatexpr = "v:lua.vim.lsp.formatexpr()"
  vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"
  -- client.server_capabilities["documentHighlightProvider"] = false

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  else
  end
  if not _G.lsp_clients then
    _G["lsp_clients"] = {}
  else
  end
  _G.lsp_clients[bufnr] = client
  return nil
end
local function on_attach_ts(client, bufnr)
  local root = client.config.root_dir
  local path = (require "null-ls.utils").path
  if path.exists(path.join(root, ".prettierrc")) then
    client.server_capabilities["documentFormattingProvider"] = false
  else
  end
  return on_attach(client, bufnr)
end
local function on_attach_eslint(client, bufnr)
  client.server_capabilities["documentFormattingProvider"] = false
  return on_attach(client, bufnr)
end

local function on_attach_rs(client, bufnr)
  on_attach(client, bufnr)
  local augid = vim.api.nvim_create_augroup("inlayHint", { clear = true })
  return vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TabEnter", "InsertLeave" }, {
    callback = function()
      return (require "lsp_extensions").inlay_hints { enabled = { "ChainingHint", "TypeHint" } }
    end,
    group = augid,
    pattern = "*.rs",
  })
end

local capabilities = (require "cmp_nvim_lsp").default_capabilities()

null_ls.setup {
  sources = {
    prettierd,
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.shellcheck,
    -- eslint_d
    -- null-ls.builtins.code_actions.gitsigns
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

local function setup_lsp(server, opts)
  local conf = lsp[server]
  conf.setup(opts)
  local try_add = conf.manager.try_add
  conf.manager["try_add"] = function(cnf)
    if not vim.b.large_buf then
      return try_add(cnf)
    end
  end
end

setup_lsp("clangd", {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  on_attach = on_attach_rs,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
})
setup_lsp("rust_analyzer", {
  on_attach = on_attach_rs,
  ["rust-analyzer.diagnostics.enable"] = true,
  ["rust-analyzer.checkOnSave.enable"] = true,
  capabilities = capabilities,
})
setup_lsp(
  "tsserver",
  {
    on_attach = on_attach_ts,
    root_dir = lsp.util.root_pattern "package.json",
    capabilities = capabilities
  }
)
setup_lsp("denols", {
  single_file_support = false,
  on_attach = on_attach_ts,
  root_dir = lsp.util.root_pattern "deno.json",
  init_options = { lint = true },
  settings = { ["deno.unstable"] = true },
  capabilities = capabilities,
})
setup_lsp("vimls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp(
  "jsonls",
  {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      json = {
        validate = {
          enable = true
        }
      }
    }
  }
)
setup_lsp("cssls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("html", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("yamlls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp(
  "eslint",
  {
    on_attach = on_attach_eslint,
    root_dir = lsp.util.root_pattern "package.json",
    capabilities = capabilities
  }
)
setup_lsp("zls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("gopls", {
  cmd_env = { GOFLAGS = "-tags=debug,test_mysql,wireinject,test_es" },
  capabilities = capabilities,
  codelens = { ["upgrade.dependency"] = false },
  deepCompletion = false,
  on_attach = on_attach,
})
setup_lsp("erlangls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("tailwindcss", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("hls", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("marksman", { on_attach = on_attach, capabilities = capabilities })
setup_lsp("elixirls", { cmd = { "elixir-ls" }, on_attach = on_attach, capabilities = capabilities })
setup_lsp("lua_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
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
_G.stop_lsp = function()
  return vim.lsp.stop_client(vim.lsp.get_active_clients())
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = false })
vim.diagnostic.config({ update_in_insert = false })
