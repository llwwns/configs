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

function toggleNERDTree()
    if vim.fn.exists('g:NERDTree') == 0 or
      vim.api.nvim_exec("echo g:NERDTree.ExistsForTab()", true) == "0" or
      vim.api.nvim_exec("echo g:NERDTree.IsOpen()", true) == "0" then
      if vim.fn.expand('%:p') == "" then
        vim.cmd("NERDTreeToggle")
      else
        vim.cmd("NERDTreeFind")
      end
    else
      vim.cmd("NERDTreeToggle")
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
