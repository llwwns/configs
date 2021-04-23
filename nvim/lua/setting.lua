--  def
local try_require = require("util").try_require
local set_var = vim.api.nvim_set_var
local get_var = vim.api.nvim_get_var
local gset_var = function(tbl)
  for key, val in pairs(tbl) do
    vim.g[key] = val
  end
end

-- options
if vim.fn.has('multi_lang') then
  vim.cmd("language C")
end
vim.o.encoding = "utf-8"
vim.o.laststatus = 2
vim.wo.winblend = 20
vim.o.pumblend = 20
vim.o.timeoutlen = 500
vim.wo.spell = true
vim.o.spelloptions = "camel"
vim.bo.spelloptions = "camel"
vim.o.spellcapcheck = ""
vim.bo.spellcapcheck = ""
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.background="dark"
--set backspace to delete indent, endo of line and before insert start
vim.o.backspace = "indent,eol,start"
--allow cursor go to next line
vim.o.whichwrap = "b,s,<,>,[,]"
-- if vim.fn.exists('+termguicolors') == 1 then
--   vim.o["t_8f"] = "\\<Esc>[38;2;%lu;%lu;%lum"
--   vim.o["t_8b"] = "\\<Esc>[48;2;%lu;%lu;%lum"
-- end
vim.o.termguicolors = true
vim.o.fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis,utf-16,utf-16le,gb2312"

vim.o.shiftwidth = 0
vim.o.tabstop = 2
vim.o.softtabstop = -1
vim.bo.shiftwidth = 0
vim.bo.tabstop = 2
vim.bo.softtabstop = -1
vim.o.expandtab = true
vim.o.autoindent = false
vim.o.updatetime = 1000
vim.wo.signcolumn = "yes"
vim.o.inccommand = "nosplit"
-- vim.o.grepprg = "git grep -I --line-number --no-color -E"
vim.o.grepprg = "rg --vimgrep"
vim.wo.wrap = false
vim.o.display = "lastline"
vim.o.pumheight = 10
vim.wo.list = true
vim.o.listchars = "tab:|-,eol:¬,extends:»,precedes:«"
-- vim.o.smarttab = true
-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noselect"
-- vim.o.completeopt = "longest,menu"
vim.o.shortmess="atToOFcA"
vim.o.sessionoptions = "blank,curdir,folds,tabpages"
vim.o.fillchars = "vert:│"
vim.o.laststatus = 2
vim.o.exrc = true
vim.o.secure = true
vim.o.hidden = true
vim.o.tags="./tags,tags;/"
local config_path=vim.fn.stdpath("config")
vim.o.spellfile=config_path .. "/spell/en.utf-8.add"

vim.cmd("filetype plugin indent on")
vim.api.nvim_exec("set guioptions-=e", false)
vim.api.nvim_exec("let $FZF_DEFAULT_COMMAND = 'fd'", false)
vim.api.nvim_exec("let $FZF_DEFAULT_OPTS='--layout=reverse'", false)
vim.cmd("sign define LspDiagnosticsSignError text=✗ texthl=ALEErrorSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text=! texthl=ALEWarningSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text=i texthl=ALEInfoSign linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text=💡 texthl=Label linehl= numhl=")
-- vim.cmd("highlight!   link   LspDiagnosticsWarning  ALEVirtualTextWarning")
-- vim.cmd("highlight!   link   LspDiagnosticsError    ALEVirtualTextError")
-- vim.cmd("highlight!   link   LspDiagnosticsInfo     ALEVirtualTextInfo")
-- vim.cmd("highlight!   link   LspDiagnosticsHint     ALEVirtualTextInfo")
-- vim.cmd("highlight!   link   BufferInactive         ALEVirtualTextInfo")

-- global variables
vim.g.mapleader="'"
vim.g.maplocalleader="'"
vim.g.ale_statusline_format = {'⨉ %d', '⚠ %d', '⬥ ok'}
vim.g.ale_lint_on_text_changed = 'never'
vim.g.airline_powerline_fonts = 1
-- vim.g.sonokai_style = 'shusia',
vim.g.sonokai_transparent_background = 0
-- airline_theme = 'sonokai'
-- vim.g.airline_theme = 'moonfly'
vim.g.airline_theme = 'nightfly'
-- airline_theme = 'onedark'
vim.g['airline#extensions#tabline#enabled'] = 0
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = '|'
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = '|'
vim.g.ale_linters_explicit = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.fzf_layout = {
  up = '~90%',
  window = {
    width = 0.8,
    height = 0.8,
    yoffset = 0.5,
    xoffset = 0.5,
    highlight = 'Todo',
    border = 'sharp'
  },
}

