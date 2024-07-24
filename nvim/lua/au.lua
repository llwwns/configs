local map = vim.keymap.set

--- @param definitions { [string]: (string|{callback?: function, pattern: string, command?:string })[] }
local function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_create_augroup(group_name, { clear = true })
    for _, def in ipairs(definition) do
      def[2].group = group_name
      vim.api.nvim_create_autocmd(def[1], def[2])
    end
  end
end

augroups {
  highlight_yank = {
    {
      "TextYankPost", {
      callback = function() vim.highlight.on_yank({ higroup = "Visual", timeout = 200 }) end,
      pattern = "*",
    } },
  },
  buf_large = {
    {
      "BufReadPre", {
      pattern = "*",
      callback = function()
        local ok, stats = pcall(vim.loop.fs_stat,
          vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
        if (ok and stats and (stats.size > 1000000)) then
          vim.b["large_buf"] = true
          vim.cmd("syntax off")
          vim.cmd.IlluminatePauseBuf()
          vim.cmd.IBLDisable()
          vim.cmd.NoMatchParen()
          vim.opt_local.foldmethod = "manual"
          vim.opt_local.spell = false
        else
          vim.b.large_buf = false
        end
      end,
    }
    },
  },
  fugitive_buf = {
    {
      "BufReadPost", { pattern = "fugitive://*", command = "set bufhidden=delete" }
    },
  },
  -- term = {
  --   {
  --     "TermOpen", { pattern = "*", command = "IndentBlanklineDisable" }
  --   },
  -- },
  -- autoclose = {
  --   {
  --     "WinEnter", {
  --     pattern = "*",
  --     callback = function()
  --       if _G.__latest_id then
  --         _G.__latest_id = _G.__latest_id + 1
  --       else
  --         _G.__latest_id = 1
  --       end
  --       if (_G.is_special(vim.api.nvim_get_current_win()) and _G.all_special()) then
  --         local id = _G.__latest_id
  --         vim.defer_fn(function()
  --           if (id == _G.__latest_id) then
  --             vim.cmd.quit()
  --           end
  --         end, 0)
  --       end
  --     end,
  --   }
  --   }
  -- },
  visualmode = {
    {
      "ModeChanged", {
      callback = function()
        local evt = vim.v.event
        if ((type(evt) == "table") and (evt.new_mode == "i") and (evt.old_mode == "")) then
          vim.opt_local.indentkeys = ""
        elseif ((type(evt) == "table") and (evt.old_mode == "i")) then
          vim.opt_local.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"
        end
      end,
      pattern = "*"
    }
    }
  },
  filetypes2 = {
    {
      "FileType", {
      pattern = "make",
      callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.expandtab = false
      end,
    }
    },
    {
      "FileType", {
      pattern = "help",
      callback = function()
        vim.opt_local.conceallevel = 0
      end,
    }
    },
    {
      "FileType", {
      pattern = "nginx",
      callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = false
      end,
    }
    },
    {
      "FileType", {
      pattern = { "lua" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.b.format_on_save = true
      end,
    }
    },
    {
      "FileType", {
      pattern = { "ruby" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.b.format_on_save = true
        vim.keymap.set("n", "<leader>cr", "<cmd>!ruby %<CR>", { buffer = true, silent = false })
      end,
    }
    },
    {
      "FileType", {
      pattern = "go",
      callback = function()
        vim.opt_local.expandtab = false
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.keymap.set("n", "<leader>cr", "<cmd>!go run %<CR>", { buffer = true, silent = false })
        vim.keymap.set("n", "<leader>td", function()
          require("dap-go").debug_test()
        end, { silent = true })
        vim.b.format_on_save = true
      end,
    }
    },
    {
      "FileType", {
      pattern = { "cpp" },
      callback = function()
        vim.opt_local.tabstop = 4
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.keymap.set("n", "<leader>cm", "<cmd>!clang++ -std=c++20 -g3 % <CR>",
          { buffer = true, silent = false })
        vim.keymap.set("n", "<leader>cr", "<cmd>!clang++ -std=c++20 -g3 % && ./a.out <CR>",
          { buffer = true, silent = false })
      end,
    }
    },
    {
      "FileType", {
      pattern = { "c" },
      callback = function()
        vim.opt_local.tabstop = 4
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.keymap.set("n", "<leader>cm", "<cmd>!clang -g3 % <CR>",
          { buffer = true, silent = false })
        vim.keymap.set("n", "<leader>cr", "<cmd>!clang -g3 % && ./a.out <CR>",
          { buffer = true, silent = false })
      end,
    }
    },
    {
      "FileType", {
      pattern = "rust",
      callback = function()
        vim.opt_local.tabstop = 4
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.b["format_on_save"] = true
      end,
    }
    },
    {
      "FileType", {
      pattern = "json",
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local["foldmethod"] = "expr"
        vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
        vim.keymap.set("n", "[j", function() vim.cmd("%!prettier --parser json") end,
          { buffer = true, silent = false })
        vim.keymap.set("n", "]j", function() return vim.cmd("%!jq -c") end,
          { buffer = true, silent = false })
      end,
    }
    },
    {
      "FileType", {
      pattern = { "toml", "yaml" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    }
    },
    {
      "FileType", {
      pattern = { "javascript", "javascript.jsx", "typescript", "typescriptreact" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local["foldmethod"] = "expr"
        vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
        vim.b["format_on_save"] = true
      end,
    }
    },
    {
      "FileType", {
      pattern = "autohotkey",
      callback = function()
        vim.opt_local["tabstop"] = 4
      end,
    }
    },
    {
      { "BufNewFile", "BufRead" }, {
      pattern = "*.csv",
      command = "set filetype=csv",
    }
    },
    {
      { "BufNewFile", "BufRead" }, {
      pattern = "*.tsv",
      command = "set filetype=tsv",
    }
    },
    {
      "FileType", {
      pattern = { "csv", "tsv" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.keymap.set("n", "[c", "<cmd>RainbowAlign<CR>", { buffer = true, silent = false })
        vim.keymap.set("n", "]c", "<cmd>RainbowShrink<CR>", { buffer = true, silent = false })
      end,
    },
    },
    {
      { "BufNewFile", "BufRead" }, {
      pattern = "*.cue",
      command = "set filetype=cue",
    }
    },
    {
      { "BufNewFile", "BufRead" }, {
      pattern = "todo.txt",
      command = "set filetype=todo",
    }
    },
    {
      "FileType", {
      pattern = "proto",
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    }
    },
    {
      "FileType", {
      pattern = { "sh", "bash" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          callback = function()
            require("lint").try_lint()
          end,
        })
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    }
    },
    {
      "FileType", {
      pattern = { "fish" },
      callback = function()
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    }
    },
    {
      "FileType", {
      pattern = "markdown",
      callback = function()
        vim.keymap.set("n", "<leader>po", function() return (require("peek")).open() end,
          { silent = true })
        vim.keymap.set("n", "<leader>pc", function() return (require("peek")).close() end,
          { silent = true })
      end,
    }
    },
    {
      "FileType", {
      pattern = "vimwiki",
      callback = function()
        vim.opt_local.foldmethod = "marker"
        vim.api.nvim_create_autocmd(
          "BufWritePre", {
            callback = function()
              vim.cmd.Vimwiki2HTML()
            end,
            buffer = 0,
          })
      end,
    }
    },
    {
      "FileType", {
      pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
      },
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    }
    },
    {
      "FileType", {
      pattern = "neorepl",
      callback = function()
        require('cmp').setup.buffer({ enabled = false })
        -- vim.b.indent_blankline_enabled = false
      end,
    }
    },
  },
  format = {
    { "BufWritePre", {
      callback = function(args)
        if (vim.b.format_on_save and
              not vim.b.large_buf and
              not vim.regex("\\vfugitive:\\/\\/"):match_str(vim.fn.expand "%")) then
          require("conform").format({
            bufnr = args.buf,
            lsp_fallback = true,
          })
        end
      end
    }
    },
  },
  lsp = {
    {
      "LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end
        if client.server_capabilities then
          client.server_capabilities.semanticTokensProvider = nil
          if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          end
          if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
          end
        end
        -- if
        --     client.server_capabilities.documentFormattingProvider
        --     and not vim.regex("\\vfugitive:\\/\\/"):match_str(vim.fn.expand "%")
        -- then
        --   vim.opt_local.formatexpr = "v:lua.vim.lsp.formatexpr"
        --   vim.api.nvim_create_autocmd(
        --     "BufWritePre", {
        --       callback = _G.lsp_format,
        --       buffer = 0,
        --     })
        -- end
        if vim.lsp.buf.inlay_hint and client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
        map("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>",
          { buffer = true, noremap = true, silent = true })
        map("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>",
          { buffer = true, noremap = true, silent = true })
        map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
          { buffer = true, noremap = true, silent = true })
        map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
          { buffer = true, noremap = true, silent = true })
        map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
          { buffer = true, noremap = true, silent = true })
        -- map("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { buffer = true, noremap = true, silent = true })
        map(
          "n",
          "gs",
          "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
          { buffer = true, noremap = true, silent = true }
        )
        map("n", "<leader>rn", "<cmd>Lsp rename<CR>",
          { buffer = true, noremap = true, silent = true })
        map("n", "<leader>da", "<cmd>lua vim.lsp.buf.code_action()<CR>",
          { buffer = true, noremap = true, silent = true })
        map(
          "v",
          "<leader>da",
          "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>",
          { buffer = true, noremap = true, silent = true }
        )
        -- client.server_capabilities["documentHighlightProvider"] = false

        if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
          require "nvim-navic".attach(client, bufnr)
        end
        return nil
      end
    }
    },
    {
      "LspDetach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        vim.cmd("setlocal tagfunc< omnifunc<")
      end
    }
    },
  },
  terminal = {
    { "TermOpen", {
      callback = function()
        vim.opt_local.spell = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.winbar = ""
        vim.opt_local.signcolumn = "no"
        vim.opt_local.winhighlight = "Normal:NormalFloat"
        vim.opt_local.buflisted = false
        vim.opt_local.filetype = "toggleterm"
      end
    }
    },
    { { "WinEnter", "BufWinEnter", "TermOpen" }, {
      callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
          vim.cmd.startinsert()
        end
      end
    }
    }
  },
  babecue = {
    {
      {
        "WinResized",
        "Filetype",
        "CursorMoved",
        "InsertLeave",
        -- "BufModifiedSet",
      }, {
      callback = function() require("barbecue.ui").update() end
    }
    }
  }
  -- eskk = {
  --   {
  --     "eskk-enable-pre", {
  --     callback = function()
  --       vim.opt_local.cmdheight = 1
  --     end
  --   }
  --   },
  --   {
  --     "eskk-disable-pre", {
  --     callback = function()
  --       vim.opt_local.cmdheight = 1
  --     end
  --   }
  --   },
  -- },
}
