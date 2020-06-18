local s1, lsp = pcall(require, 'nvim_lsp')
local s2, completion = pcall(require, 'completion')
local s3, diagnostic = pcall(require, 'diagnostic')
local s4, lsp_status = pcall(require, 'lsp-status')
if s1 and s2 and s3 and s4 then
  lsp_status.config({
    kind_labels = vim.g.completion_customize_lsp_label
  })
  lsp_status.register_progress()
  local set_var = vim.api.nvim_set_var
  set_var("airline_section_x", '%{StatuslineLsp()}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}')
  function lsp_rename()
    local w = vim.fn.expand("<cword>")
    vim.fn.inputsave()
    r = vim.fn.input("Rename: ", w)
    if r ~= "" then
      vim.lsp.buf.rename(r)
    end
  end

  local on_attach = function(client)
    lsp_status.on_attach(client)
    completion.on_attach()
    diagnostic.on_attach()
    local command = vim.api.nvim_command
    command("nnoremap <buffer> <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>")
    command("nnoremap <buffer> <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>")
    command("nnoremap <buffer> <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>")
    command("nnoremap <buffer> <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>")
    command("nnoremap <buffer> <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>")
    command("nnoremap <buffer> <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>")
    command("nnoremap <buffer> <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>")
    command("nnoremap <buffer> <silent> <leader>rn <cmd>call v:lua.lsp_rename()<CR>")
    command("nnoremap <buffer> <silent> <leader>rp <cmd>call Replace()<CR>")
  end
  lsp.clangd.setup{
    on_attach=on_attach,
    capabilities = lsp_status.capabilities,
  }
  lsp.rust_analyzer.setup{
    on_attach=on_attach,
    ["rust-analyzer.diagnostics.enable"] = true,
    ["rust-analyzer.checkOnSave.enable"] = true,
    capabilities = lsp_status.capabilities,
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
    capabilities = lsp_status.capabilities,
    codelens = {
      ["upgrade.dependency"] = false
    },
    deepCompletion = false,
    on_attach = on_attach,
  }
end
