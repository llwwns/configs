vim.g.polyglot_disabled = { "csv", "ruby" }
pcall(function()
  vim.cmd "packadd impatient.nvim"
  return require("impatient").enable_profile()
end)
require "packers"
require "globals"
require "settings"
require "au"
require "maps"
require "commands"
