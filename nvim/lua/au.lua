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
  local function _7_()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if (ok and stats and (stats.size > 1000000)) then
      vim.b["large_buf"] = true
      vim.cmd("syntax off")
      vim.cmd("IlluminatePauseBuf")
      vim.cmd("IndentBlanklineDisable")
      do end (vim.opt_local)["foldmethod"] = "manual"
      return nil
    else
      vim.b["large_buf"] = false
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"BufReadPre"}, {callback = _7_, group = augid_6_, pattern = "*"})
end
do
  local augid_9_ = vim.api.nvim_create_augroup("fugitive_buf", {clear = true})
  vim.api.nvim_create_autocmd({"BufReadPost"}, {command = "set bufhidden=delete", group = augid_9_, pattern = "fugitive://*"})
end
do
  local augid_10_ = vim.api.nvim_create_augroup("term", {clear = true})
  vim.api.nvim_create_autocmd({"TermOpen"}, {command = "IndentBlanklineDisable", group = augid_10_, pattern = "*"})
end
do
  local augid_11_ = vim.api.nvim_create_augroup("autoclose", {clear = true})
  local function _12_()
    local _13_
    if _G.__latest_id then
      _13_ = (_G.__latest_id + 1)
    else
      _13_ = 1
    end
    _G["__latest_id"] = _13_
    if (_G.is_special(vim.api.nvim_get_current_win()) and _G.all_special()) then
      local id = _G.__latest_id
      local function _15_()
        if (id == _G.__latest_id) then
          return vim.cmd("q")
        else
          return nil
        end
      end
      return vim.defer_fn(_15_, 0)
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"WinEnter"}, {callback = _12_, group = augid_11_, pattern = "*"})
end
do
  local augid_18_ = vim.api.nvim_create_augroup("visualmode", {clear = true})
  local function _19_()
    local _20_ = vim.v.event
    if ((_G.type(_20_) == "table") and ((_20_).old_mode == "\22") and ((_20_).new_mode == "i")) then
      vim.opt_local["indentkeys"] = ""
      return nil
    elseif ((_G.type(_20_) == "table") and ((_20_).old_mode == "i")) then
      vim.opt_local["indentkeys"] = "0{,0},0),0],:,0#,!^F,o,O,e"
      return nil
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"ModeChanged"}, {callback = _19_, group = augid_18_, pattern = "*"})
end
local augid_22_ = vim.api.nvim_create_augroup("filetypes", {clear = true})
local function _23_()
  vim.opt_local["spelloptions"] = "camel"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _23_, group = augid_22_, pattern = "*"})
local function _24_()
  vim.opt_local["tabstop"] = 8
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _24_, group = augid_22_, pattern = "make"})
local function _25_()
  vim.opt_local["tabstop"] = 4
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _25_, group = augid_22_, pattern = "nginx"})
local function _26_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _26_, group = augid_22_, pattern = "lua"})
local function _28_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _28_, group = augid_22_, pattern = "ruby"})
local function _30_()
  vim.opt_local["expandtab"] = false
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.keymap.set({"n"}, "<leader>cr", "<cmd>!go run %<CR>", {buffer = true, silent = false})
  local function _32_()
    return (require("dap-go")).debug_test()
  end
  vim.keymap.set({"n"}, "<leader>td", _32_, {silent = true})
  do end (vim.b)["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _30_, group = augid_22_, pattern = "go"})
local function _33_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.keymap.set({"n"}, "<leader>cm", "<cmd>!clang++ -std=c++17 -g3 % <CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "<leader>cr", "<cmd>!clang++ -std=c++17 -g3 % && ./a.out <CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _33_, group = augid_22_, pattern = {"cpp", "c"}})
local function _35_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt_local["tabstop"] = 4
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _35_, group = augid_22_, pattern = "rust"})
local function _37_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return vim.keymap.set({"n"}, "[j", vim.fn.JsonBeautify, {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _37_, group = augid_22_, pattern = "json"})
local function _39_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _39_, group = augid_22_, pattern = {"toml", "yaml"}})
local function _41_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _41_, group = augid_22_, pattern = {"javascript", "javascript.jsx", "typescript", "typescriptreact"}})
local function _43_()
  vim.opt_local["tabstop"] = 4
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _43_, group = augid_22_, pattern = "autohotkey"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=csv", group = augid_22_, pattern = {"*.tsv", "*.csv"}})
local function _44_()
  if vim.b.large_buf then
    return
  else
  end
  vim.keymap.set({"n"}, "[c", "<cmd>RainbowAlign<CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "]c", "<cmd>RainbowShrink<CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _44_, group = augid_22_, pattern = "csv"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=cue", group = augid_22_, pattern = {"*.cue"}})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=todo", group = augid_22_, pattern = {"todo.txt"}})
local function _46_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _46_, group = augid_22_, pattern = "proto"})
local function _48_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _48_, group = augid_22_, pattern = {"sh", "fish"}})
local function _50_()
  local function _51_()
    return (require("peek")).open()
  end
  vim.keymap.set({"n"}, "<leader>po", _51_, {silent = true})
  local function _52_()
    return (require("peek")).close()
  end
  return vim.keymap.set({"n"}, "<leader>pc", _52_, {silent = true})
end
return vim.api.nvim_create_autocmd({"FileType"}, {callback = _50_, group = augid_22_, pattern = {"markdown"}})