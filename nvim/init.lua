config_path=vim.fn.stdpath("config")
vim.g.polyglot_disabled = {'csv', 'ruby'}
require("packers")
require("globals")
require("setting")
require("au")
require("maps")
require("commands")
