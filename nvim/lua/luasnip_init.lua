local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")
local l = (require("luasnip.extras")).l
local postfix = (require("luasnip.extras.postfix")).postfix

ls.add_snippets("go",
  {
    s("err", {
      t({ "if err != nil {", "\9return " }),
      i(0),
      t({ "", "}" }),
    }),
    s("erris", {
      t({ "errors.Is(" }),
      i(1, "err"),
      t({ ", " }),
      i(2),
      t({ ")" }),
      i(0),
    }),
    s("wrap", {
      t({ "errors.Wrap(err, \"" }),
      i(0),
      t({ "\")" }),
    }),
    postfix(".wrap", d(1, function(args, parent)
      return sn(nil, {
        t({ ("errors.Wrap(" .. parent.env.POSTFIX_MATCH .. ", \"") }),
        i(1),
        t({ "\")" }),
      })
    end)),
    postfix(".make", d(1, function(args, parent)
      return sn(nil, {
        t({ (parent.env.POSTFIX_MATCH .. " = make(") }),
        i(1),
        t({ ")" }),
      })
    end)),
    s("for", {
      t({ "for " }), i(1), t({ ", " }), i(2), t({ " := range " }), i(3), t({ " {", "\9" }),
      i(0),
      t({ "", "}" }),
    }) })

ls.add_snippets("cpp",
  {
    s("main", { t({
      "#include<iostream>",
      "",
      "using namespace std;",
      "",
      "int main() {",
      "    " }),
      i(0),
      t({ "", "}" }),
    }),
    s("leetcode", { t({
      "#include<iostream>",
      "#include<algorithm>",
      "#include<vector>",
      "#include<stack>",
      "#include<array>",
      "#include<queue>",
      "#include<ranges>",
      "",
      "using namespace std;",
      "",
      "",
    }), i(0), t({
      "",
      "",
      "int main() {",
      "    ",
      "}",
    }) }),
    postfix(".sort", d(1, function(args, parent)
      return sn(nil,
        {
          t({
            ("sort(" .. parent.env.POSTFIX_MATCH .. ".begin(), " .. parent.env.POSTFIX_MATCH .. ".end());"),
          })
        })
    end)) })

vim.keymap.set({ "i" }, "<c-l>", "<Plug>luasnip-expand-or-jump", { silent = true })
vim.keymap.set({ "s" }, "<c-l>", "<Plug>luasnip-expand-or-jump", { silent = true })
vim.keymap.set({ "i" }, "<c-k>", "<Plug>luasnip-jump-prev", { silent = true })
vim.keymap.set({ "s" }, "<c-k>", "<Plug>luasnip-jump-prev", { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
