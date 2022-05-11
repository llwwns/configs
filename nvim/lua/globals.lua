local bufwidth = function()
  local width = vim.fn.winwidth(0)
  local numwidth = 0
  local wo = vim.wo
  if wo.number or wo.relativenumber then
    numwidth = wo.numberwidth
  end
  local foldwidth = wo.foldcolumn
  local sc = wo.signcolumn
  local signwidth = 0
  if sc == "yes" then
    signwidth = 2
  elseif sc == "auto" then
    local signs = vim.fn.execute(string.format("sign place buffer=%d", vim.fn.bufnr ""))
    signs = vim.fn.split(signs, "\n")
    if #signs > 2 then
      signwidth = 2
    else
      signwidth = 0
    end
  end
  return width - numwidth - foldwidth - signwidth
end

function foldtext()
  local fs = vim.api.nvim_get_vvar "foldstart"
  local fe = vim.api.nvim_get_vvar "foldend"
  local line = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(" ", vim.bo.tabstop), "g")
  local winSize = bufwidth()
  local lineCount = string.format("[%d lines]-----", fe - fs + 1)
  return line
    .. string.rep("-", winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount))
    .. lineCount
end

function foldtext2()
  if vim.o.diff then
    return foldtext()
  end
  local fs = vim.api.nvim_get_vvar "foldstart"
  local fe = vim.api.nvim_get_vvar "foldend"
  local ls = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(" ", vim.bo.tabstop), "g")
  local le = vim.fn.getline(fe)
  return ls .. "..." .. vim.fn.trim(le)
end

function toggleNvimTree()
  local nt = require "nvim-tree"
  local view = require "nvim-tree.view"
  if not view.is_visible() then
    if vim.fn.expand "%:p" == "" then
      nt.open()
    else
      nt.find_file(true)
    end
  else
    view.close()
  end
end

function replace()
  local w = vim.fn.expand "<cword>"
  vim.cmd([[call feedkeys(":%s/]] .. w .. [[/]] .. w .. [[/g\<Left>\<Left>")]])
end

function tomlFold()
  local line = vim.fn.getline(vim.v.lnum)
  if line == "" or line:byte() == ("["):byte() then
    return "0"
  end
  return "1"
end

function showDocumentation()
  if vim.bo.filetype == "vim" then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  else
    vim.lsp.buf.hover()
  end
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

function toggle_format()
  if vim.b.format_on_save then
    vim.b.format_on_save = false
    print "turn off auto format"
  else
    vim.b.format_on_save = true
    print "turn on auto format"
  end
end

function lsp_format()
  if vim.b.format_on_save then
    vim.lsp.buf.formatting_sync()
  end
end

function map_pairs(map, cmd)
  local umap = map:gsub(".", string.upper)
  vim.keymap.set("n", "]" .. map, "<cmd>" .. cmd .. "next<CR>", {})
  vim.keymap.set("n", "[" .. map, "<cmd>" .. cmd .. "previous<CR>", {})
  vim.keymap.set("n", "[" .. umap, "<cmd>" .. cmd .. "first<CR>", {})
  vim.keymap.set("n", "]" .. umap, "<cmd>" .. cmd .. "last<CR>", {})
end
