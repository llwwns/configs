local s1, lsp = pcall(require, 'nvim_lsp')
local s2, completion = pcall(require, 'completion')
local s3, diagnostic = pcall(require, 'diagnostic')
if s1 and s2 and s3 then
  function lsp_rename()
    local w = vim.fn.expand("<cword>")
    vim.fn.inputsave()
    r = vim.fn.input("Rename: ", w)
    if r ~= "" then
      vim.lsp.buf.rename(r)
    end
  end

  local on_attach_comp = completion.on_attach
  local on_attach_diag = diagnostic.on_attach
  local on_attach = function()
    on_attach_comp()
    on_attach_diag()
  end
  lsp.clangd.setup{on_attach=on_attach}
  lsp.rust_analyzer.setup{
    on_attach=on_attach,
    ["rust-analyzer.diagnostics.enable"] = true,
    ["rust-analyzer.checkOnSave.enable"] = true
  }
  -- lsp.rls.setup{on_attach=on_attach}
  lsp.solargraph.setup{on_attach=on_attach}
  lsp.tsserver.setup{on_attach=on_attach}
  lsp.vimls.setup{on_attach=on_attach}
  lsp.pyls.setup{on_attach=on_attach}
  lsp.jsonls.setup{on_attach=on_attach}
  lsp.yamlls.setup{on_attach=on_attach}
  lsp.gopls.setup{
    cmd_env = { GOFLAGS = "-tags=test_system,test_mysql,wireinject" },
    codelens = {
      ["upgrade.dependency"] = false
    },
    deepCompletion = false,
    on_attach = on_attach,
  }
  lsp.solargraph.setup{on_attach=on_attach}
end
