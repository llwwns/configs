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
  if sc == 'yes' then
    signwidth = 2
  elseif sc == 'auto' then
    local signs = vim.fn.execute(string.format("sign place buffer=%d", vim.fn.bufnr("")))
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
  local fs = vim.api.nvim_get_vvar("foldstart")
  local fe = vim.api.nvim_get_vvar("foldend")
  local line = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(' ', vim.bo.tabstop), 'g')
  local winSize = bufwidth()
  local lineCount = string.format("[%d lines]-----", fe - fs + 1)
  return line .. string.rep('-', winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount)) ..
           lineCount
end

function foldtext2()
  if vim.o.diff then
    return foldtext()
  end
  local fs = vim.api.nvim_get_vvar("foldstart")
  local fe = vim.api.nvim_get_vvar("foldend")
  local ls = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(' ', vim.bo.tabstop), 'g')
  local le = vim.fn.getline(fe)
  return ls.."..."..vim.fn.trim(le)
end

function toggleNvimTree()
  local nt = require'nvim-tree'
  local view = require'nvim-tree.view'
  if not view.win_open() then
    if vim.fn.expand('%:p') == "" then
      nt.open()
    else
      nt.find_file(true)
    end
  else
    nt.close()
  end
end

function replace()
  w = vim.fn.expand("<cword>")
  vim.cmd([[call feedkeys(":%s/]] .. w .. [[/]] .. w .. [[/g\<Left>\<Left>")]])
end

tomlr = vim.regex([[^($|\[)]])

vim.api.nvim_exec([[
function! TOMLFold()
  let line = getline(v:lnum)
  if line =~? '\v^($|[)'
    return '0'
  endif
  return '1'
endfunction
]], false)

vim.api.nvim_exec([[
function! ShowDocumentation()
  if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction
]], false)

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
