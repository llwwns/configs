vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup {
  view = {
    width = 30,
    side = "left",
    auto_resize = false,
  },
}