vim.g.fzf_colors = {
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
  }

vim.g.completion_auto_change_source = 1
vim.g.vim_json_syntax_conceal = 0
vim.g['eskk#large_dictionary'] = {
  path = '~/configs/SKK-JISYO.L',
  sorted = 1, encoding = 'euc-jp'
}

vim.g['eskk#enable_completion'] = 1

vim.g.completion_trigger_character = {'.', '::', '->'}


vim.g.neoterm_default_mod = 'belowright'
vim.g.neoterm_size = '7'

vim.g.disable_key_mappings = 1

vim.g.ale_fixers = {
  javascript = {'prettier'},
  typescript = {'prettier'},
  typescriptreact = {'prettier'},
  ruby = {'rubocop'},
  go = {'gofmt'},
  rust = {'rustfmt'}
}
vim.g.ale_linters = {
  javascript = {'eslint'},
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
  ruby = {'rubocop'},
  -- go = {'gopls'},
  c = {'clangd'},
  cpp = {'clangd'},
  -- rust = {'analyzer'},
  lua = {'luacheck'},
}
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '!'
vim.g.ale_cpp_gcc_options = '-std=c++17 -Wall -Wno-long-long -Wno-sign-compare'
vim.g.ale_go_gofmt_options = '-s'

vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeDirArrowExpandable = '▶'
vim.g.NERDTreeDirArrowCollapsible = '▼'

vim.g.extra_whitespace_ignored_filetypes = {'calendar'}
vim.g.calendar_google_calendar = 1
vim.g.EmacsCommandLineSearchCommandLineDisable = 1

vim.g['airline#extensions#tmuxline#snapshot_file'] = "~/configs/.tmuxline"

vim.g.tmuxline_preset = {
  a = '[#S]',
  win = '#I:#W#F',
  cwin = '#I:#W#F',
  x = '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0)',
  y = '%m/%d %H:%M:%S',
  z = '#H',
  options = {
    ['status-justify'] = 'left',
  },
}

vim.g.Hexokinase_highlighters = {'backgroundfull'}

vim.g.firenvim_config = {
  globalSettings = {alt = 'all'},
  localSettings = {
    ['.*'] = {
      cmdline = 'neovim',
      priority = 0,
      selector = 'textarea',
      takeover = 'never'
    }
  },
}

vim.g.asyncrun_auto = 'asyncrun'
vim.g.indentLine_conceallevel = 2
-- vim.g.indent_blankline_char = '¦'
vim.g.indent_blankline_char = '│'
vim.g.vim_json_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

vim.g.gitgutter_highlight_linenrs = 1
vim.g.rainbow_active = 1

-- vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.Illuminate_delay = 0
vim.g.signify_sign_change = '~'
-- vim.g.minimap_auto_start = 1

vim.g.tokyonight_style = "night"
-- vim.cmd('silent! colorscheme moonfly')
-- vim.cmd('silent! colorscheme nightfly')
-- vim.cmd('silent! colorscheme nvcode')
-- vim.cmd('silent! colorscheme onedark')
-- vim.cmd('silent! colorscheme embark')
vim.cmd('silent! colorscheme tokyonight')
try_require({'colorizer'}, function(colorizer)
  colorizer.setup()
end)

-- guis
if vim.fn.exists('gnvim') == 1 then
  vim.o.guifont="Iosevka Fixed:h12"
  vim.o.guicursor = vim.o.guicursor .. ",a:blinkon0"
elseif vim.fn.exists('neovide') == 1 then
  vim.o.guifont="Sarasa Nerd Font Mono:h18"
  -- set guifont=Iosevka\ Term,Sarasa\ Nerd\ Font:h17
  vim.g.neovide_cursor_animation_length=0.05
  vim.g.neovide_cursor_trail_length=0.1
  vim.api.nvim_set_keymap("n", "<A-CR>", [[:execute("let g:neovide_fullscreen = !g:neovide_fullscreen")<CR>]], { noremap = true })
elseif vim.fn.exists('g:fvim_loaded') == 1 then
  -- FVimBackgroundOpacity 0.7
  vim.o.guifont="Sarasa Nerd Font:h18"
  -- nnoremap <A-CR> :FVimToggleFullScreen<CR>
-- else
  -- "hi Normal guibg=NONE ctermbg=NONE
end
