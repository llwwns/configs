--- @param definitions { [string]: any[] }
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
          vim.cmd("IlluminatePauseBuf")
          vim.cmd("IndentBlanklineDisable")
          vim.cmd("NoMatchParen")
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
  term = {
    {
      "TermOpen", { pattern = "*", command = "IndentBlanklineDisable" }
    },
  },
  autoclose = {
    {
      "WinEnter", {
      pattern = "*",
      callback = function()
        if _G.__latest_id then
          _G.__latest_id = _G.__latest_id + 1
        else
          _G.__latest_id = 1
        end
        if (_G.is_special(vim.api.nvim_get_current_win()) and _G.all_special()) then
          local id = _G.__latest_id
          return vim.defer_fn(function()
            if (id == _G.__latest_id) then
              return vim.cmd("q")
            end
          end, 0)
        end
      end,
    }
    }
  },
  visualmode = {
    {
      "ModeChanged", { callback = function()
      local evt = vim.v.event
      if ((type(evt) == "table") and (evt.new_mode == "i") and (evt.old_mode == "")) then
        vim.opt_local.indentkeys = ""
      elseif ((type(evt) == "table") and (evt.old_mode == "i")) then
        vim.opt_local.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"
      end
    end, pattern = "*" }
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
      pattern = { "lua", "ruby" },
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
      pattern = { "cpp", "c" },
      callback = function()
        vim.opt_local.tabstop = 4
        if vim.b.large_buf then
          return
        end
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.keymap.set("n", "<leader>cm", "<cmd>!clang++ -std=c++17 -g3 % <CR>",
          { buffer = true, silent = false })
        vim.keymap.set("n", "<leader>cr", "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>",
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
        vim.opt_local.cmdheight = 1
        vim.keymap.set("n", "[c", "<cmd>RainbowAlign<CR>", { buffer = true, silent = false })
        vim.keymap.set("n", "]c", "<cmd>RainbowShrink<CR>", { buffer = true, silent = false })
      end,
    }
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
      pattern = { "sh", "fish" },
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
  },
}
