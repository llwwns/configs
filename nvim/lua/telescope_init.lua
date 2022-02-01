local actions = require "telescope.actions"
local sorters = require "telescope.sorters"
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
  },
}
require("telescope").load_extension "fzy_native"
