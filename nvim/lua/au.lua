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
do
  local augid_9_ = vim.api.nvim_create_augroup("autoclose", {clear = true})
  local function _10_()
    local _11_
    if _G.__latest_id then
      _11_ = (_G.__latest_id + 1)
    else
      _11_ = 1
    end
    _G["__latest_id"] = _11_
    if (_G.is_special(vim.api.nvim_get_current_win()) and _G.all_special()) then
      local id = _G.__latest_id
      local function _13_()
        if (id == _G.__latest_id) then
          return vim.cmd("q")
        else
          return nil
        end
      end
      return vim.defer_fn(_13_, 0)
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"WinEnter"}, {callback = _10_, group = augid_9_, pattern = "*"})
end
do
  local augid_16_ = vim.api.nvim_create_augroup("visualmode", {clear = true})
  local function _17_()
    local _18_ = vim.v.event
    if ((_G.type(_18_) == "table") and ((_18_).old_mode == "\22") and ((_18_).new_mode == "i")) then
      vim.opt_local["indentkeys"] = ""
      return nil
    elseif ((_G.type(_18_) == "table") and ((_18_).old_mode == "i")) then
      vim.opt_local["indentkeys"] = "0{,0},0),0],:,0#,!^F,o,O,e"
      return nil
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"ModeChanged"}, {callback = _17_, group = augid_16_, pattern = "*"})
end
local augid_20_ = vim.api.nvim_create_augroup("filetypes", {clear = true})
local function _21_()
  vim.opt_local["spelloptions"] = "camel"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _21_, group = augid_20_, pattern = "*"})
local function _22_()
  vim.opt_local["tabstop"] = 8
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _22_, group = augid_20_, pattern = "make"})
local function _23_()
  vim.opt_local["tabstop"] = 4
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _23_, group = augid_20_, pattern = "nginx"})
local function _24_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _24_, group = augid_20_, pattern = "lua"})
local function _25_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _25_, group = augid_20_, pattern = "ruby"})
local function _26_()
  vim.opt_local["expandtab"] = false
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.keymap.set({"n"}, "<leader>cr", "<cmd>!go run %<CR>", {buffer = true, silent = false})
  local function _27_()
    return (require("dap-go")).debug_test()
  end
  vim.keymap.set({"n"}, "<leader>td", _27_, {silent = true})
  do end (vim.b)["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _26_, group = augid_20_, pattern = "go"})
local function _28_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.keymap.set({"n"}, "<leader>cm", "<cmd>!clang++ -std=c++17 -g3 % <CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "<leader>cr", "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _28_, group = augid_20_, pattern = {"cpp", "c"}})
local function _29_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _29_, group = augid_20_, pattern = "rust"})
local function _30_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _30_, group = augid_20_, pattern = "rust"})
local function _31_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return vim.keymap.set({"n"}, "[j", vim.fn.JsonBeautify, {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _31_, group = augid_20_, pattern = "json"})
local function _32_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _32_, group = augid_20_, pattern = {"toml", "yaml"}})
local function _33_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _33_, group = augid_20_, pattern = {"javascript", "javascript.jsx", "typescript", "typescriptreact"}})
local function _34_()
  vim.opt_local["tabstop"] = 4
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _34_, group = augid_20_, pattern = "autohotkey"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=csv", group = augid_20_, pattern = {"*.tsv", "*.csv"}})
local function _35_()
  vim.keymap.set({"n"}, "[c", "<cmd>RainbowAlign<CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "]c", "<cmd>RainbowShrink<CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _35_, group = augid_20_, pattern = "csv"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=cue", group = augid_20_, pattern = {"*.cue"}})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=todo", group = augid_20_, pattern = {"todo.txt"}})
local function _36_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _36_, group = augid_20_, pattern = "proto"})
local function _37_()
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _37_, group = augid_20_, pattern = {"sh", "fish"}})
local function _38_()
  local function _39_()
    return (require("peek")).open()
  end
  vim.keymap.set({"n"}, "<leader>po", _39_, {silent = true})
  local function _40_()
    return (require("peek")).close()
  end
  return vim.keymap.set({"n"}, "<leader>pc", _40_, {silent = true})
end
return vim.api.nvim_create_autocmd({"FileType"}, {callback = _38_, group = augid_20_, pattern = {"markdown"}})