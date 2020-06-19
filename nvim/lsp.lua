function try_require(tbl, func)
  res = {}
  for i, pkg in ipairs(tbl) do
    local s, r = pcall(require, pkg)
    if s then
      res[i] = r
    else
      return
    end
  end
  func(unpack(res))
end

try_require({'nvim_lsp', 'completion', 'diagnostic', 'lsp-status'}, function(lsp, completion, diagnostic, lsp_status)
  lsp_status.config({
    kind_labels = vim.g.completion_customize_lsp_label
  })
  lsp_status.register_progress()
  local set_var = vim.api.nvim_set_var
  function statusline_lsp()
    return lsp_status.status()
  end
  set_var("airline_section_x", '%{v:lua.statusline_lsp()}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}')
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
end)
