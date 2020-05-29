local set_var = vim.api.nvim_set_var
local get_var = vim.api.nvim_get_var
local command = vim.api.nvim_command
set_var('ale_statusline_format', {'⨉ %d', '⚠ %d', '⬥ ok'})
set_var('ale_lint_on_text_changed', 'never')
set_var('airline_powerline_fonts', 1)
set_var('gotham_airline_emphasised_insert', 0)
set_var('airline_theme', 'sonokai')
set_var('airline#extensions#tabline#enabled',  1)
set_var('ale_linters_explicit', 1)
set_var('gruvbox_contrast_dark', 'hard')

if vim.fn.has('multi_lang') then
  command("language C")
end

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
  local line = vim.fn.substitute(vim.fn.getline(fs), "\t", string.rep(' ', vim.bo.shiftwidth), 'g')
  local winSize = bufwidth()
  local lineCount = string.format("[%d lines]-----", fe-fs+1)
  return line..string.rep('-', winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount))..lineCount
end

function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    command('augroup '..group_name)
    command('autocmd!')
    for _, def in ipairs(definition) do
      local cmd = 'autocmd ' .. def
      command(cmd)
    end
    command('augroup END')
  end
end

augroups{
  numbertoggle = {
    "BufEnter,FocusGained,InsertLeave * set relativenumber",
    "BufLeave,FocusLost,InsertEnter * set norelativenumber",
  },
  filetypes = {
    "Filetype calendar IndentLinesDisable",
    "FileType * setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType make setlocal ts=8 sts=8 sw=8 noexpandtab",
    "FileType yaml setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType cpp setlocal ts=4 sts=4 sw=4 expandtab",
    "FileType vim setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType ruby setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType coffee setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType html setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType pug setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType css setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType scss setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType lisp setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType nim setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType javascript setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType slim setlocal ts=2 sts=2 sw=2 expandtab",
    "FileType go setlocal ts=2 sts=2 sw=2 noexpandtab",
    "FileType nginx setlocal ts=4 sts=4 sw=4 noexpandtab",
    "FileType csv nmap [c :RainbowAlign <CR>",
    "FileType csv nmap ]c :RainbowShrink <CR>",
    "FileType json nmap [j :call JsonBeautify() <CR>",
    "FileType rust setlocal ts=4 sts=4 sw=4 expandtab",
    "Filetype * set formatoptions-=c",
    "Filetype * set formatoptions-=r",
    "Filetype * set formatoptions-=o",
    "Filetype * set fdl=18",
    "Filetype * set fdm=indent",
    "Filetype * set fdm=indent",
    "Filetype rust set foldmethod=syntax",
    "Filetype go set foldmethod=syntax",
    "Filetype lua set foldmethod=indent",
    "Filetype cpp set foldmethod=syntax",
    "Filetype c set foldmethod=syntax",
    "Filetype json set foldmethod=syntax",
    "Filetype * set foldtext=v:lua.foldtext()",
    "Filetype * set shortmess=atToOFcA",
    "Filetype toml set fdm=expr",
    "Filetype toml set foldexpr=TOMLFold()",
    "Filetype confluencewiki setlocal fdm=expr",
    "Filetype confluencewiki setlocal fdl=0",
    "Filetype confluencewiki setlocal fdc=1",
    "BufReadPost fugitive://* set bufhidden=delete",
    "BufNewFile,BufRead *.cwk set filetype=confluencewiki",
    "BufNewFile,BufRead *.coffee set filetype=coffee",
    'BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif',
    "Filetype cpp nmap <buffer> <F7> :SCCompileAF -std=c++14 <CR>",
    "Filetype cpp nmap <buffer> <F8> :SCCompileRunAF -std=c++14 <CR>",
    "TermOpen * IndentLinesDisable",
  },
  asyncrun = {
    "QuickFixCmdPost asyncrun botright copen 8",
  },
  completion = {
    "BufEnter * lua local s, com = pcall(require, 'completion'); if s then com.on_attach() end",
    "User eskk-enable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 0)",
    "User eskk-disable-pre call v:lua.vim.api.nvim_set_var('completion_enable_auto_popup', 1)",
  },
}

set_var('fzf_layout', {
  up = '~90%',
  window = {
    width = 0.8,
    height = 0.8,
    yoffset = 0.5,
    xoffset = 0.5,
    highlight = 'Todo',
    border = 'sharp'
  }
})


set_var('fzf_colors', {
  fg      = { 'fg', 'Normal' },
  bg      = { 'bg', 'Normal' },
  hl      = { 'fg', 'Comment' },
  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
  ['hl+'] = { 'fg', 'Statement' },
  info    = { 'fg', 'PreProc' },
  border  = { 'fg', 'Ignore' },
  prompt  = { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker  = { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header  = { 'fg', 'Comment' },
})

set_var('completion_auto_change_source', 1)
set_var('vim_json_syntax_conceal', 0)
set_var('eskk#enable_completion', 0)

set_var('completion_trigger_character', {'.', '::', '->'})

set_var('sonokai_style', 'maia')
set_var('sonokai_transparent_background', 0)
command('silent! colorscheme sonokai')
set_var('neoterm_default_mod', 'belowright')
set_var('neoterm_size', '13')
