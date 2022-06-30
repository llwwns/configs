-- :fennel:generated
local Hydra = require("hydra")
Hydra({name = "Side scroll", mode = "n", body = "z", heads = {{"h", "5zh"}, {"l", "5zl", {desc = "\226\134\144/\226\134\146"}}, {"H", "zH"}, {"L", "zL", {desc = "half screen \226\134\144/\226\134\146"}}}})
return Hydra({name = "window control", mode = {"n", "v", "i", "t"}, body = "<c-w>", heads = {{"<", "5<c-w><"}, {">", "5<c-w>>"}, {"+", "5<c-w>+"}, {"-", "5<c-w>-"}}})