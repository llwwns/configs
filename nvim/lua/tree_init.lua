-- :fennel:generated
local tree_cb = (require("nvim-tree.config")).nvim_tree_callback
return (require("nvim-tree")).setup({view = {width = 30, side = "left"}, actions = {open_file = {resize_window = false}}, renderer = {icons = {show = {file = true, folder = true, folder_arrow = true, git = false}}, indent_markers = {enable = true}}})