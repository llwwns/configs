-- :fennel:generated
do
  local augid_1_ = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
  local function _2_()
    return vim.highlight.on_yank({higroup = "Visual", timeout = 200})
  end
  vim.api.nvim_create_autocmd({"TextYankPost"}, {callback = _2_, group = augid_1_, pattern = "*"})
end
do
  local augid_3_ = vim.api.nvim_create_augroup("buf_large", {clear = true})
  local function _4_()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if (ok and stats and (stats.size > 1000000)) then
      vim.b["large_buf"] = true
      vim.cmd("syntax off")
      vim.cmd("IlluminatePauseBuf")
      vim.cmd("IndentBlanklineDisable")
      vim.cmd("NoMatchParen")
      do end (vim.opt_local)["foldmethod"] = "manual"
      vim.opt_local["spell"] = false
      return nil
    else
      vim.b["large_buf"] = false
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"BufReadPre"}, {callback = _4_, group = augid_3_, pattern = "*"})
end
do
  local augid_6_ = vim.api.nvim_create_augroup("fugitive_buf", {clear = true})
  vim.api.nvim_create_autocmd({"BufReadPost"}, {command = "set bufhidden=delete", group = augid_6_, pattern = "fugitive://*"})
end
do
  local augid_7_ = vim.api.nvim_create_augroup("term", {clear = true})
  vim.api.nvim_create_autocmd({"TermOpen"}, {command = "IndentBlanklineDisable", group = augid_7_, pattern = "*"})
end
do
  local augid_8_ = vim.api.nvim_create_augroup("autoclose", {clear = true})
  local function _9_()
    local _10_
    if _G.__latest_id then
      _10_ = (_G.__latest_id + 1)
    else
      _10_ = 1
    end
    _G["__latest_id"] = _10_
    if (_G.is_special(vim.api.nvim_get_current_win()) and _G.all_special()) then
      local id = _G.__latest_id
      local function _12_()
        if (id == _G.__latest_id) then
          return vim.cmd("q")
        else
          return nil
        end
      end
      return vim.defer_fn(_12_, 0)
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"WinEnter"}, {callback = _9_, group = augid_8_, pattern = "*"})
end
do
  local augid_15_ = vim.api.nvim_create_augroup("visualmode", {clear = true})
  local function _16_()
    local _17_ = vim.v.event
    if ((_G.type(_17_) == "table") and ((_17_).new_mode == "i") and ((_17_).old_mode == "\22")) then
      vim.opt_local["indentkeys"] = ""
      return nil
    elseif ((_G.type(_17_) == "table") and ((_17_).old_mode == "i")) then
      vim.opt_local["indentkeys"] = "0{,0},0),0],:,0#,!^F,o,O,e"
      return nil
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd({"ModeChanged"}, {callback = _16_, group = augid_15_, pattern = "*"})
end
local augid_19_ = vim.api.nvim_create_augroup("filetypes", {clear = true})
local function _20_()
  vim.opt_local["tabstop"] = 8
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _20_, group = augid_19_, pattern = "make"})
local function _21_()
  vim.opt_local["conceallevel"] = 0
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _21_, group = augid_19_, pattern = "help"})
local function _22_()
  vim.opt_local["tabstop"] = 4
  vim.opt_local["expandtab"] = false
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _22_, group = augid_19_, pattern = "nginx"})
local function _23_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _23_, group = augid_19_, pattern = "lua"})
local function _25_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _25_, group = augid_19_, pattern = "ruby"})
local function _27_()
  vim.opt_local["expandtab"] = false
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.keymap.set({"n"}, "<leader>cr", "<cmd>!go run %<CR>", {buffer = true, silent = false})
  local function _29_()
    return (require("dap-go")).debug_test()
  end
  vim.keymap.set({"n"}, "<leader>td", _29_, {silent = true})
  do end (vim.b)["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _27_, group = augid_19_, pattern = "go"})
local function _30_()
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
vim.api.nvim_create_autocmd({"FileType"}, {callback = _30_, group = augid_19_, pattern = {"cpp", "c"}})
local function _32_()
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
vim.api.nvim_create_autocmd({"FileType"}, {callback = _32_, group = augid_19_, pattern = "rust"})
local function _34_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  local function _36_()
    return vim.cmd("%!prettier --parser json")
  end
  vim.keymap.set({"n"}, "[j", _36_, {buffer = true, silent = false})
  local function _37_()
    return vim.cmd("%!jq -c")
  end
  return vim.keymap.set({"n"}, "]j", _37_, {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _34_, group = augid_19_, pattern = "json"})
local function _38_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _38_, group = augid_19_, pattern = {"toml", "yaml"}})
local function _40_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.b["format_on_save"] = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _40_, group = augid_19_, pattern = {"javascript", "javascript.jsx", "typescript", "typescriptreact"}})
local function _42_()
  vim.opt_local["tabstop"] = 4
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _42_, group = augid_19_, pattern = "autohotkey"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=csv", group = augid_19_, pattern = {"*.tsv", "*.csv"}})
local function _43_()
  if vim.b.large_buf then
    return
  else
  end
  vim.keymap.set({"n"}, "[c", "<cmd>RainbowAlign<CR>", {buffer = true, silent = false})
  return vim.keymap.set({"n"}, "]c", "<cmd>RainbowShrink<CR>", {buffer = true, silent = false})
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _43_, group = augid_19_, pattern = "csv"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=cue", group = augid_19_, pattern = {"*.cue"}})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {command = "set filetype=todo", group = augid_19_, pattern = {"todo.txt"}})
local function _45_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _45_, group = augid_19_, pattern = "proto"})
local function _47_()
  if vim.b.large_buf then
    return
  else
  end
  vim.opt_local["foldmethod"] = "expr"
  vim.opt_local["foldexpr"] = "nvim_treesitter#foldexpr()"
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _47_, group = augid_19_, pattern = {"sh", "fish"}})
local function _49_()
  local function _50_()
    return (require("peek")).open()
  end
  vim.keymap.set({"n"}, "<leader>po", _50_, {silent = true})
  local function _51_()
    return (require("peek")).close()
  end
  return vim.keymap.set({"n"}, "<leader>pc", _51_, {silent = true})
end
return vim.api.nvim_create_autocmd({"FileType"}, {callback = _49_, group = augid_19_, pattern = {"markdown"}})