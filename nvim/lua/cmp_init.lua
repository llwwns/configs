-- :fennel:generated
require("words")
local cmp = require("cmp")
local mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<C-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})}
local function _1_(args)
  return (require("luasnip")).lsp_expand(args.body)
end
local function _2_(entry, vim_item)
  local lspkind = require("lspkind")
  do end (vim_item)["kind"] = ("[" .. lspkind.presets.default[vim_item.kind] .. "] " .. vim_item.kind)
  return vim_item
end
cmp.setup({snippet = {expand = _1_}, mapping = mapping, sources = {{name = "luasnip"}, {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "path"}, {name = "buffer"}, {name = "words", max_item_count = 7}}, preselect = cmp.PreselectMode.None, formatting = {format = _2_}, completion = {keyword_length = 2}})
cmp.setup.cmdline("/", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "path"}, {name = "cmdline"}}})