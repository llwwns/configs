local Hydra = require("hydra")

Hydra({
  name = "Side scroll",
  mode = "n",
  body = "z",
  heads = {
    { "h", "5zh" },
    { "l", "5zl", { desc = "←/→" } },
    { "H", "zH" },
    { "L", "zL", { desc = "half screen ←/→" } },
  },
})

Hydra({
  name = "window control",
  mode = { "n", "v", "i", "t" },
  body = "<c-w>",
  heads = { { "<", "5<c-w><" }, { ">", "5<c-w>>" }, { "+", "5<c-w>+" }, { "-", "5<c-w>-" } }
})

return Hydra({
  name = "dap",
  mode = { "n" },
  body = "<leader>d",
  config = { color = "pink" },
  heads = {
    { "bb", function() require("dap").toggle_breakpoint() end },
    { "bc", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end },
    { "bh",
      function() require("dap").set_breakpoint(nil, vim.fn.input('Hit count: ')) end },
    { "bl",
      function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
    { "c", function() require("dap").continue() end },
    { "n", function() require("dap").step_over() end },
    { "i", function() require("dap").step_into() end },
    { "o", function() return require("dap").step_out() end },
    { "t", function() require("dap").terminate() end },
  },
})
