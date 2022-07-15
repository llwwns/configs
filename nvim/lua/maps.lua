-- :fennel:generated
vim.g["mapleader"] = "'"
vim.g["maplocalleader"] = "'"
vim.keymap.set({"n"}, "Q", "<nop>", {silent = true})
vim.keymap.set({"n"}, "q", "<nop>", {silent = true})
vim.keymap.set({"n"}, "q:", "q:", {noremap = true, silent = true})
vim.keymap.set({"n"}, "q/", "q/", {noremap = true, silent = true})
vim.keymap.set({"n"}, "Q", "Q", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>q", "q", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<c-q>", "<cmd>q<CR>", {silent = false})
local function _1_()
  if (vim.fn.win_gettype() ~= "command") then
    return (require("telescope.builtin")).buffers({sort_lastused = true, sort_mru = true})
  else
    return nil
  end
end
vim.keymap.set({"n"}, "<c-e>", _1_, {silent = true})
local function _3_()
  if (vim.fn.win_gettype() ~= "command") then
    return (require("telescope.builtin")).find_files()
  else
    return nil
  end
end
vim.keymap.set({"n"}, "<c-p>", _3_, {silent = true})
local function _5_()
  return (require("nvim-tree")).toggle(true)
end
vim.keymap.set({"n"}, "<leader><tab>", _5_, {silent = false})
vim.keymap.set({"n", "v"}, "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, noremap = true, silent = false})
vim.keymap.set({"n", "v"}, "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, noremap = true, silent = false})
vim.keymap.set({"n"}, "<PageUp>", "<c-u>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<PageDown>", "<c-d>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<up>", "<c-y>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<down>", "<c-e>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<left>", "zH", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<right>", "zL", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<c-f>", ":Sub/", {noremap = true, silent = true})
vim.keymap.set({"n", "i"}, "<c-w>z", "<cmd>NeoZoomToggle<CR>", {silent = true})
local function _6_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_words({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>w", _6_, {silent = true})
local function _7_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_words({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>b", _7_, {silent = true})
local function _8_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({direction = hint.HintDirection.AFTER_CURSOR}, "\\w\\>")
end
vim.keymap.set({"n", "v"}, "<leader>e", _8_, {silent = true})
local function _9_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({direction = hint.HintDirection.BEFORE_CURSOR}, "\\w\\>")
end
vim.keymap.set({"n", "v"}, "<leader>ge", _9_, {silent = true})
local function _10_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_char1({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>f", _10_, {silent = true})
local function _11_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_char1({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>F", _11_, {silent = true})
local function _12_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_lines({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>j", _12_, {silent = true})
local function _13_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_lines({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v"}, "<leader>k", _13_, {silent = true})
local function _14_()
  return (require("hop")).hint_char2()
end
vim.keymap.set({"n", "v"}, "s", _14_, {silent = true})
local function _15_()
  return (require("hop")).hint_char2()
end
vim.keymap.set({"o"}, "z", _15_, {silent = true})
vim.keymap.set({"n"}, "<leader>a", "<cmd>ArgWrap<CR>", {noremap = true, silent = true})
vim.keymap.set({"c"}, "w!!", "w suda://%", {silent = true})
vim.keymap.set({"n"}, "<Leader>m", "<Plug>(git-messenger)", {silent = true})
vim.keymap.set({"n"}, "[,", ":Tab /,<CR>", {silent = true})
vim.keymap.set({"v"}, "[,", ":'<,'>Tab /,<CR>", {silent = true})
vim.keymap.set({"n"}, "<Leader>t", ":Ttoggle<CR>", {silent = true})
vim.keymap.set({"v"}, "<Leader>r", ":TREPLSendSelection<CR>", {silent = true})
vim.keymap.set({"n"}, "<leader>u", "<cmd>UndotreeToggle<CR>", {silent = true})
vim.keymap.set({"n"}, "K", _G.showDocumentation, {noremap = true, silent = true})
vim.keymap.set({"n"}, "+", "<C-a>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "-", "<C-x>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<C-\\>", ":tab split<CR>:exec('tag '.expand('<cword>'))<CR>", {silent = true})
local function _16_()
  return (require("FTerm")).toggle()
end
vim.keymap.set({"n", "t"}, "<c-s>", _16_, {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>gs", "<cmd>Neogit<CR>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>tf", _G.toggle_format, {noremap = true, silent = true})
vim.keymap.set({"n"}, "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr = true, silent = true})
vim.keymap.set({"n"}, "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr = true, silent = true})
local function _17_()
  return (require("gitsigns")).stage_hunk()
end
vim.keymap.set({"n"}, "<leader>hs", _17_, {silent = true})
local function _18_()
  return (require("gitsigns")).reset_hunk()
end
vim.keymap.set({"n"}, "<leader>hr", _18_, {silent = true})
local function _19_()
  return (require("gitsigns")).stage_hunk()
end
vim.keymap.set({"v"}, "<leader>hs", _19_, {silent = true})
local function _20_()
  return (require("gitsigns")).reset_hunk()
end
vim.keymap.set({"v"}, "<leader>hr", _20_, {silent = true})
local function _21_()
  return (require("gitsigns")).stage_buffer()
end
vim.keymap.set({"n"}, "<leader>hS", _21_, {silent = true})
local function _22_()
  return (require("gitsigns")).undo_stage_hunk()
end
vim.keymap.set({"n"}, "<leader>hu", _22_, {silent = true})
local function _23_()
  return (require("gitsigns")).reset_buffer()
end
vim.keymap.set({"n"}, "<leader>hR", _23_, {silent = true})
local function _24_()
  return (require("gitsigns")).preview_hunk()
end
vim.keymap.set({"n"}, "<leader>hp", _24_, {silent = true})
local function _25_()
  return (require("gitsigns")).blame_line({full = true})
end
vim.keymap.set({"n"}, "<leader>hb", _25_, {silent = true})
local function _26_()
  return (require("gitsigns")).toggle_current_line_blame()
end
vim.keymap.set({"n"}, "<leader>tb", _26_, {silent = true})
vim.keymap.set({"n"}, "<leader>hd", "<cmd>Gdiff<CR>", {silent = true})
local function _27_()
  return (require("gitsigns")).diffthis("~")
end
vim.keymap.set({"n"}, "<leader>hD", _27_, {silent = true})
local function _28_()
  return (require("gitsigns")).toggle_deleted()
end
vim.keymap.set({"n"}, "<leader>td", _28_, {silent = true})
vim.keymap.set({"n"}, "crp", "crcvU", {silent = true})
vim.keymap.set({"n"}, "]d", vim.diagnostic.goto_next, {silent = true})
vim.keymap.set({"n"}, "[d", vim.diagnostic.goto_prev, {silent = true})
vim.keymap.set({"n"}, "<leader>dq", vim.diagnostic.setqflist, {silent = true})
vim.keymap.set({"n"}, "<leader>dl", vim.diagnostic.setloclist, {silent = true})
do
  vim.keymap.set({"n"}, "]a", "<cmd>next<CR>", {silent = true})
  vim.keymap.set({"n"}, "[a", "<cmd>previous<CR>", {silent = true})
  vim.keymap.set({"n"}, "[A", "<cmd>first<CR>", {silent = true})
  vim.keymap.set({"n"}, "]A", "<cmd>last<CR>", {silent = true})
end
do
  vim.keymap.set({"n"}, "]t", "<cmd>tabnext<CR>", {silent = true})
  vim.keymap.set({"n"}, "[t", "<cmd>tabprevious<CR>", {silent = true})
  vim.keymap.set({"n"}, "[T", "<cmd>tabfirst<CR>", {silent = true})
  vim.keymap.set({"n"}, "]T", "<cmd>tablast<CR>", {silent = true})
end
do
  vim.keymap.set({"n"}, "]q", "<cmd>cnext<CR>", {silent = true})
  vim.keymap.set({"n"}, "[q", "<cmd>cprevious<CR>", {silent = true})
  vim.keymap.set({"n"}, "[Q", "<cmd>cfirst<CR>", {silent = true})
  vim.keymap.set({"n"}, "]Q", "<cmd>clast<CR>", {silent = true})
end
do
  vim.keymap.set({"n"}, "]l", "<cmd>lnext<CR>", {silent = true})
  vim.keymap.set({"n"}, "[l", "<cmd>lprevious<CR>", {silent = true})
  vim.keymap.set({"n"}, "[L", "<cmd>lfirst<CR>", {silent = true})
  vim.keymap.set({"n"}, "]L", "<cmd>llast<CR>", {silent = true})
end
do
  vim.keymap.set({"n"}, "]b", "<cmd>bnext<CR>", {silent = true})
  vim.keymap.set({"n"}, "[b", "<cmd>bprevious<CR>", {silent = true})
  vim.keymap.set({"n"}, "[B", "<cmd>bfirst<CR>", {silent = true})
  vim.keymap.set({"n"}, "]B", "<cmd>blast<CR>", {silent = true})
end
vim.keymap.set({"i"}, "<c-a>", "<home>", {noremap = true, silent = true})
vim.keymap.set({"i"}, "<c-e>", "<end>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>ps", "<cmd>PackerSync<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>pc", "<cmd>PackerCompile<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>sc", "<cmd>source ~/.config/nvim/init.lua<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>rp", _G.replace, {noremap = true, silent = true})
vim.keymap.set({"v"}, "P", "\"0p", {noremap = true, silent = true})
return vim.keymap.set({"t"}, "<c-\\><c-v>", "<c-\\><c-n>\"+pa", {noremap = true, silent = true})