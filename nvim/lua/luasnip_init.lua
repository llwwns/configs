-- :fennel:generated
local ls = require("luasnip")
local snippet = ls.snippet
local text_node = ls.text_node
local snippet_node = ls.snippet_node
local isn = ls.indent_snippet_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local dynamic_node = ls.dynamic_node
local events = require("luasnip.util.events")
local l = (require("luasnip.extras")).l
local postfix = (require("luasnip.extras.postfix")).postfix
local function _1_(_241, _242)
  return snippet_node(nil, {text_node({("errors.Wrap(" .. _242.env.POSTFIX_MATCH .. ", \"")}), i(1), text_node({"\")"})})
end
local function _2_(_241, _242)
  return snippet_node(nil, {text_node({(_242.env.POSTFIX_MATCH .. " = make(")}), i(1), text_node({")"})})
end
ls.add_snippets("go", {snippet("err", {text_node({"if err != nil {", "\9return "}), i(0), text_node({"", "}"})}), snippet("erris", {text_node({"errors.Is("}), i(1, "err"), text_node({", "}), i(2), text_node({")"}), i(0)}), snippet("wrap", {text_node({"errors.Wrap(err, \""}), i(0), text_node({"\")"})}), postfix(".wrap", dynamic_node(1, _1_)), postfix(".make", dynamic_node(1, _2_)), snippet("for", {text_node({"for "}), i(1), text_node({", "}), i(2), text_node({" := range "}), i(3), text_node({" {", "\9"}), i(0), text_node({"", "}"})})})
ls.add_snippets("cpp", {snippet("main", {text_node({"#include<iostream>", "", "using namespace std;", "", "int main() {", "    "}), i(0), text_node({"", "}"})}), snippet("leetcode", {text_node({"#include<iostream>", "#include<algorithm>", "#include<vector>", "#include<stack>", "#include<queue>", "", "using namespace std;", "", ""}), i(0), text_node({"", "", "int main() {", "    ", "}"})})})
vim.keymap.set({"i"}, "<c-l>", "<Plug>luasnip-expand-or-jump", {silent = true})
vim.keymap.set({"s"}, "<c-l>", "<Plug>luasnip-expand-or-jump", {silent = true})
vim.keymap.set({"i"}, "<c-k>", "<Plug>luasnip-jump-prev", {silent = true})
vim.keymap.set({"s"}, "<c-k>", "<Plug>luasnip-jump-prev", {silent = true})
vim.keymap.set({"i"}, "<C-E>", "<Plug>luasnip-next-choice", {silent = true})
return vim.keymap.set({"s"}, "<C-E>", "<Plug>luasnip-next-choice", {silent = true})