local function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_create_augroup(group_name, {})
    for _, def in ipairs(definition) do
      def[2].group = group_name
      vim.api.nvim_create_autocmd(def[1], def[2])
    end
  end
end

augroups {
  numbertoggle = {
    {
      { "BufEnter", "FocusGained", "InsertLeave" },
      {
        callback = function()
          vim.opt.relativenumber = true
        end,
      },
    },
    {
      { "BufLeave", "FocusLost", "InsertEnter" },
      {
        callback = function()
          vim.opt.relativenumber = false
        end,
      },
    },
  },
  highlight_yank = {
    {
      "TextYankPost",
      {
        callback = function()
          vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
        end,
      },
    },
  },
  buf_large = {
    {
      "BufReadPre",
      {
        command = 'if getfsize(expand(" % ")) > 10000000 | syntax off | endif',
      },
    },
  },
  fugitive_buf = {
    {
      "BufReadPost",

      {
        pattern = "fugitive://* ",
        command = "set bufhidden=delete",
      },
    },
  },
  term = {
    {
      "TermOpen",
      { command = "IndentBlanklineDisable" },
    },
  },
  filetypes = {
    {
      "FileType",
      {
        pattern = "make",
        callback = function()
          vim.opt_local.tabstop = 8
          vim.opt_local.expandtab = false
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "nginx",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.expandtab = false
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "lua",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.b.format_on_save = true
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "go",
        callback = function()
          vim.opt_local.expandtab = false
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.b.format_on_save = true
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "c",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.opt_local.tabstop = 4
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "cpp",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.opt_local.tabstop = 4
          vim.keymap.set("n", "<leader>cm", "<cmd>!clang++ -std=c++17 -g3 % <CR>", { buffer = true })
          vim.keymap.set("n", "<leader>cr", "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>", { buffer = true })
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "rust",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.opt_local.tabstop = 4
          vim.b.format_on_save = true
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "ruby",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.b.format_on_save = true
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "json",
        callback = function()
          vim.keymap.set("n", "[j", vim.fn.JsonBeautify, {})
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "toml",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "v:lua.tomlFold()"
        end,
      },
    },
    {
      "FileType",
      {
        pattern = { "javascript", "javascript.jsx", "typescript", "typescriptreact" },
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.b.format_on_save = true
        end,
      },
    },
    {
      "FileType",
      {
        pattern = "autohotkey",
        callback = function()
          vim.opt_local.tabstop = 4
        end,
      },
    },
    {
      { "BufNewFile", "BufRead" },
      {
        pattern = { "*.tsv", "*.csv" },
        command = "set filetype=csv",
      },
    },
    {
      "FileType",
      {
        pattern = "csv",
        callback = function()
          vim.keymap.set("n", "[c", "<cmd>RainbowAlign<CR>", { buffer = true })
          vim.keymap.set("n", "]c", "<cmd>RainbowShrink<CR>", { buffer = true })
        end,
      },
    },

    {
      { "BufEnter", "BufWinEnter" },
      {
        pattern = { "*.cue" },
        command = "set filetype=cue",
      },
    },
  },
}

-- augroups {
--   filetypes = {
-- "FileType json nmap [j :call JsonBeautify() <CR>",
-- "FileType json set foldmethod=expr",
-- "FileType json set foldexpr=nvim_treesitter#foldexpr()",
-- "FileType confluencewiki setlocal fdm=expr",
-- "FileType confluencewiki setlocal fdl=0",
-- "FileType confluencewiki setlocal fdc=1",
-- "BufNewFile,BufRead *.cwk set filetype=confluencewiki",
-- "BufNewFile,BufRead *.coffee set filetype=coffee",
-- },
-- asyncrun = {
--   "QuickFixCmdPost asyncrun botright copen 8",
-- },
-- completion = {
-- "BufEnter * lua local s, com = pcall(require, 'completion'); if s then com.on_attach() end",
-- "User eskk-enable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 0)",
-- "User eskk-disable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 1)",
-- },
-- }
