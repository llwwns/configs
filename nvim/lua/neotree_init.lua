vim.g["g:neo_tree_remove_legacy_commands"] = 1

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

return (require("neo-tree")).setup({
  close_if_last_window = false,
  source_selector = {
    winbar = true,
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_default",
    filtered_items = {
      visible = false,
    },
  },
  window = {
    mappings = {
      y = "nop",
      yy = "copy_to_clipboard",
    }
  }
})
