-- :fennel:generated
local Hydra = require("hydra")
Hydra({name = "Side scroll", mode = "n", body = "z", heads = {{"h", "5zh"}, {"l", "5zl", {desc = "\226\134\144/\226\134\146"}}, {"H", "zH"}, {"L", "zL", {desc = "half screen \226\134\144/\226\134\146"}}}})
Hydra({name = "window control", mode = {"n", "v", "i", "t"}, body = "<c-w>", heads = {{"<", "5<c-w><"}, {">", "5<c-w>>"}, {"+", "5<c-w>+"}, {"-", "5<c-w>-"}}})
local function _1_()
  return (require("dap")).toggle_breakpoint()
end
local function _2_()
  return (require("dap")).set_breakpoint(vim.fn.input("Breakpoint condition: "))
end
local function _3_()
  return (require("dap")).continue()
end
local function _4_()
  return (require("dap")).step_over()
end
local function _5_()
  return (require("dap")).step_into()
end
local function _6_()
  return (require("dap")).step_out()
end
return Hydra({name = "dap", mode = {"n"}, body = "<leader>d", config = {color = "pink"}, heads = {{"b", _1_}, {"B", _2_}, {"c", _3_}, {"n", _4_}, {"i", _5_}, {"o", _6_}}})