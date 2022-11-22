-- :fennel:generated
local function bufwidth()
  local width = vim.fn.winwidth(0)
  local wo = vim.wo
  local numwidth
  if (wo.number or wo.relativenumber) then
    numwidth = wo.numberwidth
  else
    numwidth = 0
  end
  local foldwidth = wo.foldcolumn
  local signwidth
  do
    local _2_ = wo.signcolumn
    if (_2_ == "yes") then
      signwidth = 2
    elseif (_2_ == "auto") then
      local signs = vim.fn.execute(string.format("sign place buffer=%d", vim.fn.bufnr("")))
      if (#vim.fn.split(signs, "\n") > 2) then
        signwidth = 2
      else
        signwidth = 0
      end
    elseif true then
      local _ = _2_
      signwidth = 0
    else
      signwidth = nil
    end
  end
  return (width - (numwidth + foldwidth + signwidth))
end
_G.foldtext = function()
  local fs = vim.api.nvim_get_vvar("foldstart")
  local fe = vim.api.nvim_get_vvar("foldend")
  local line = vim.fn.substitute(vim.fn.getline(fs), "\9", string.rep(" ", vim.bo.tabstop), "g")
  local winSize = bufwidth()
  local lineCount = string.format("[%d lines]-----", ((fe - fs) + 1))
  return (line .. string.rep("-", (winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount))) .. lineCount)
end
_G.foldtext2 = function()
  if vim.o.diff then
    return _G.foldtext()
  else
    local fs = vim.api.nvim_get_vvar("foldstart")
    local fe = vim.api.nvim_get_vvar("foldend")
    local ls = vim.fn.substitute(vim.fn.getline(fs), "\9", string.rep(" ", vim.bo.tabstop), "g")
    local le = vim.fn.getline(fe)
    return (ls .. "..." .. vim.fn.trim(le))
  end
end
_G.toggleNvimTree = function()
  local nt = require("nvim-tree")
  local view = require("nvim-tree.view")
  if not view.is_visible then
    if (function(_6_,_7_,_8_) return (_6_ == _7_) and (_7_ == _8_) end)(vim.fn.expand,"%:p","") then
      return nt.open()
    else
      return nt.find_file(true)
    end
  else
    return view.close()
  end
end
_G.replace = function()
  local w = vim.fn.expand("<cword>")
  return vim.cmd(("call feedkeys(\":%s/" .. w .. "/" .. w .. "/g\\<Left>\\<Left>\")"))
end
_G.tomlFold = function()
  local line = vim.fn.getline(vim.v.lnum)
  if ((line == "") or (line:byte() == ("["):byte())) then
    return "0"
  else
    return "1"
  end
end
_G.showDocumentation = function()
  local _12_ = vim.bo.filetype
  if (_12_ == "vim") then
    return vim.cmd(("h " .. vim.fn.expand("<cword>")))
  elseif true then
    local _ = _12_
    return vim.lsp.buf.hover()
  else
    return nil
  end
end
_G.dump = function(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  return print(unpack(objects))
end
_G.toggle_format = function()
  if vim.b.format_on_save then
    vim.b["format_on_save"] = false
    return vim.notify("turn off auto format")
  else
    vim.b["format_on_save"] = true
    return vim.notify("turn on auto format")
  end
end
_G.lsp_format = function()
  if vim.b.format_on_save then
    return vim.lsp.buf.format()
  else
    return nil
  end
end
local function is_floating(win)
  local cfg = vim.api.nvim_win_get_config(win)
  if ((cfg.relative > "") or cfg.external) then
    return true
  else
    return false
  end
end
_G.is_special = function(window)
  local function _17_()
    local buf = vim.api.nvim_win_get_buf(window)
    return vim.tbl_contains({"dapui_watches", "dap-repl", "qf", "neo-tree", "DiffViewFiles"}, vim.api.nvim_buf_get_option(buf, "filetype"))
  end
  return (is_floating(window) or _17_())
end
_G.all_special = function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local ret = true
  for i, w in ipairs(wins) do
    ret = (ret and _G.is_special(w))
  end
  return ret
end
return _G.all_special