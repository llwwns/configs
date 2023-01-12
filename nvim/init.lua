vim.g.polyglot_disabled = { "csv", "ruby" }
vim.opt.termguicolors = true
vim.mapleader = "'"
vim.maplocalleader = "'"
require "lazy_init"
require "globals"
require "settings"
require "au"
require "maps"
require "commands"
