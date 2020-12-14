function try_require(tbl, func)
  res = {}
  for i, pkg in ipairs(tbl) do
    local s, r = pcall(require, pkg)
    if s then
      res[i] = r
    else
      print("failed require "..pkg)
      return
    end
  end
  func(unpack(res))
end

try_require({'lspconfig', 'completion'}, function(lsp, completion)
  function lsp_rename()
    local w = vim.fn.expand("<cword>")
    vim.fn.inputsave()
    r = vim.fn.input("Rename: ", w)
    if r ~= "" then
      vim.lsp.buf.rename(r)
    end
  end

  local on_attach = function(client)
    completion.on_attach()
    vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_buf_set_keymap(0, "n", "<c-k>", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>rn", "<cmd>call v:lua.lsp_rename()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>rp", "<cmd>call v:lua.replace()<CR>", { noremap = true, silent = true })
  end
  lsp.clangd.setup{
    on_attach=on_attach,
  }
  lsp.rust_analyzer.setup{
    on_attach=on_attach,
    ["rust-analyzer.diagnostics.enable"] = true,
    ["rust-analyzer.checkOnSave.enable"] = true,
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
  function stop_lsp()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
  end
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = false,
    }
  )
end)

try_require({'nvim-treesitter.configs'}, function(cfg)
  cfg.setup {
    highlight = {
        enable = true,
    },
    ensure_installed = {
      "html",
      "typescript",
      "regex",
      "c",
      "python",
      "yaml",
      "cpp",
      "toml",
      "lua",
      "ruby",
      "go",
      "haskell",
      "rust",
      "json",
      "jsdoc",
      "javascript",
      "css",
      "c_sharp",
      "bash",
      "tsx",
      "graphql",
      "erlang"
    },
  }
end)

try_require({"nvim-treesitter.highlight"}, function(_)
  local hlmap = vim.treesitter.highlighter.hl_map
  --Misc
  hlmap.error = nil
  hlmap["punctuation.delimiter"] = "Delimiter"
  hlmap["punctuation.bracket"] = nil
end)
