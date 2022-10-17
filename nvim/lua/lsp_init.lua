-- :fennel:generated
local lsp = require("lspconfig")
local configs = require("lspconfig/configs")
local util = require("lspconfig/util")
local navic = require("nvim-navic")
local null_ls = require("null-ls")
local function prettierd()
  local project_local_bin = "node_modules/.bin/prettier"
  local utils = (require("null-ls.utils")).make_conditional_utils()
  if utils.root_has_file(".prettierrc") then
    return null_ls.builtins.formatting.prettierd.with({filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "sh"}})
  else
    return nil
  end
end
local function on_attach(client, bufnr)
  if (client.server_capabilities.documentFormattingProvider and not vim.regex("\\vfugitive:\\/\\/"):match_str(vim.fn.expand("%"))) then
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
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  do end (require("lsp_signature")).on_attach({floating_window = false})
  if client.server_capabilities.documentSymbolProvider then
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    navic.attach(client, bufnr)
    if (buf == bufnr) then
      WindLine.on_win_enter()
    else
    end
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
  local path = (require("null-ls.utils")).path
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
  local augid_7_ = vim.api.nvim_create_augroup("inlayHint", {clear = true})
  local function _8_()
    return (require("lsp_extensions")).inlay_hints({enabled = {"ChainingHint", "TypeHint"}})
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "TabEnter", "InsertLeave"}, {callback = _8_, group = augid_7_, pattern = "*.rs"})
end
local capabilities = (require("cmp_nvim_lsp")).default_capabilities()
null_ls.setup({sources = {prettierd, null_ls.builtins.formatting.stylua, null_ls.builtins.diagnostics.shellcheck}, on_attach = on_attach, capabilities = capabilities})
lsp.clangd.setup({on_attach = on_attach_rs, capabilities = capabilities, cmd = {"clangd", "--background-index"}})
lsp.rust_analyzer.setup({on_attach = on_attach_rs, ["rust-analyzer.diagnostics.enable"] = true, ["rust-analyzer.checkOnSave.enable"] = true, capabilities = capabilities})
lsp.tsserver.setup({on_attach = on_attach_ts, root_dir = lsp.util.root_pattern("package.json"), capabilities = capabilities})
lsp.denols.setup({single_file_support = false, on_attach = on_attach_ts, root_dir = lsp.util.root_pattern("deno.json"), init_options = {lint = true}, settings = {["deno.unstable"] = true}, capabilities = capabilities})
lsp.vimls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.jsonls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.cssls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.html.setup({on_attach = on_attach, capabilities = capabilities})
lsp.yamlls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.eslint.setup({on_attach = on_attach_eslint, root_dir = lsp.util.root_pattern("package.json"), capabilities = capabilities})
lsp.zls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.gopls.setup({cmd_env = {GOFLAGS = "-tags=debug,test_mysql,wireinject,test_es"}, capabilities = capabilities, codelens = {["upgrade.dependency"] = false}, deepCompletion = false, on_attach = on_attach})
lsp.erlangls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.tailwindcss.setup({on_attach = on_attach, capabilities = capabilities})
lsp.hls.setup({on_attach = on_attach, capabilities = capabilities})
lsp.marksman.setup({on_attach = on_attach, capabilities = capabilities})
_G.stop_lsp = function()
  return vim.lsp.stop_client(vim.lsp.get_active_clients())
end
vim.lsp.handlers["textDocument/publishDiagnostics:"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})
return nil