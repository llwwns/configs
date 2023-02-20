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
    local sc = wo.signcolumn
    if (sc == "yes") then
      signwidth = 2
    elseif (sc == "auto") then
      local signs = vim.fn.execute(string.format("sign place buffer=%d", vim.fn.bufnr("")))
      if (#vim.fn.split(signs, "\n") > 2) then
        signwidth = 2
      else
        signwidth = 0
      end
    elseif true then
      local _ = sc
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

_G.replace = function()
  local w = vim.fn.expand("<cword>")
  vim.cmd(("call feedkeys(\":%s/" .. w .. "/" .. w .. "/g\\<Left>\\<Left>\")"))
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
  if (ft == vim.bo.filetype) then
    vim.cmd(("h " .. vim.fn.expand("<cword>")))
  else
    vim.lsp.buf.hover()
  end
end

_G.dump = function(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  return print(unpack(objects))
end

_G.toggle_format = function()
  if vim.b.format_on_save then
    vim.b.format_on_save = false
    vim.notify("turn off auto format")
  else
    vim.b.format_on_save = true
    vim.notify("turn on auto format")
  end
end

_G.lsp_format = function()
  if (vim.b.format_on_save and not vim.b.large_buf) then
    vim.lsp.buf.format()
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
  local buf = vim.api.nvim_win_get_buf(window)
  return is_floating(window) or vim.tbl_contains({
        "dapui_watches", "dap-repl", "qf", "neo-tree", "DiffViewFiles",
      }, vim.api.nvim_buf_get_option(buf, "filetype"))
end

_G.all_special = function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, w in ipairs(wins) do
    if not _G.is_special(w) then
      return false
    end
  end
  return true
end

_G.line_mark = function()
  if vim.wo.number then
    if (vim.v.relnum == 0) then
      return "%l"
    else
      return "%r"
    end
  else
    return ""
  end
end

_G.fold_mark = function()
  local cl = vim.fn.foldlevel(vim.v.lnum)
  local pl = vim.fn.foldlevel((vim.v.lnum - 1))
  local nl = vim.fn.foldlevel((vim.v.lnum + 1))
  if ((cl > pl) and (nl == cl)) then
    if (vim.fn.foldclosed(vim.v.lnum) == -1) then
      return ""
    else
      return ""
    end
  elseif ((nl < cl) and (pl == cl)) then
    return ""
  elseif (cl > 2) then
    return "┃"
  elseif (cl > 1) then
    return "║"
  elseif (cl > 0) then
    return "│"
  else
    return " "
  end
end
return _G.fold_mark
