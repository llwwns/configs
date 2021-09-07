  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },

    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    },

    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'path' },
    },
    preselect = cmp.Preselect.None,
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = "[" .. require'lspkind'.presets.default[vim_item.kind] .. "] " .. vim_item.kind
        return vim_item
      end
    },
    completion = {
      keyword_length = 2
    },
  }
