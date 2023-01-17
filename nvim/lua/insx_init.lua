-- :fennel:generated
local insx = require("insx")
local esc = insx.helper.regex.esc
local endwise = require("insx.recipe.endwise")
for open, close in pairs({["'"] = "'", ["\""] = "\"", ["`"] = "`"}) do
  insx.add(open, require("insx.recipe.auto_pair")({open = open, close = close, ignore_pat = "\\\\\\%#"}))
  insx.add(close, require("insx.recipe.jump_next")({jump_pat = {("\\%#" .. esc(close) .. "\\zs")}}))
  insx.add("<BS>", require("insx.recipe.delete_pair")({open_pat = esc(open), close_pat = esc(close)}))
end
for open, close in pairs({["("] = ")", ["["] = "]", ["{"] = "}"}) do
  insx.add(open, require("insx.recipe.auto_pair")({open = open, close = close}))
  insx.add(close, require("insx.recipe.jump_next")({jump_pat = {("\\%#" .. esc(close) .. "\\zs")}}))
  insx.add("<BS>", require("insx.recipe.delete_pair")({open_pat = esc(open), close_pat = esc(close)}))
  insx.add("<Space>", (require("insx.recipe.pair_spacing")).increase({open_pat = esc(open), close_pat = esc(close)}))
  insx.add("<BS>", (require("insx.recipe.pair_spacing")).decrease({open_pat = esc(open), close_pat = esc(close)}))
  insx.add("<CR>", require("insx.recipe.fast_break")({open_pat = esc(open), close_pat = esc(close)}))
  insx.add("<C-;>", require("insx.recipe.fast_wrap")({close = close}))
end
insx.add("<BS>", require("insx.recipe.delete_pair")({open_pat = insx.helper.search.Tag.Open, close_pat = insx.helper.search.Tag.Close}))
return insx.add("<CR>", require("insx.recipe.fast_break")({open_pat = insx.helper.search.Tag.Open, close_pat = insx.helper.search.Tag.Close}))