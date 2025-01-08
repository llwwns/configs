vim.opt.encoding = "utf-8"
vim.opt.timeoutlen = 500
vim.opt.spell = true
vim.opt.spelloptions = "camel"
vim.opt.spellcapcheck = ""
vim.opt.spelllang = "en_us,cjk"
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.colorcolumn = "100"

-- set backspace to delete indent, endo of line and before insert start
vim.opt.backspace = { "indent", "eol", "start" }
-- allow cursor go to next line
vim.opt.whichwrap = "b,s,<,>,[,]"
vim.opt.swapfile = false
vim.opt.undofile = false

vim.opt.termguicolors = true
vim.opt.fileencodings = { "utf-8", "iso-2022-jp", "euc-jp", "sjis", "utf-16", "utf-16le", "gb2312" }

vim.opt.shiftwidth = 0
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.updatetime = 10000
vim.opt.signcolumn = "yes"
-- vim.opt.inccommand = "nosplit"
vim.opt.inccommand = ""
vim.opt.formatoptions = (vim.opt.formatoptions - { "c", "r", "o" })
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 18

vim.opt.grepprg = "rg --vimgrep"
vim.opt.wrap = false
vim.opt.display = "lastline"
vim.opt.pumheight = 10
vim.opt.list = true
vim.opt.listchars = { eol = "¬", tab = "| ", extends = "»", precedes = "«" }
vim.opt.completeopt = "menuone,noselect"
vim.opt.shortmess = "atToOFcA"
vim.opt.sessionoptions = { "blank", "curdir", "folds", "tabpages" }
vim.opt.fillchars = {
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  fold = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
  eob = " ",
}
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.hidden = true
vim.opt.spellfile = (vim.fn.stdpath("config") .. "/spell/en.utf-8.add")

vim.opt.diffopt = "internal,filler,algorithm:patience,indent-heuristic,closeoff,linematch:120"

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })

vim.g.mapleader = "'"
vim.g.maplocalleader = "'"
vim.g.vim_json_syntax_conceal = 0
vim.g["eskk#large_dictionary"] = { path = "~/configs/SKK-JISYO.L", sorted = 1, encoding = "euc-jp" }

vim.g.vim_json_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- vim.g.tokyonight_style = "night"
-- vim.cmd.colorscheme "tokyonight-night"
vim.cmd.colorscheme "kanagawa"

vim.opt.foldminlines = 1
vim.opt.foldtext = "v:lua.foldtext2()"
vim.opt.foldcolumn = "1"
vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.conceallevel = 0
vim.opt.splitkeep = "screen"

if (vim.fn.exists("gnvim") == 1) then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h10"
  vim.opt.guicursor = (vim.o.guicursor .. ",a:blinkon0")
elseif (vim.fn.exists("neovide") == 1) then
  -- vim.opt.guifont = "JetBrainsMono Nerd Font:h10"
  vim.opt.guifont = "0xProto:h11"
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_length = 0.1
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_transparency = 0.9
  vim.g.transparency = 0.9
  vim.opt.mouse = "a"
  vim.keymap.set({ "n" }, "<A-CR>",
    "<cmd>execute('let g:neovide_fullscreen = !g:neovide_fullscreen')<CR>",
    { noremap = true, silent = true })
elseif vim.keymap.set({ "t" }, "<c-s-v>", "<c-\\><c-n>\"+pa", { noremap = true, silent = true }) then
  vim.opt.guifont = "Sarasa Nerd Font:h18"
end
-- vim.opt.statuscolumn="%=%s%{%v:lua.line_mark()%}%{v:lua.fold_mark()} "
