-- :fennel:1654660171
if vim.fn.has("multi_lang") then
  vim.cmd("language C")
else
end
vim.opt["encoding"] = "utf-8"
vim.opt["laststatus"] = 2
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
vim.opt["termguicolors"] = true
vim.opt["fileencodings"] = {"utf-8", "iso-2022-jp", "euc-jpsjis", "utf-16", "utf-16le", "gb2312"}
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
vim.opt["fillchars"] = {horiz = "\226\148\128", horizup = "\226\148\180", horizdown = "\226\148\172", vert = "\226\148\130", vertleft = "\226\148\164", vertright = "\226\148\156", verthoriz = "\226\148\188", fold = " ", diff = " ", eob = " "}
vim.opt["laststatus"] = 3
vim.opt["exrc"] = true
vim.opt["secure"] = true
vim.opt["hidden"] = true
vim.opt["tags"] = "./tags,tags;/"
vim.opt["spellfile"] = (vim.fn.stdpath("config") .. "/spell/en.utf-8.add")
do end (vim.opt)["diffopt"] = "internal,filler,algorithm:patience,indent-heuristic,closeoff"
do
  vim.cmd("filetype plugin indent on")
  vim.cmd("let $FZF_DEFAULT_COMMAND = 'fd'")
  vim.cmd("let $FZF_DEFAULT_OPTS='--layout=reverse'")
  vim.cmd("sign define LspDiagnosticsSignError text=\226\156\151 texthl=ALEErrorSign linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignWarning text=! texthl=ALEWarningSign linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignInformation text=i texthl=ALEInfoSign linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignHint text=\240\159\146\161 texthl=Label linehl= numhl=")
end
vim.g["mapleader"] = "'"
vim.g["maplocalleader"] = "'"
vim.g["vim_json_syntax_conceal"] = 0
vim.g["eskk#large_dictionary"] = {path = "~/configs/SKK-JISYO.L", sorted = 1, encoding = "euc-jp"}
vim.g["eskk#enable_completion"] = 1
vim.g["extra_whitespace_ignored_filetypes"] = {"calendar"}
vim.g["EmacsCommandLineSearchCommandLineDisable"] = 1
vim.g["indent_blankline_char"] = "\226\148\130"
vim.g["indent_blankline_show_current_context"] = true
vim.g["vim_json_conceal"] = 0
vim.g["vim_markdown_conceal"] = 0
vim.g["vim_markdown_conceal_code_blocks"] = 0
vim.g["gitgutter_highlight_linenrs"] = 1
vim.g["rainbow_active"] = 1
vim.g["Illuminate_delay"] = 0
vim.g["signify_sign_change"] = "~"
vim.g["tokyonight_style"] = "night"
do
  vim.cmd("colorscheme tokyonight")
end
vim.g["mergetool_layout"] = "LmR"
vim.g["mergetool_prefer_revision"] = "unmodified"
vim.g["deleft_mapping"] = "<leader>dh"
vim.g["symbols_outline"] = {position = "left", width = 16}
vim.opt["foldminlines"] = 1
vim.opt["foldtext"] = "v:lua.foldtext2()"
vim.opt["dictionary"] = "/usr/share/dict/words"
vim.g["cmp_dictionary_exact"] = 2
vim.g["diff_translations"] = 0
vim.g["Hexokinase_highlighters"] = "backgroundfull"
return nil