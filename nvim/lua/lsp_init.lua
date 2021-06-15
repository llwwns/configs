local lsp = require('lspconfig')
-- local completion = require('completion')
require'compe'.setup {
  enabled = true;
  source = {
    path = true;
    buffer = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    treesitter = true;
    vim_dadbod_completion = true;
  };
}

local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

function lsp_rename()
  local w = vim.fn.expand("<cword>")
  vim.fn.inputsave()
  r = vim.fn.input("Rename: ", w)
  if r ~= "" then
    vim.lsp.buf.rename(r)
  end
end

local on_attach = function(client)
  -- completion.on_attach()
  vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_buf_set_keymap(0, "n", "<c-k>", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>rn", "<cmd>call v:lua.lsp_rename()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>rp", "<cmd>call v:lua.replace()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>da", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "v", "<leader>da", "<cmd>'<,'>lua require('lspsaga.codeaction').code_action()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>df", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", { noremap = true, silent = true })
  require'lsp_signature'.on_attach()
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

configs.erlang_ls = {
  default_config = {
    cmd = {"erlang_ls"};
    filetypes = {"erlang"};
    root_dir = util.root_pattern(".git");
  };
  docs = {
    description = [[ test ]];
    default_config = {
      root_dir = [[root_pattern(".git")]];
    };
  };
}
lsp.erlang_ls.setup{on_attach=on_attach}

-- configs.deno = {
--   default_config = {
--     cmd = {"deno", "lsp"};
--     filetypes = {"typescript", "typescript.jsx"};
--     root_dir = util.root_pattern("tsconfig.json", ".git");
--   };
--   docs = {
--     description = [[ test ]];
--     default_config = {
--       root_dir = [[root_pattern(".git")]];
--     };
--   };
-- }
-- lsp.deno.setup{on_attach=on_attach}
--
function stop_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
  }
)
