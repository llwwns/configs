-- :fennel:generated
require("words")
local cmp = require("cmp")
local mapping = cmp.mapping.preset.insert({["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<C-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})})
local function _1_(args)
  return (require("luasnip")).lsp_expand(args.body)
end
local function _2_(entry, vim_item)
  local kind = (require("lspkind")).cmp_format({mode = "symbol_text", maxwidth = 50})(entry, vim_item)
  local strings = vim.split(kind.kind, "%s+", {trimempty = true})
  do end (kind)["kind"] = (" " .. strings[1] .. " ")
  do end (kind)["menu"] = ("    (" .. strings[2] .. ")")
  return kind
end
cmp.setup({snippet = {expand = _1_}, mapping = mapping, window = {completion = {winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None", col_offset = -3, side_padding = 0}, documentation = cmp.config.window.bordered({border = "single"})}, sources = {{name = "nvim_lsp_signature_help"}, {name = "luasnip"}, {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "path"}, {name = "buffer"}, {name = "words", max_item_count = 7}}, preselect = cmp.PreselectMode.None, formatting = {fields = {"kind", "abbr", "menu"}, format = _2_}, completion = {keyword_length = 2}})
cmp.setup.cmdline("/", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "path"}, {name = "cmdline"}}})