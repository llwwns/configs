-- :fennel:generated
vim.opt["encoding"] = "utf-8"
vim.opt["timeoutlen"] = 500
vim.opt["spell"] = true
vim.opt["spelloptions"] = "camel"
vim.opt["spellcapcheck"] = ""
vim.opt["hlsearch"] = true
vim.opt["number"] = true
vim.opt["relativenumber"] = true
vim.opt["background"] = "dark"
vim.opt["colorcolumn"] = "100"
vim.opt["backspace"] = {"indent", "eol", "start"}
vim.opt["whichwrap"] = "b,s,<,>,[,]"
vim.opt["swapfile"] = false
vim.opt["undofile"] = false
vim.opt["termguicolors"] = true
vim.opt["fileencodings"] = {"utf-8", "iso-2022-jp", "euc-jp", "sjis", "utf-16", "utf-16le", "gb2312"}
vim.opt["shiftwidth"] = 0
vim.opt["tabstop"] = 2
vim.opt["softtabstop"] = -1
vim.opt["shiftwidth"] = 0
vim.opt["tabstop"] = 2
vim.opt["softtabstop"] = -1
vim.opt["expandtab"] = true
vim.opt["autoindent"] = false
vim.opt["updatetime"] = 1000
vim.opt["signcolumn"] = "yes"
vim.opt["inccommand"] = "nosplit"
vim.opt["formatoptions"] = (vim.opt.formatoptions - {"c", "r", "o"})
do end (vim.opt)["foldmethod"] = "indent"
vim.opt["foldlevel"] = 18
vim.opt["grepprg"] = "rg --vimgrep"
vim.opt["wrap"] = false
vim.opt["display"] = "lastline"
vim.opt["pumheight"] = 10
vim.opt["list"] = true
vim.opt["listchars"] = {eol = "\194\172", tab = "| ", extends = "\194\187", precedes = "\194\171"}
vim.opt["completeopt"] = "menuone,noselect"
vim.opt["shortmess"] = "atToOFcA"
vim.opt["sessionoptions"] = {"blank", "curdir", "folds", "tabpages"}
vim.opt["fillchars"] = {horiz = "\226\148\128", horizup = "\226\148\180", horizdown = "\226\148\172", vert = "\226\148\130", vertleft = "\226\148\164", vertright = "\226\148\156", verthoriz = "\226\148\188", fold = " ", foldopen = "\239\145\188", foldclose = "\239\145\160", diff = "\226\149\177", eob = " "}
vim.opt["laststatus"] = 3
vim.opt["cmdheight"] = 0
vim.opt["exrc"] = true
vim.opt["secure"] = true
vim.opt["hidden"] = true
vim.opt["spellfile"] = (vim.fn.stdpath("config") .. "/spell/en.utf-8.add")
do end (vim.opt)["diffopt"] = "internal,filler,algorithm:patience,indent-heuristic,closeoff,linematch:120"
vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignHint", {text = "\239\129\154", texthl = "DiagnosticSignHint"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\153", texthl = "DiagnosticSignInfo"})
do end (vim.g)["mapleader"] = "'"
vim.g["maplocalleader"] = "'"
vim.g["vim_json_syntax_conceal"] = 0
vim.g["eskk#large_dictionary"] = {path = "~/configs/SKK-JISYO.L", sorted = 1, encoding = "euc-jp"}
vim.g["vim_json_conceal"] = 0
vim.g["vim_markdown_conceal"] = 0
vim.g["vim_markdown_conceal_code_blocks"] = 0
vim.g["tokyonight_style"] = "night"
do
  vim.cmd("colorscheme tokyonight-night")
end
vim.opt["foldminlines"] = 1
vim.opt["foldtext"] = "v:lua.foldtext2()"
vim.opt["foldcolumn"] = "1"
vim.opt["dictionary"] = "/usr/share/dict/words"
vim.opt["conceallevel"] = 0
if (1 == vim.fn.exists("gnvim")) then
  vim.opt["guifont"] = "Iosevka Fixed:h12"
  vim.opt["guicursor"] = (vim.o.guicursor .. ",a:blinkon0")
  return nil
elseif (1 == vim.fn.exists("neovide")) then
  vim.opt["guifont"] = "JetBrainsMono Nerd Font:h10"
  vim.g["neovide_cursor_animation_length"] = 0
  vim.g["neovide_cursor_trail_length"] = 0.1
  vim.g["neovide_scroll_animation_length"] = 0
  vim.opt["mouse"] = "a"
  return vim.keymap.set({"n"}, "<A-CR>", "<cmd>execute('let g:neovide_fullscreen = !g:neovide_fullscreen')<CR>", {noremap = true, silent = true})
elseif vim.keymap.set({"t"}, "<c-s-v>", "<c-\\><c-n>\"+pa", {noremap = true, silent = true}) then
  return (1 == vim.fn.exists("g:fvim_loaded"))
else
  vim.opt["guifont"] = "Sarasa Nerd Font:h18"
  return nil
end