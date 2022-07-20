-- :fennel:generated
vim.g["g:neo_tree_remove_legacy_commands"] = 1
vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151 ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177 ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\154 ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "\239\160\180", texthl = "DiagnosticSignHint"})
return (require("neo-tree")).setup({close_if_last_window = true, filesystem = {follow_current_file = true, hijack_netrw_behavior = "open_default", filtered_items = {visible = false}}})