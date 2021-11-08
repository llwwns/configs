local lsp = require "lspconfig"

local configs = require "lspconfig/configs"
local util = require "lspconfig/util"

function lsp_rename()
  local w = vim.fn.expand "<cword>"
  vim.fn.inputsave()
  r = vim.fn.input("Rename: ", w)
  if r ~= "" then
    vim.lsp.buf.rename(r)
  end
end

local null_ls = require "null-ls"

local prettier = require("null-ls.helpers").conditional(function(utils)
  local project_local_bin = "node_modules/.bin/prettier"

  return null_ls.builtins.formatting.prettier.with {
    command = utils.root_has_file(project_local_bin) and project_local_bin or "prettier",
  }
end)

local eslint_d = require("null-ls.helpers").conditional(function(utils)
  return null_ls.builtins.diagnostics.eslint_d.with {
    timeout = 15000,
  }
end)

require("null-ls").config {
  -- sources = {}
  debug = true,
  sources = {
    prettier,
    eslint_d,
    require("null-ls").builtins.formatting.stylua,
  },
}

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
  end
  vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {
    noremap = true,
    silent = true,
  })
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<c-]>",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "gD",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true }
  )
  -- vim.api.nvim_buf_set_keymap(0, "n", "<c-k>", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "1gD",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "g0",
    "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>rn",
    "<cmd>call v:lua.lsp_rename()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>rp", "<cmd>call v:lua.replace()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>da",
    "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    0,
    "v",
    "<leader>da",
    "<cmd>'<,'>lua require('lspsaga.codeaction').code_action()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>df",
    "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
    { noremap = true, silent = true }
  )
  require("lsp_signature").on_attach {
    floating_window = false,
  }
end

local on_attach_ts = function(client)
  client.resolved_capabilities.document_formatting = false
  on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
  valueSet = { 1 },
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
lsp["null-ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.clangd.setup {
  on_attach = on_attach_ts,
  capabilities = capabilities,
}
lsp.rust_analyzer.setup {
  on_attach = on_attach,
  ["rust-analyzer.diagnostics.enable"] = true,
  ["rust-analyzer.checkOnSave.enable"] = true,
  capabilities = capabilities,
}
-- lsp.rls.setup{on_attach=on_attach}
lsp.solargraph.setup { on_attach = on_attach }
lsp.tsserver.setup {
  on_attach = on_attach_ts,
  capabilities = capabilities,
}
lsp.vimls.setup { on_attach = on_attach }
lsp.jsonls.setup { on_attach = on_attach_ts }
lsp.yamlls.setup { on_attach = on_attach_ts }
lsp.gopls.setup {
  cmd_env = { GOFLAGS = "-tags=test_system,test_mysql,wireinject,test_es" },
  capabilities = capabilities,
  codelens = {
    ["upgrade.dependency"] = false,
  },
  deepCompletion = false,
  on_attach = on_attach,
}

configs.erlang_ls = {
  default_config = {
    cmd = { "erlang_ls" },
    filetypes = { "erlang" },
    root_dir = util.root_pattern ".git",
  },
  docs = {
    description = [[ test ]],
    default_config = {
      root_dir = [[root_pattern(".git")]],
    },
  },
}
lsp.erlang_ls.setup { on_attach = on_attach }
-- configs.ruby = {
--   default_config = {
--     cmd = { "steep", "langserver" },
--     filetypes = { "ruby", "rbs" },
--     root_dir = util.root_pattern("Steepfile", ".git"),
--   },
--   docs = {
--     description = [[ test ]],
--     default_config = {
--       root_dir = [[root_pattern(".git")]],
--     },
--   },
-- }
-- lsp.ruby.setup { on_attach = on_attach }
--
-- configs.deno = {
--   default_config = {
--     cmd = { "deno", "lsp" },
--     filetypes = { "typescript", "typescript.jsx" },
--     root_dir = util.root_pattern("tsconfig.json", ".git"),
--   },
--   docs = {
--     description = [[ test ]],
--     default_config = {
--       root_dir = [[root_pattern(".git")]],
--     },
--   },
-- }
-- lsp.deno.setup { on_attach = on_attach }
--
function stop_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
})
