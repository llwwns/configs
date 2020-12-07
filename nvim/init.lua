config_path=vim.fn.stdpath("config")
vim.cmd [[packadd packer.nvim]]
require("packers")
require("setting")
require("lsp")

--
-- highlight SpelunkerSpellBad cterm=underline ctermfg=NONE gui=underline guifg=NONE
--
-- hi SpellBad gui=underline guifg=None guibg=None guisp=#848089

