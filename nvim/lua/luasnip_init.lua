local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require "luasnip.util.events"

ls.snippets = {
  go = {
    s("err", {
      t {
        "if err != nil {",
        "	return ",
      },
      i(0),
      t { "", "}" },
    }),
    s("wrap", {
      t [[errors.Wrap(err, "]],
      i(0),
      t [[")]],
    }),
    s("for", {
      t [[for ]],
      i(1),
      t [[, ]],
      i(2),
      t [[ := range ]],
      i(3),
      t { " {", "	" },
      i(0),
      t { "", "}" },
    }),
  },
  cpp = {
    s("main", {
      t {
        "#include<iostream>",
        "",
        "using namespace std;",
        "",
        "int main() {",
        "    ",
      },
      i(0),
      t { "", "}" },
    }),
    s("leetcode", {
      t {
        "#include<iostream>",
        "#include<algorithm>",
        "#include<vector>",
        "#include<stack>",
        "#include<queue>",
        "",
        "using namespace std;",
        "",
        "",
      },
      i(0),
      t {
        "",
        "",
        "int main() {",
        "    ",
        "}",
      },
    }),
  },
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() then
    return t "<C-n>"
  elseif ls.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
    return t "<Tab>"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() then
    return t "<C-p>"
  elseif ls.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    return t "<S-Tab>"
  end
end
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<c-l>", "<Plug>luasnip-expand-or-jump", {})
vim.api.nvim_set_keymap("s", "<c-l>", "<Plug>luasnip-expand-or-jump", {})
vim.api.nvim_set_keymap("i", "<c-k>", "<Plug>luasnip-jump-prev", {})
vim.api.nvim_set_keymap("s", "<c-k>", "<Plug>luasnip-jump-prev", {})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
