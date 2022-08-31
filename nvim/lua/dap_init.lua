-- :fennel:generated
local dap = require("dap")
do end (dap.adapters)["lldb"] = {type = "executable", command = "/usr/bin/lldb-vscode", name = "lldb"}
local function _1_(callback, config)
  return callback({type = "server", host = "127.0.0.1", port = "${port}", executable = {command = "rdbg", args = {"--open", "--port", "${port}", config.script}}})
end
dap.adapters["rdbg"] = _1_
dap.configurations["cpp"] = {{name = "Launch", type = "lldb", request = "launch", program = "./a.out", cwd = "${workspaceFolder}", stopOnEntry = false, args = {}}}
dap.configurations["ruby"] = {{type = "rdbg", name = "debug current file", request = "attach", localfs = true, command = "ruby", script = "${file}"}}
local dapui = require("dapui")
dapui.setup({mappings = {expand = {"<Tab>", "<2-LeftMouse>"}, open = "o", remove = "d", edit = "e", repl = "r", toggle = "t"}, layouts = {{elements = {{id = "breakpoints", size = 0.25}, {id = "stacks", size = 0.25}, {id = "watches", size = 0.25}, {id = "scopes", size = 0.25}}, size = 60, position = "left"}, {elements = {"repl", "console"}, size = 0.25, position = "bottom"}}})
local function _2_()
  return dapui.open()
end
dap.listeners.after.event_initialized["dapui_config"] = _2_
local function _3_()
  return dapui.close()
end
dap.listeners.before.event_terminated["dapui_config"] = _3_
local function _4_()
  return dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = _4_
return nil