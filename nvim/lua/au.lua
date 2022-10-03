-- :fennel:generated
do
  local augid_1_ = vim.api.nvim_create_augroup("numbertoggle", {clear = true})
  local function _2_()
    vim.opt["relativenumber"] = true
    return nil
  end
  vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {callback = _2_, group = augid_1_, pattern = "*"})
  local function _3_()
    vim.opt["relativenumber"] = false
    return nil
  end
  vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {callback = _3_, group = augid_1_, pattern = "*"})
end
do
  local augid_4_ = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
  local function _5_()
    return vim.highlight.on_yank({higroup = "Visual", timeout = 200})
  end
  vim.api.nvim_create_autocmd({"TextYankPost"}, {callback = _5_, group = augid_4_, pattern = "*"})
end
do
  local augid_6_ = vim.api.nvim_create_augroup("buf_large", {clear = true})
  vim.api.nvim_create_autocmd({"BufReadPre"}, {command = "if getfsize(expand('%')) > 10000000 | syntax off | endif", group = augid_6_, pattern = "*"})
end
do
  local augid_7_ = vim.api.nvim_create_augroup("fugitive_buf", {clear = true})
  vim.api.nvim_create_autocmd({"BufReadPost"}, {command = "set bufhidden=delete", group = augid_7_, pattern = "fugitive://*"})
end
do
  local augid_8_ = vim.api.nvim_create_augroup("term", {clear = true})
  vim.api.nvim_create_autocmd({"TermOpen"}, {command = "IndentBlanklineDisable", group = augid_8_, pattern = "*"})
end
local augid_9_ = vim.api.nvim_create_augroup("filetypes", {clear = true})
local function _10_()
  vim.opt_local["spelloptions"] = "camel"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _10_, group = augid_9_, pattern = "*"})
local function _11_()
  vim.opt_local["tabstop"] = 8
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _11_, group = augid_9_, pattern = "make"})
local function _12_()
  vim.opt_local["tabstop"] = 4
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _12_, group = augid_9_, pattern = "nginx"})
local function _13_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _13_, group = augid_9_, pattern = "lua"})
local function _14_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _14_, group = augid_9_, pattern = "ruby"})
local function _15_()
  vim.opt_local["expandtab"] = false
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.keymap.set({"n"}, "<leader>cr", "<cmd>!go run %<CR>", {buffer = true, silent = false})
  local function _16_()
    return (require("dap-go")).debug_test()
  end
  vim.keymap.set({"n"}, "<leader>td", _16_, {silent = true})
  do end (vim.b)["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _15_, group = augid_9_, pattern = "go"})
local function _17_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.keymap.set({"n"}, "<leader>cm", "<cmd>!clang++ -std=c++17 -g3 % <CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "<leader>cr", "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _17_, group = augid_9_, pattern = {"cpp", "c"}})
local function _18_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _18_, group = augid_9_, pattern = "rust"})
local function _19_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _19_, group = augid_9_, pattern = "rust"})
local function _20_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return vim.keymap.set({"n"}, "[j", vim.fn.JsonBeautify, {buffer = true, desc = {}, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _20_, group = augid_9_, pattern = "json"})
local function _21_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _21_, group = augid_9_, pattern = {"toml", "yaml"}})
local function _22_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _22_, group = augid_9_, pattern = {"javascript", "javascript.jsx", "typescript", "typescriptreact"}})
local function _23_()
  vim.opt_local["tabstop"] = 4
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _23_, group = augid_9_, pattern = "autohotkey"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=csv", group = augid_9_, pattern = {"*.tsv", "*.csv"}})
local function _24_()
  vim.keymap.set({"n"}, "[c", "<cmd>RainbowAlign<CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "]c", "<cmd>RainbowShrink<CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _24_, group = augid_9_, pattern = "csv"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=cue", group = augid_9_, pattern = {"*.cue"}})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=todo", group = augid_9_, pattern = {"todo.txt"}})
local function _25_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _25_, group = augid_9_, pattern = "proto"})
local function _26_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
return vim.api.nvim_create_autocmd({"FileType"}, {callback = _26_, group = augid_9_, pattern = {"sh", "fish"}})