config_path=vim.fn.stdpath("config")
vim.g.polyglot_disabled = {'csv', 'ruby'}
vim.cmd [[packadd packer.nvim]]
require("packers")
require("globals")
require("setting")
require("au")
require("maps")
require("commands")
require("lsp")
require("treesitter")
