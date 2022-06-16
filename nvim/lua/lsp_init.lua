-- :fennel:1655343866
local lsp = require("lspconfig")
local null_ls = require("null-ls")
local function prettier()
  local project_local_bin = "node_modules/.bin/prettier"
  local utils = (require("null-ls.utils")).make_conditional_utils()
  if utils.root_has_file(".prettierrc") then
    local _1_
    if utils.root_has_file("project_local_bin") then
      _1_ = project_local_bin
    else
      _1_ = "prettier"
    end
    return null_ls.builtins.formatting.prettier.with({command = _1_, filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "sh"}})
  else
    return nil
  end
end
local function eslint_d()
  local function _4_(_241)
    return (_241.root_has_file(".eslintrc") or _241.root_has_file(".eslintrc.json"))
  end
  return null_ls.builtins.diagnostics.eslint_d.with({timeout = 15000, condition = _4_})
end
local function on_attach(client)
  if (client.resolved_capabilities.document_formatting and not vim.regex("\\vfugitive:\\/\\/"):match_str(vim.fn.expand("%"))) then
    vim.cmd("autocmd BufWritePre <buffer> lua lsp_format()")
  else
  end
  vim.keymap.set({"n"}, "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n"}, "<leader>rn", "<cmd>Lsp rename<CR>", {buffer = true, noremap = true, silent = true})
  vim.keymap.set({"n", "v"}, "<leader>da", "<cmd>Lsp codeaction<CR>", {buffer = true, noremap = true, silent = true})
  return (require("lsp_signature")).on_attach({floating_window = false})
end
local function on_attach_ts(client)
  local root = client.config.root_dir
  local path = (require("null-ls.utils")).path
  if path.exists(path.join(root, ".prettierrc")) then
    client.resolved_capabilities["document_formatting"] = false
  else
  end
  return on_attach(client)
end
local function on_attach_rs(client)
  on_attach(client)
  local augid_7_ = vim.api.nvim_create_augroup("inlayHint", {clear = true})
  local function _8_()
    return (require("lsp_extensions")).inlay_hints({enabled = {"ChainingHint", "TypeHint"}})
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "TabEnter", "InsertLeave"}, {callback = _8_, group = augid_7_, nested = false, once = false, pattern = "*.rs"})
end
local capabilities
do
  local capabilities0 = vim.lsp.protocol.make_client_capabilities()
  capabilities = (require("cmp_nvim_lsp")).update_capabilities(capabilities0)
end
null_ls.setup({sources = {prettier, eslint_d, null_ls.builtins.formatting.stylua, null_ls.builtins.diagnostics.shellcheck}, on_attach = on_attach, capabilities = capabilities})
lsp.clangd.setup({on_attach = on_attach_rs, capabilities = capabilities, cmd = {"clangd", "--background-index"}})
lsp.rust_analyzer.setup({on_attach = on_attach_rs, ["rust-analyzer.diagnostics.enable"] = true, ["rust-analyzer.checkOnSave.enable"] = true, capabilities = capabilities})
lsp.tsserver.setup({on_attach = on_attach_ts, root_dir = lsp.util.root_pattern("package.json"), capabilities = capabilities})
lsp.denols.setup({on_attach = on_attach_ts, root_dir = lsp.util.root_pattern("deno.json"), init_options = {lint = true}, settings = {["deno.unstable"] = true}})
lsp.vimls.setup({on_attach = on_attach})
lsp.jsonls.setup({on_attach = on_attach})
lsp.yamlls.setup({on_attach = on_attach})
lsp.zls.setup({on_attach = on_attach})
lsp.gopls.setup({cmd_env = {GOFLAGS = "-tags=test_system,test_mysql,wireinject,test_es"}, capabilities = capabilities, codelens = {["upgrade.dependency"] = false}, deepCompletion = false, on_attach = on_attach})
lsp.erlangls.setup({on_attach = on_attach})
_G.stop_lsp = function()
  return vim.lsp.stop_client(vim.lsp.get_active_clients())
end
vim.lsp.handlers["textDocument/publishDiagnostics:"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})
lsp.tailwindcss.setup({})
return lsp.hls.setup({})