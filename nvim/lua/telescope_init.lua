local actions = require "telescope.actions"
local sorters = require "telescope.sorters"
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    prompt_position = "top",
    sorting_strategy = "ascending",
  },
}
