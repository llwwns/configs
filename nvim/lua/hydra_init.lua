-- :fennel:generated
local Hydra = require("hydra")
Hydra({name = "Side scroll", mode = "n", body = "z", color = "pink", heads = {{"h", "5zh"}, {"l", "5zl", {desc = "\226\134\144/\226\134\146"}}, {"H", "zH"}, {"L", "zL", {desc = "half screen \226\134\144/\226\134\146"}}}})
Hydra({name = "window control", mode = {"n", "v", "i", "t"}, body = "<c-w>", heads = {{"<", "5<c-w><"}, {">", "5<c-w>>"}, {"+", "5<c-w>+"}, {"-", "5<c-w>-"}}})
do end (vim.g)["mapleader"] = "'"
vim.g["maplocalleader"] = "'"
return Hydra({name = "vimspector", mode = {"n"}, body = "<leader>d", config = {color = "pink"}, heads = {{"c", "<Plug>VimspectorContinue"}, {"r", "<Plug>VimspectorRunToCursor"}, {"o", "<Plug>VimspectorStepOver"}, {"i", "<Plug>VimspectorStepInto"}, {"O", "<Plug>VimspectorStepOut"}, {"b", "<Plug>VimspectorToggleBreakpoint"}, {"x", "<Plug>VimspectorToggleConditionalBreakpoint"}}})