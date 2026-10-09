vim.g.polyglot_disabled = { "csv", "ruby" }
vim.opt.termguicolors = true

vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

require('vim._core.ui2').enable()

require "lazy_init"
require "globals"
require "settings"
require "au"
require "maps"
require "commands"
