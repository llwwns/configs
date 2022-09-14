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
vim.keymap.set({"n"}, "<leader><tab>", "<cmd>Neotree toggle reveal=true<CR>", {silent = false})
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
local function _5_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_words({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>w", _5_, {silent = true})
local function _6_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_words({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>b", _6_, {silent = true})
local function _7_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({direction = hint.HintDirection.AFTER_CURSOR}, "\\w\\>")
end
vim.keymap.set({"n", "v", "o"}, "<leader>e", _7_, {silent = true})
local function _8_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({direction = hint.HintDirection.BEFORE_CURSOR}, "\\w\\>")
end
vim.keymap.set({"n", "v", "o"}, "<leader>ge", _8_, {silent = true})
local function _9_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_char1({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>f", _9_, {silent = true})
local function _10_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_char1({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>F", _10_, {silent = true})
local function _11_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_lines({direction = hint.HintDirection.AFTER_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>j", _11_, {silent = true})
local function _12_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_lines({direction = hint.HintDirection.BEFORE_CURSOR})
end
vim.keymap.set({"n", "v", "o"}, "<leader>k", _12_, {silent = true})
local function _13_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({}, "[\"']")
end
vim.keymap.set({"n", "v", "o"}, "<leader>'", _13_, {silent = true})
local function _14_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({}, "[\\[(<{]")
end
vim.keymap.set({"n", "v", "o"}, "<leader>[", _14_, {silent = true})
local function _15_()
  local hop = require("hop")
  local hint = require("hop.hint")
  return hop.hint_patterns({}, "[\\])>}]")
end
vim.keymap.set({"n", "v", "o"}, "<leader>]", _15_, {silent = true})
local function _16_()
  return (require("hop")).hint_char2()
end
vim.keymap.set({"n", "v", "o"}, "s", _16_, {silent = true})
local function _17_()
  return (require("hop")).hint_char2()
end
vim.keymap.set({"o"}, "z", _17_, {silent = true})
vim.keymap.set({"n"}, "<leader>a", "<cmd>ArgWrap<CR>", {noremap = true, silent = true})
vim.keymap.set({"c"}, "w!!", "w suda://%", {silent = true})
vim.keymap.set({"n"}, "<Leader>m", "<Plug>(git-messenger)", {silent = true})
vim.keymap.set({"n"}, "[,", ":Tab /,<CR>", {silent = true})
vim.keymap.set({"v"}, "[,", ":'<,'>Tab /,<CR>", {silent = true})
vim.keymap.set({"n"}, "<Leader>t", ":Ttoggle<CR>", {silent = true})
vim.keymap.set({"v"}, "<Leader>r", ":TREPLSendSelection<CR>", {silent = true})
vim.keymap.set({"n"}, "<leader>u", "<cmd>UndotreeToggle<CR>", {silent = true})
vim.keymap.set({"n"}, "K", _G.showDocumentation, {noremap = true, silent = true})
vim.keymap.set({"n"}, "<C-\\>", ":tab split<CR>:exec('tag '.expand('<cword>'))<CR>", {silent = true})
local function _18_()
  return (require("FTerm")).toggle()
end
vim.keymap.set({"n", "t"}, "<c-s>", _18_, {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>gs", "<cmd>Neogit<CR>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>tf", _G.toggle_format, {noremap = true, silent = true})
local function _19_()
  if vim.wo.diff then
    return "]c"
  else
    return "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<CR>"
  end
end
vim.keymap.set({"n"}, "]c", _19_, {expr = true, noremap = true, silent = true})
local function _21_()
  if vim.wo.diff then
    return "[c"
  else
    return "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<CR>"
  end
end
vim.keymap.set({"n"}, "[c", _21_, {expr = true, noremap = true, silent = true})
local function _23_()
  return (require("gitsigns")).stage_hunk()
end
vim.keymap.set({"n", "v"}, "<leader>hs", _23_, {silent = true})
local function _24_()
  return (require("gitsigns")).reset_hunk()
end
vim.keymap.set({"n", "v"}, "<leader>hr", _24_, {silent = true})
local function _25_()
  return (require("gitsigns")).stage_buffer()
end
vim.keymap.set({"n"}, "<leader>hS", _25_, {silent = true})
local function _26_()
  return (require("gitsigns")).undo_stage_hunk()
end
vim.keymap.set({"n"}, "<leader>hu", _26_, {silent = true})
local function _27_()
  return (require("gitsigns")).reset_buffer()
end
vim.keymap.set({"n"}, "<leader>hR", _27_, {silent = true})
local function _28_()
  return (require("gitsigns")).preview_hunk()
end
vim.keymap.set({"n"}, "<leader>hp", _28_, {silent = true})
local function _29_()
  return (require("gitsigns")).blame_line({full = true})
end
vim.keymap.set({"n"}, "<leader>hb", _29_, {silent = true})
local function _30_()
  return (require("gitsigns")).toggle_current_line_blame()
end
vim.keymap.set({"n"}, "<leader>tb", _30_, {silent = true})
local function _31_()
  return (require("gitsigns")).toggle_deleted()
end
vim.keymap.set({"n"}, "<leader>td", _31_, {silent = true})
local function _32_()
  return (require("gitsigns")).diffthis("~")
end
vim.keymap.set({"n"}, "<leader>hD", _32_, {silent = true})
vim.keymap.set({"n"}, "<leader>hd", "<cmd>Gdiff<CR>", {silent = true})
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
local function _33_()
  return (require("illuminate")).goto_next_reference()
end
vim.keymap.set({"n"}, "]w", _33_, {silent = true})
local function _34_()
  return (require("illuminate")).goto_prev_reference()
end
vim.keymap.set({"n"}, "[w", _34_, {silent = true})
vim.keymap.set({"i"}, "<c-a>", "<home>", {noremap = true, silent = true})
vim.keymap.set({"i"}, "<c-e>", "<end>", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<leader>ps", "<cmd>PackerSync<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>pc", "<cmd>PackerCompile<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>sc", "<cmd>source ~/.config/nvim/init.lua<CR>", {silent = false})
vim.keymap.set({"n"}, "<leader>rp", _G.replace, {noremap = true, silent = true})
vim.keymap.set({"v"}, "P", "\"0p", {noremap = true, silent = true})
vim.keymap.set({"t"}, "<c-\\><c-v>", "<c-\\><c-n>\"+pa", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<C-a>", "<Plug>(dial-increment)", {noremap = true, silent = true})
vim.keymap.set({"n"}, "<C-x>", "<Plug>(dial-decrement)", {noremap = true, silent = true})
vim.keymap.set({"v"}, "<C-a>", "<Plug>(dial-increment)", {noremap = true, silent = true})
vim.keymap.set({"v"}, "<C-x>", "<Plug>(dial-decrement)", {noremap = true, silent = true})
vim.keymap.set({"v"}, "g<C-a>", "g<Plug>(dial-increment)", {noremap = true, silent = true})
vim.keymap.set({"v"}, "g<C-x>", "g<Plug>(dial-decrement)", {noremap = true, silent = true})
local function _35_()
  return (require("iswap")).iswap_node_with("left")
end
vim.keymap.set({"n"}, "g<", _35_, {silent = true})
local function _36_()
  return (require("iswap")).iswap_node_with("right")
end
vim.keymap.set({"n"}, "g>", _36_, {silent = true})
local function _37_()
  return (require("iswap")).iswap_node_with()
end
return vim.keymap.set({"n", "x"}, "<leader>s", _37_, {silent = true})