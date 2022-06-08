-- :fennel:1654652233
local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
do end (require("telescope")).setup({defaults = {mappings = {i = {["<esc>"] = actions.close}}, extensions = {["zf-native"] = {file = {enable = true, highlight_results = true, match_filename = true}, generic = {enable = true, highlight_results = true, match_filename = false}}}, borderchars = {"\226\148\128", "\226\148\130", "\226\148\128", "\226\148\130", "\226\148\140", "\226\148\144", "\226\148\152", "\226\148\148"}, sorting_strategy = "ascending", layout_strategy = "horizontal", layout_config = {horizontal = {prompt_position = "top"}}}})
return (require("telescope")).load_extension("zf-native")