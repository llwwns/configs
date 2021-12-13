local lsp = require "lspconfig"

local configs = require "lspconfig/configs"
local util = require "lspconfig/util"

local null_ls = require "null-ls"

local prettier = require("null-ls.helpers").conditional(function(utils)
  local project_local_bin = "node_modules/.bin/prettier"

  return null_ls.builtins.formatting.prettier.with {
    command = utils.root_has_file(project_local_bin) and project_local_bin or "prettier",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  }
end)

local eslint_d = require("null-ls.helpers").conditional(function(utils)
  return null_ls.builtins.diagnostics.eslint_d.with {
    timeout = 15000,
  }
end)

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
    -- "<cmd>call v:lua.lsp_rename()<CR>",
    "<cmd>Lsp rename<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>rp", "<cmd>call v:lua.replace()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>da",
    -- "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
    "<cmd>Lsp codeaction<CR>",
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
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

null_ls.setup {
  -- debug = true,
  sources = {
    prettier,
    eslint_d,
    null_ls.builtins.formatting.stylua,
  },
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
-- lsp.solargraph.setup { on_attach = on_attach }
lsp.tsserver.setup {
  on_attach = on_attach_ts,
  root_dir = lsp.util.root_pattern "package.json",
  capabilities = capabilities,
}
lsp.denols.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern "deno.json",
  init_options = {
    lint = true,
  },
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
lsp.erlangls.setup { on_attach = on_attach }

-- if not configs.steep then
--   configs.steep = {
--     default_config = {
--       cmd = { "steep", "langserver" },
--       filetypes = { "ruby", "rbs" },
--       root_dir = util.root_pattern("Steepfile", ".git"),
--     },
--   }
--   lsp.steep = configs.steep
-- end
-- lsp.steep.setup { on_attach = on_attach }
--
--
function stop_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
})
