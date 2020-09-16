local set_var = vim.api.nvim_set_var
local get_var = vim.api.nvim_get_var
local command = vim.api.nvim_command
local gset_var = function(tbl)
  for key, val in pairs(tbl) do
    set_var(key, val)
  end
end
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
  local lineCount = string.format("[%d lines]-----", fe - fs + 1)
  return line .. string.rep('-', winSize - vim.fn.strdisplaywidth(line) - vim.fn.strdisplaywidth(lineCount)) ..
           lineCount
end

function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    command('augroup ' .. group_name)
    command('autocmd!')
    for _, def in ipairs(definition) do
      local cmd = 'autocmd ' .. def
      command(cmd)
    end
    command('augroup END')
  end
end

augroups {
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
    "FileType * set formatoptions-=c",
    "FileType * set formatoptions-=r",
    "FileType * set formatoptions-=o",
    "FileType * set fdl=18",
    "FileType * set fdm=indent",
    "FileType * set fdm=indent",
    "FileType rust set foldmethod=indent",
    "FileType go set foldmethod=indent",
    "FileType lua set foldmethod=indent",
    "FileType cpp set foldmethod=indent",
    "FileType c set foldmethod=indent",
    "FileType json set foldmethod=indent",
    "FileType * set foldtext=v:lua.foldtext()",
    "FileType * set shortmess=atToOFcA",
    "FileType toml set fdm=expr",
    "FileType toml set foldexpr=TOMLFold()",
    "FileType confluencewiki setlocal fdm=expr",
    "FileType confluencewiki setlocal fdl=0",
    "FileType confluencewiki setlocal fdc=1",
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
  highlight_yank = {
    'TextYankPost * silent! lua require"vim.highlight".on_yank("Visual", 200)'
  },
}

gset_var {
  ale_statusline_format = {'⨉ %d', '⚠ %d', '⬥ ok'},
  ale_lint_on_text_changed = 'never',
  airline_powerline_fonts = 1,
  -- sonokai_style = 'shusia',
  sonokai_transparent_background = 0,
  airline_theme = 'sonokai',
  ['airline#extensions#tabline#enabled'] = 0,
  ale_linters_explicit = 1,
  gruvbox_contrast_dark = 'hard',
  fzf_layout = {
    up = '~90%',
    window = {
      width = 0.8,
      height = 0.8,
      yoffset = 0.5,
      xoffset = 0.5,
      highlight = 'Todo',
      border = 'sharp'
    },
  },
  fzf_colors = {
    fg = {'fg', 'Normal'},
    bg = {'bg', 'Normal'},
    hl = {'fg', 'Comment'},
    ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
    ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
    ['hl+'] = {'fg', 'Statement'},
    info = {'fg', 'PreProc'},
    border = {'fg', 'Ignore'},
    prompt = {'fg', 'Conditional'},
    pointer = {'fg', 'Exception'},
    marker = {'fg', 'Keyword'},
    spinner = {'fg', 'Label'},
    header = {'fg', 'Comment'},
  },

  completion_auto_change_source = 1,
  vim_json_syntax_conceal = 0,
  ['eskk#large_dictionary'] = {path = '~/configs/SKK-JISYO.L', sorted = 1, encoding = 'euc-jp'},
  ['eskk#enable_completion'] = 1,

  completion_trigger_character = {'.', '::', '->'},


  neoterm_default_mod = 'belowright',
  neoterm_size = '13',

  disable_key_mappings = 1,

  ale_fixers = {
    javascript = {'prettier'},
    typescript = {'eslint'},
    typescriptreact = {'eslint'},
    ruby = {'rubocop'},
    go = {'gofmt'},
    rust = {'rustfmt'}
  },
  ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    ruby = {'rubocop'},
    -- go = {'gopls'},
    c = {'clangd'},
    cpp = {'clangd'},
    -- rust = {'analyzer'},
    lua = {'luacheck'},
  },
  ale_fix_on_save = 1,
  ale_sign_error = '✗',
  ale_sign_warning = '!',
  ale_cpp_gcc_options = '-std=c++17 -Wall -Wno-long-long -Wno-sign-compare',
  ale_go_gofmt_options = '-s',

  NERDTreeDirArrows = 1,
  NERDTreeDirArrowExpandable = '▶',
  NERDTreeDirArrowCollapsible = '▼',
  polyglot_disabled = {'csv', 'ruby'},

  extra_whitespace_ignored_filetypes = {'calendar'},
  calendar_google_calendar = 1,
  EmacsCommandLineSearchCommandLineDisable = 1,

  ['airline#extensions#tmuxline#snapshot_file'] = "~/configs/.tmuxline",

  tmuxline_preset = {
    a = '[#S]',
    win = '#I:#W#F',
    cwin = '#I:#W#F',
    x = '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0)',
    y = '%m/%d %H:%M:%S',
    z = '#H',
    options = {
      ['status-justify'] = 'left',
    },
  },

  Hexokinase_highlighters = {'backgroundfull'},

  firenvim_config = {
    globalSettings = {alt = 'all'},
    localSettings = {['.*'] = {cmdline = 'neovim', priority = 0, selector = 'textarea', takeover = 'never'}},
  },

  asyncrun_auto = 'asyncrun',
  indentLine_conceallevel = 2,
  indent_blankline_char = '¦',
  vim_json_conceal = 0,
  vim_markdown_conceal = 0,
  vim_markdown_conceal_code_blocks = 0,

  gitgutter_highlight_linenrs = 1,
  rainbow_active = 1,
}

command('silent! colorscheme sonokai')
local ok, colorizer = pcall(require, 'colorizer')
if ok then
  colorizer.setup()
end
