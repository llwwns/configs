vim.g.polyglot_disabled = { "csv", "ruby" }
vim.opt.termguicolors = true
-- pcall(function()
--   vim.cmd "packadd impatient.nvim"
--   return require("impatient").enable_profile()
-- end)
-- require "packers"
require "lazy_init"
require "globals"
require "settings"
require "au"
require "maps"
require "commands"
